locals {
    # The merge() function combines the two maps
  final_reource_tags=merge(var.corporate_mandate_tags,var.project_specific_tags)
}
# Simulating an AWS VPC (using a random resource to keep it free/local)
resource "random_id" "vpc_id_simulator" {
  byte_length = 8
}

#output the final tags applied to the resource
output "applied_tags_on_aws_resource" {
  value = local.final_reource_tags

}

output "vpc_id_mock_value" {
  value = "vpc-${random_id.vpc_id_simulator.hex}"
}