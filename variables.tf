variable "after" {
  description = "The after condition for the task."
  type        = string
  default     = ""
}

variable "allow_overlapping_execution" {
  description = "Allow overlapping execution setting for the task."
  type        = bool
  default     = false
}

variable "comment" {
  description = "The comment for the task."
  type        = string
  default     = ""
}

variable "database" {
  description = "The database for the task."
  type        = string
}

variable "enabled" {
  description = "The enabled status for the task."
  type        = bool
  default     = true
}

variable "name" {
  description = "The name of the task."
  type        = string
}

variable "schema" {
  description = "The schema for the task."
  type        = string
}

variable "schedule" {
  description = "The schedule for the task."
  type        = string
  default     = ""
}

variable "session_parameters" {
  description = "The session parameters for the task."
  type        = map(string)
  default     = {}
}

variable "sql_statement" {
  description = "The SQL statement for the task."
  type        = string
}

variable "suspend_task_after_num_failures" {
  description = "The number of failures after which the task should be suspended."
  type        = number
  default     = 3
}

variable "user_task_managed_initial_warehouse_size" {
  type    = string
  default = "small"
}

variable "under_task_timeout_ms" {
  description = "The under task timeout in milliseconds."
  type        = number
  default     = 600000
}

variable "warehouse" {
  description = "The warehouse for the task."
  type        = string
  default     = null
}

variable "when" {
  description = "The when condition for the task."
  type        = string
  default     = null
}