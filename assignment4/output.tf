output "step1_raw_list" {
  value = local.port_list
}

output "step2_structured_rules" {
  value = local.sg_rules_objects
  description = "This list of maps is what you would pass to a module"
}

output "step3_tag_name" {
  value = "sg-${local.format_summary}-${random_id.sg_simulator.hex}"
}