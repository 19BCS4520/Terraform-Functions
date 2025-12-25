variable "allowed_port_csv" {
  description = "A CSV list of allowed ports"
  type        = string
  # ✅ Valid CSV format
  default     = "80,443,8080,3306"
  
}
variable "vpc_id" {
  description = "The VPC ID where resources will be created"
  type        = string
  default     = "vpc-mock-12345"
  
}