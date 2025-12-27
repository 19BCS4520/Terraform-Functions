variable "instance_type" {
  description = "Type of EC2 instance- t2, t3 family"
  type        = string
  default     = "t2.micro"
  
# Rule 1: Check Length
validation{
    condition=length(var.instance_type) > 3 && length(var.instance_type) <= 20
    error_message = "Instance type must be longer than 3 characters (e.g. t2.nano)."

}
# Rule 2: Check Pattern (Regex)
  validation {
    # can() returns false if the regex crashes (i.e., doesn't match)
    # Regex Breakdown:
    # ^      = Start of string
    # t      = The letter t
    # [2-3]  = Either 2 or 3
    # \.     = A literal dot
    condition     = can(regex("^t[2-3]\\.", var.instance_type))
    error_message = "Only t2 and t3 instance families are allowed (e.g., t2.micro, t3.medium)."
  }
}