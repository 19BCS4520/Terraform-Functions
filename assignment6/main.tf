# We simulate using the variable. 
# If validation fails, Terraform stops BEFORE processing this block.
resource "random_id" "server_id" {
  byte_length = 4
  keepers = {
    instance_type = var.instance_type
  }
}

output "validated_type" {
  value = var.instance_type
}