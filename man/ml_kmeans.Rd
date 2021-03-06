% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ml_kmeans.R
\name{ml_kmeans}
\alias{ml_kmeans}
\title{Spark ML -- K-Means Clustering}
\usage{
ml_kmeans(x, centers, max.iter = 100, features = dplyr::tbl_vars(x), ...)
}
\arguments{
\item{x}{An object coercable to a Spark DataFrame (typically, a
\code{tbl_spark}).}

\item{centers}{The number of cluster centers to compute.}

\item{max.iter}{The maximum number of iterations to use.}

\item{features}{The name of features (terms) to use for the model fit.}

\item{...}{Optional arguments; currently unused.}
}
\description{
Perform k-means clustering on a Spark DataFrame.
}
\seealso{
For information on how Spark k-means clustering is implemented, please see
  \url{http://spark.apache.org/docs/latest/mllib-clustering.html#k-means}.

Other Spark ML routines: \code{\link{ml_als_factorization}},
  \code{\link{ml_decision_tree}},
  \code{\link{ml_generalized_linear_regression}},
  \code{\link{ml_gradient_boosted_trees}},
  \code{\link{ml_lda}}, \code{\link{ml_linear_regression}},
  \code{\link{ml_logistic_regression}},
  \code{\link{ml_multilayer_perceptron}},
  \code{\link{ml_naive_bayes}},
  \code{\link{ml_one_vs_rest}}, \code{\link{ml_pca}},
  \code{\link{ml_random_forest}},
  \code{\link{ml_survival_regression}}
}

