locals{
    # Step 1: Convert everything to lowercase
  # "Mega App PROJECT 2025" -> "mega app project 2025"
    lowercase_name=lower(var.raw_project_name)
    # Step 2: Replace spaces with hyphens
    # "mega app project 2025" -> "mega-app-project-2025"
    sanitized_name=replace(local.lowercase_name, " ", "-")
    final_bucket_name="${local.sanitized_name}-${lower(var.environment)}-bucket"
}
resource "random_id" "bucket_suffix" {
  byte_length = 4
}

#output the final bucket name
output "originalinput" {
  value=var.raw_project_name
}
output "fixed_s3_bucket_name" {
  value = local.final_bucket_name
}