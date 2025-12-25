# 1. Mandatory tags required by the Finance Department
variable "corporate_mandate_tags" {
  description = "A map of mandatory tags for the corporate environment"
  type        = map(string)
  default     = {
    "organization" = "Parikshit"
    "managed_by"  = "Terraform"
    "cost_center" = "CC1234"
  }
}
# 2. Specific tags for the project being deployed
variable "project_specific_tags" {
  description = "A map of specific tags for the project"
  type        = map(string)
  default     = {
    "project_name" = "MegaApp"
    "environment"  = "Production"
    "owner"        = "Parikshit-Sharma"
  }
  
}