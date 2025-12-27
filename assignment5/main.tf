locals {
    # Syntax: lookup(map, key, default_value)
  
  # Logic:
  # 1. Look inside 'var.instance_sizing_map'
  # 2. Search for the key matching 'var.environment'
  # 3. If found, use that value.
  # 4. If NOT found (e.g., user typed "test"), use "t2.micro" as safety fallback.
  select_instance_size=lookup(var.instance_sizing_map, var.environment, "t2.micro")
}
# Simulating an EC2 Instance (using random_id to avoid AWS costs)
resource "random_id" "server_id" {
  byte_length = 4
  keepers = {
    # Change this value to force a new ID (simulating new instance)
    instance_size = local.select_instance_size
  }
  
}
output "environment_input" {
  value = var.environment
}
output "selected_size" {
  value = local.select_instance_size
  description = "The actual instance type Terraform selected"
}
output "name_of_instance" {
  value = "Instance-${random_id.server_id.hex} of size ${local.select_instance_size} in ${var.environment} environment"
  
}