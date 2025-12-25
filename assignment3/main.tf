locals {
    # Step 1: Lowercase everything
  step1_lower=lower(var.raw_bucket_input)
  # Step 2: Remove spaces AND exclamation marks
  # We use a Regex pattern "[^a-z0-9-]" to replace ANYTHING that isn't a letter, number, or hyphen with nothing.
  # This is a powerful way to clean "garbage" characters
step2_clean = replace(local.step1_lower, "/[^a-z0-9-]/", "")
  # If the string is shorter than 63, substr just returns the whole string.
  # If it's longer, it cuts it off.
  step3_truncated = substr(local.step2_clean, 0, 63)
}

# Simulating the S3 bucket creation (using random_id to avoid cost/cloud auth requirement)
resource "random_id" "bucket_id_simulator" {
  byte_length = 8
}
#output
output "original_bucket_name" {
  value = var.raw_bucket_input
  
}
output "final_bucket_name" {
  value = "${local.step3_truncated}-${random_id.bucket_id_simulator.hex}"
  
}