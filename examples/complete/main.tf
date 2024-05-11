terraform {
  required_version = ">= 1.5.6"
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "~> 0.90.0"
    }
  }
}

provider "snowflake" {}

module "snowflake_task" {
  source = "../.." # Path to the root of the module
  name          = "my_task"
  database      = "my_database"
  schema        = "my_schema"
  sql_statement = "SELECT * FROM my_table"
}
