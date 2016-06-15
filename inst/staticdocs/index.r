sd_section("Connections",
           "Functions for managing connections to Spark clusters.",
           c("spark_connect",
             "spark_disconnect",
             "spark_disconnect_all",
             "spark_config",
             "spark_log",
             "spark_web")
)

sd_section("Reading and Writing Data",
           "Functions for reading and writing data within Spark clusters.",
           c("load_df",
             "load_csv",
             "load_json",
             "load_parquet",
             "save_csv",
             "save_json",
             "save_parquet")
)

sd_section("MLlib Interface",
           "Functions for invoking MLlib algorithms.",
           c("ml_kmeans",
             "ml_linear_regression",
             "ml_logistic_regression",
             "ml_random_forest",
             "ml_pca",
             "ml_apply_binarizer",
             "ml_apply_bucketizer",
             "ml_apply_discrete_cosine_transform",
             "ml_apply_elementwise_product",
             "ml_apply_index_to_string",
             "ml_apply_quantile_discretizer",
             "ml_apply_sql_transformer",
             "ml_apply_string_indexer",
             "ml_apply_vector_assembler"
           )
)

sd_section("Spark API",
           "Functions for directly calling the Spark Scala API",
           c("spark_context",
             "spark_invoke",
             "spark_invoke_static",
             "spark_invoke_static_ctor",
             "print.jobj")
)

sd_section("dplyr Interface",
           "Implementation of dplyr S3 interface for Spark",
           c("src_spark",
             "src_context",
             "tbl_cache",
             "tbl_uncache",
             "print.src_spark",
             "copy_to.src_spark",
             "sql_drop_table.src_spark",
             "sql_analyze.src_spark",
             "sql_begin.src_spark",
             "sql_commit.src_spark",
             "sql_create_index.src_spark",
             "sql_create_table.src_spark",
             "sql_insert_into.src_spark",
             "sql_rollback.src_spark",
             "db_data_type.src_spark")
)

sd_section("Installation",
           "Functions for managing the installation of Spark components",
           c("spark_install",
             "spark_install_tar",
             "spark_install_available",
             "spark_can_install",
             "spark_versions",
             "spark_versions_info")
)

