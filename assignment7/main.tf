locals {
  full_backup_path="/var/backups/${var.backup_file_name}"

}
# Dummy resource to simulate utilizing the password
resource "random_id" "job_id" {
  byte_length = 4
  keepers = {
    # Even though we use the password here, Terraform tracks it as sensitive
    pass_hash = md5(var.db_password)
  }
}