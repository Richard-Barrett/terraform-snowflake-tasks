terraform {
  required_version = ">= 1.5.6"
  required_providers {
    null = {
      source  = "hashicorp/null"
      version = "~> 3.1.0"
    }
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "~> 0.90.0"
    }
  }
}

locals {
  warehouse_check      = length(var.user_task_managed_initial_warehouse_size) > 0 && length(var.warehouse) > 0
  schedule_after_check = length(var.schedule) > 0 && length(var.after) > 0
}

resource "null_resource" "checks" {
  triggers = {
    warehouse_check      = tostring(local.warehouse_check)
    schedule_after_check = tostring(local.schedule_after_check)
  }

  provisioner "local-exec" {
    command = local.warehouse_check ? "echo 'Both user_task_managed_initial_warehouse_size and warehouse cannot be set at the same time.' && exit 1" : "exit 0"
  }

  provisioner "local-exec" {
    command = local.schedule_after_check ? "echo 'Both schedule and after cannot be set at the same time.' && exit 1" : "exit 0"
  }
}

resource "snowflake_task" "this" {
  after                                    = length(var.after) > 0 && !local.schedule_after_check ? var.after : null
  allow_overlapping_execution              = var.allow_overlapping_execution
  comment                                  = var.comment
  database                                 = var.database
  enabled                                  = var.enabled
  name                                     = var.name
  schema                                   = var.schema
  schedule                                 = length(var.schedule) > 0 && !local.schedule_after_check ? var.schedule : null
  session_parameters                       = length(var.session_parameters) > 0 ? var.session_parameters : null
  sql_statement                            = var.sql_statement
  suspend_task_after_num_failures          = var.suspend_task_after_num_failures
  user_task_managed_initial_warehouse_size = length(var.user_task_managed_initial_warehouse_size) > 0 && !local.warehouse_check ? var.user_task_managed_initial_warehouse_size : null
  warehouse                                = length(var.warehouse) > 0 && !local.warehouse_check ? var.warehouse : null
  when                                     = var.when != null ? var.when : null
}