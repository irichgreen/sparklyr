#' Spark ML -- Alternating Least Squares (ALS) matrix factorization.
#'
#' Perform alternating least squares matrix factorization on a Spark DataFrame.
#'
#' @template roxlate-ml-x
#' @param rating.column The name of the column containing ratings.
#' @param user.column The name of the column containing user IDs.
#' @param item.column The name of the column containing item IDs.
#' @param rank Rank of the factorization.
#' @param regularization.parameter The regularization parameter.
#' @template roxlate-ml-max-iter
#' @template roxlate-ml-dots
#'
#' @family Spark ML routines
#'
#' @export
ml_als_factorization <- function(x,
                                 rating.column = "rating",
                                 user.column = "user",
                                 item.column = "item",
                                 rank = 10L,
                                 regularization.parameter = 0.1,
                                 max.iter = 10L,
                                 ...)
{
  df <- spark_dataframe(x)
  sc <- spark_connection(df)

  rating.column <- ensure_scalar_character(rating.column)
  user.column <- ensure_scalar_character(user.column)
  item.column <- ensure_scalar_character(item.column)
  rank <- ensure_scalar_integer(rank)
  regularization.parameter <- ensure_scalar_double(regularization.parameter)
  max.iter <- ensure_scalar_integer(max.iter)
  only_model <- ensure_scalar_boolean(list(...)$only_model, default = FALSE)

  envir <- new.env(parent = emptyenv())
  envir$model <- "org.apache.spark.ml.recommendation.ALS"
  als <- invoke_new(sc, envir$model)

  model <- als %>%
    invoke("setRatingCol", rating.column) %>%
    invoke("setUserCol", user.column) %>%
    invoke("setItemCol", item.column) %>%
    invoke("setRank", rank) %>%
    invoke("setRegParam", regularization.parameter) %>%
    invoke("setMaxIter", max.iter)

  if (only_model)
    return(model)

  fit <- invoke(model, "fit", df)

  extract_factors <- function(fit, element) {
    factors <- invoke(fit, element)
    id <- sdf_read_column(factors, "id")
    features <- sdf_read_column(factors, "features")
    transposed <- transpose_list(features)
    names(transposed) <- sprintf("V%s", seq_along(transposed))
    df <- cbind(
      id,
      as.data.frame(transposed, stringsAsFactors = FALSE)
    )
    result <- df[order(df$id), , drop = FALSE]
    rownames(result) <- NULL
    result
  }

  item.factors <- extract_factors(fit, "itemFactors")
  user.factors <- extract_factors(fit, "userFactors")

  ml_model("als_factorization", fit,
    item.factors = item.factors,
    user.factors = user.factors,
    model.parameters = as.list(envir)
  )
}
