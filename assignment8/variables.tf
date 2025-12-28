variable "user_location" {
  description = "list of locations where users are located"
  type        = list(string)
  default     = ["us-west-1", "us-east-1", "eu-west-1", "ap-south-1"]
}
variable "mandatory_location" {
  description = "The mandatory location for all users"
  type        = string
  default     = "us-east-1"
  
}