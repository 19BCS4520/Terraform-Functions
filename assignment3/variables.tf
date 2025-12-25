variable "raw_bucket_input" {
  description = "A user-provided name that violates S3 rules"
  type        = string
  # ❌ Too long, has spaces, uppercase, and special chars (!)
  default     = "My Super Long Enterprise Backup Solution For The Year 2025 That Is Very Important!!!"
}