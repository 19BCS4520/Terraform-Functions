locals {
  #split the ports by comma
  #Turn the string "80,443..." into a list ["80", "443"...]
  port_list=split(",", var.allowed_port_csv)
  # Step 2: The Loop (List Comprehension)
  # "For every port in the list, create an object with these properties..."
  # This is the logic used inside 'dynamic' blocks in real AWS resources.
  sg_rules_objects = [for port in local.port_list : {
    name        = "rule-for-port-${port}"
    from_port   = tonumber(port)
    to_port     = tonumber(port)
    protocol    = "tcp"
    description = "Managed by Terraform: Allow ${port}"
  }]
  # Step 3: Create a formatted summary string (for tagging or naming)
  # join() pastes the list back together with a separator.
  format_summary=join("-",[for p in local.port_list : "port${p}"])
}

# In a real scenario, this would be an 'aws_security_group' with a 'dynamic' block
resource "random_id" "sg_simulator" {
  byte_length = 4
  keepers = {
    # This forces a replacement if the port list changes
    rules_hash = md5(jsonencode(local.sg_rules_objects))
  }
}