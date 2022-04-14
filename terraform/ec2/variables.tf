################################################################################
# EC2 Variables
################################################################################

# Note: A few default variable values are commented to take input from user.

# Local file
variable "generated_key_name" {
  description = "The name of the generated Key-pair by Terraform."
  type        = string
  default     = null
}

# Key pair
variable "key_pair_name" {
  description = "The name of the AWS Key-pair."
  type        = string
  default     = null
}

# Launch template
variable "launch_template_name" {
  description = "The name of launch template."
  type        = string
  default     = null
}

variable "volume_size" {
  description = "The size of EBS volume in gigabytes."
  type        = number
  # default     = null
}

variable "ami_name" {
  description = "The ID of image."
  type        = string
  # default     = null
}

variable "ec2_instance_type" {
  description = "The type of instance."
  type        = string
  # default     = null
}

variable "lt_tags" {
  description = "The tags of launch template"
  type        = map(string)
  default     = {}
}

# Target group
variable "lb_tg_name" {
  description = "The name of the target group of load balancer."
  type        = string
  default     = null
}

# Autoscaling group
variable "asg_name" {
  description = "The name of autoscaling group."
  type        = string
  default     = null
}

variable "number_of_ec2s" {
  description = "The number of ec2 instances to launch."
  type        = number
  # default     = null
}

variable "max_number_of_ec2s" {
  description = "The maximum number of ec2 instances to launch."
  type        = number
  default     = null
}

variable "min_number_of_ec2s" {
  description = "The minimum number of ec2 instances to launch."
  type        = number
  default     = null
}

variable "launch_template_version" {
  description = "The version of the launch template."
  type        = number
  default     = null
}

# Application load balancer
variable "lb_name" {
  description = "The name of of load balancer."
  type        = string
  default     = null
}

variable "lb_tags" {
  description = "The tags of load balancer."
  type        = map(string)
  default     = {}
}
