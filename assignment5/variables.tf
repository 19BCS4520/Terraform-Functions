variable "environment" {
  description = "The environment for the resources"
  type        = string
  # No default here, we want the user to specify it
  
}
variable "instance_sizing_map" {
  description = "A map determining instance size per environment"
  type        = map(string)
  default     = {
    "dev"     = "t2.micro"   # Cheap
    "staging" = "t3.medium"  # Balanced
    "prod"    = "m5.large"   # Powerful
  }
  
}