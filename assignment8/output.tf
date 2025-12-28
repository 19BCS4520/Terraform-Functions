output "step1_raw_concat" {
  value       = local.all_locations_raw
  description = "The list with duplicates included"
}

output "step2_final_unique_list" {
  value       = local.unique_locations
  description = "The clean list with duplicates removed"
}