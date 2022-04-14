# ################################################################################
# Route 53 Variables
# ################################################################################

# Note: Default variable value is commented to take input from user.

variable "dns_name" {
  description = "The DNS name."
  type        = string
#   default     = null
}
