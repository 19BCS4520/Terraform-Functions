locals {
    # Step 1: Combine the lists into one big list
  all_locations_raw=concat(var.user_location, [var.mandatory_location])
  # Step 2: Remove duplicates by converting to a 'Set'
  unique_locations = toset(local.all_locations_raw)
}
# Simulating creating a resource in each unique region
resource "random_id" "region" {
  for_each = local.unique_locations
  byte_length = 4
  keepers = {
    region_name = each.key
  }
}