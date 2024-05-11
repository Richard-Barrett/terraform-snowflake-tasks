<img align="right" width="60" height="60" src="images/terraform.png">

# terraform-snowflake-tasks

Terraform Module for Managing Snowflake Tasks

- snowflake_task

This Terraform module is designed to create a Snowflake task. A Snowflake task is essentially a set of SQL statements that are executed either on a recurring schedule or based on a specific condition.

Key features of this module include:

1. **Task Creation**: The module creates a Snowflake task with a specified name, within a specified database and schema, and with a specified SQL statement to execute.

2. **Task Configuration**: The module allows for optional configuration of the task, including enabling or disabling the task, allowing overlapping executions, setting the number of consecutive failures before the task is suspended, and specifying the initial warehouse size for the task.

3. **Task Scheduling**: The module provides options to set a schedule for the task or specify a predecessor task. It also allows for setting a condition for the task execution.

4. **Warehouse Specification**: The module allows for specifying the warehouse to use for the task.

By using this module, users can automate the creation and configuration of Snowflake tasks in a declarative manner, making it easier to manage and maintain their Snowflake tasks.

Example CICD with `BitBucket` and `Codefresh`:

![Image](./images/diagram.png)

## Notes

Here are some important notes about this module:

1. `name`: This is a required input. It specifies the name of the task.
2. `database`: This is a required input. It specifies the database in which to create the task.
3. `schema`: This is a required input. It specifies the schema in which to create the task.
4. `sql_statement`: This is a required input. It specifies the SQL statement the task will run.
5. `comment`: This is an optional input. It allows you to add a comment for the task.
6. `enabled`: This is an optional input. It specifies whether the task should be enabled or not. The default value is true.
7. `allow_overlapping_execution`: This is an optional input. It specifies whether to allow overlapping executions. The default value is false.
8. `suspend_task_after_num_failures`: This is an optional input. It specifies the number of consecutive failures to allow before suspending the task. The default value is 1.
9. `user_task_managed_initial_warehouse_size`: This is an optional input. It specifies the initial warehouse size for the task.
10. `warehouse`: This is an optional input. It specifies the warehouse to use for the task.
11. `schedule`: This is an optional input. It specifies the schedule for the task. If both schedule and after are set, an error will be thrown.
12. `after`: This is an optional input. It specifies the predecessor task for the task. If both schedule and after are set, an error will be thrown.
13. `when`: This is an optional input. It specifies the condition for the task.

Please note that you need to replace the values in the example with your actual values. Also, the schedule, after, and when variables are optional and can be used to specify the schedule or condition for the task.

## Usage

This Terraform module is used to create a Snowflake task. A Snowflake task is a set of SQL statements that you define to execute on a recurring schedule or based on a specific condition.

### Basic Usage

```terraform
module "snowflake_task" {
  source = "https://github.com/Richard-Barrett/terraform-snowflake-tasks"
  version = "0.0.1"

  name          = "my_task"
  database      = "my_database"
  schema        = "my_schema"
  sql_statement = "SELECT * FROM my_table"
}
```

Replace <module-source> with the source of the module.

Here's what each variable means:

- name: The name of the task.
- database: The database in which to create the task.
- schema: The schema in which to create the task.
- sql_statement: The SQL statement the task will run.

Please note that you need to replace the values in the example with your actual values.

### Advanced Usage

Here's an advanced usage example:

```terraform
module "snowflake_task" {
  source = "https://github.com/Richard-Barrett/terraform-snowflake-tasks"
  version = "0.0.1"

  name                                     = "my_task"
  database                                 = "my_database"
  schema                                   = "my_schema"
  sql_statement                            = "SELECT * FROM my_table"
  comment                                  = "This is my task"
  enabled                                  = true
  allow_overlapping_execution              = false
  suspend_task_after_num_failures          = 1
  user_task_managed_initial_warehouse_size = "X-Small"
  warehouse                                = "my_warehouse"
}
```

Replace `<module-source>` with the source of the module.

Here's what each variable means:

- `name`: The name of the task.
- `database`: The database in which to create the task.
- `schema`: The schema in which to create the task.
- `sql_statement`: The SQL statement the task will run.
- `comment`: A comment for the task.
- `enabled`: Whether the task should be enabled or not.
- `allow_overlapping_execution`: Whether to allow overlapping executions.
- `suspend_task_after_num_failures`: The number of consecutive failures to allow before suspending the task.
- `user_task_managed_initial_warehouse_size`: The initial warehouse size for the task.
- `warehouse`: The warehouse to use for the task.

Please note that you need to replace the values in the example with your actual values. Also, the `schedule`, `after`, and `when` variables are optional and can be used to specify the schedule or condition for the task.

### Considerations

Here are some considerations for using this Terraform module:

1. **Terraform Version**: Ensure that you are using a compatible version of Terraform. This module may not work with older or newer versions of Terraform.

2. **Snowflake Credentials**: You need to have valid Snowflake credentials and sufficient permissions to create and manage tasks in the specified database and schema.

3. **Idempotency**: Terraform is designed to be idempotent, meaning running the same configuration multiple times should result in the same state. However, if you manually modify the resources created by this module outside of Terraform, it could lead to discrepancies.

4. **Error Handling**: If both `schedule` and `after` are set, or if both `user_task_managed_initial_warehouse_size` and `warehouse` are set, the module will throw an error. Make sure to only set one or the other.

5. **Resource Dependencies**: If the database, schema, or warehouse used in this module are managed by other Terraform resources, ensure those resources are created before this module is run. You can use `depends_on` to manage resource dependencies.

6. **Cost**: Creating resources in Snowflake may incur costs. Make sure to understand the pricing model of Snowflake before using this module.

7. **Security**: Be careful with the SQL statements you use in the `sql_statement` variable. Avoid including sensitive information directly in the Terraform configuration. Consider using variable files or environment variables to handle sensitive data.

8. **Module Updates**: Keep an eye on the module source for any updates or changes that might affect your configuration.

## Overview

In overview, this repository acts as a digestible module that allows you to create a task in Snowflake in a modular way.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.6 |
| <a name="requirement_snowflake"></a> [snowflake](#requirement\_snowflake) | ~> 0.90.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_null"></a> [null](#provider\_null) | n/a |
| <a name="provider_snowflake"></a> [snowflake](#provider\_snowflake) | ~> 0.90.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [null_resource.checks](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [snowflake_task.this](https://registry.terraform.io/providers/Snowflake-Labs/snowflake/latest/docs/resources/task) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_after"></a> [after](#input\_after) | The after condition for the task. | `string` | `""` | no |
| <a name="input_allow_overlapping_execution"></a> [allow\_overlapping\_execution](#input\_allow\_overlapping\_execution) | Allow overlapping execution setting for the task. | `bool` | `false` | no |
| <a name="input_comment"></a> [comment](#input\_comment) | The comment for the task. | `string` | `""` | no |
| <a name="input_database"></a> [database](#input\_database) | The database for the task. | `string` | n/a | yes |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | The enabled status for the task. | `bool` | `true` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the task. | `string` | n/a | yes |
| <a name="input_schedule"></a> [schedule](#input\_schedule) | The schedule for the task. | `string` | `""` | no |
| <a name="input_schema"></a> [schema](#input\_schema) | The schema for the task. | `string` | n/a | yes |
| <a name="input_session_parameters"></a> [session\_parameters](#input\_session\_parameters) | The session parameters for the task. | `map(string)` | `{}` | no |
| <a name="input_sql_statement"></a> [sql\_statement](#input\_sql\_statement) | The SQL statement for the task. | `string` | n/a | yes |
| <a name="input_suspend_task_after_num_failures"></a> [suspend\_task\_after\_num\_failures](#input\_suspend\_task\_after\_num\_failures) | The number of failures after which the task should be suspended. | `number` | `3` | no |
| <a name="input_under_task_timeout_ms"></a> [under\_task\_timeout\_ms](#input\_under\_task\_timeout\_ms) | The under task timeout in milliseconds. | `number` | `600000` | no |
| <a name="input_user_task_managed_initial_warehouse_size"></a> [user\_task\_managed\_initial\_warehouse\_size](#input\_user\_task\_managed\_initial\_warehouse\_size) | n/a | `string` | `"small"` | no |
| <a name="input_warehouse"></a> [warehouse](#input\_warehouse) | The warehouse for the task. | `string` | `null` | no |
| <a name="input_when"></a> [when](#input\_when) | The when condition for the task. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_task"></a> [task](#output\_task) | The created snowflake task |
<!-- END_TF_DOCS -->
