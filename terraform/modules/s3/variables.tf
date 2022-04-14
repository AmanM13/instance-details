################################################################################
# S3 Variables
################################################################################

variable "bucket_name" {
  description = "The name of bucket"
  type        = string
  default     = null
}

variable "bucket_tags" {
  description = "The tags for deployed bucket"
  type        = map(string)
  default     = {}
}
