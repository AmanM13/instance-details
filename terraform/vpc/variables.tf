################################################################################
# VPC Variables
################################################################################

# VPC
variable "vpc_cidr" {
  description = "The CIDR of VPC."
  type        = string
  default     = null
}

variable "vpc_tags" {
  description = "The tags of VPC."
  type        = map(string)
  default     = {}
}

# Subnets
variable "subnet_cidr" {
  description = "The CIDR of subnets."
  type        = string
  default     = null
}

variable "availability_zone" {
  description = "The availability zone of subnets."
  type        = string
  default     = null
}

variable "subnet_tags" {
  description = "The tags of subnets."
  type        = map(string)
  default     = {}
}

variable "subnet2_cidr" {
  description = "The CIDR of subnets."
  type        = string
  default     = null
}

variable "availability_zone2" {
  description = "The availability zone of subnets."
  type        = string
  default     = null
}

variable "subnet2_tags" {
  description = "The tags of subnets."
  type        = map(string)
  default     = {}
}

# Internet Gateway
variable "internet_gateway_tags" {
  description = "The tags of internet gateway."
  type        = map(string)
  default     = {}
}

# Route tables
variable "route_table_cidr" {
  description = "The CIDR of route table."
  type        = string
  default     = null
}

variable "route_table_tags" {
  description = "The tags of route table."
  type        = map(string)
  default     = {}
}

variable "route_table2_cidr" {
  description = "The CIDR of route table."
  type        = string
  default     = null
}

variable "route_table2_tags" {
  description = "The tags of route table."
  type        = map(string)
  default     = {}
}

#Security groups
variable "instance_sg_name" {
  description = "The name of instance security group."
  type        = string
  default     = null
}

variable "lb_sg_name" {
  description = "The name of load balancer security group."
  type        = string
  default     = null
}

