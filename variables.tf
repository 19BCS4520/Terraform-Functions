variable "raw_project_name" {
  description = "The raw project name input"
  type        = string
  default     = "Mega App PROJECT 2025" # ❌ Contains spaces and uppercase
}
variable "environment" {
  description = "The deployment environment"
  type        = string
  default     = "Prod" 
  
}