variable "backup_file_name" {
  description = "The name of the backup file"
  type        = string
  default     = "daily-db-buckup"

validation {
  condition = endswith(var.backup_file_name, "_backup")
  error_message = "Backup file name must end with '_backup'."
}
}
variable "db_password" {
  description = "The password for the database"
  type        = string
  default     = "SuperSecretPassword123!"
  sensitive   = true
  
}