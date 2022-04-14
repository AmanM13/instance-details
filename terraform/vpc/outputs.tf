################################################################################
# VPC Outputs
################################################################################

# VPC
output "vpc_name" {
  value       = module.vpc.vpc_name
  description = "The name of VPC."
}

output "vpc_id" {
  value       = module.vpc.vpc_id
  description = "The ID of VPC."
}

output "vpc_cidr" {
  value       = module.vpc.vpc_cidr
  description = "The CIDR of VPC."
}

output "vpc_main_route_table_id" {
  value       = module.vpc.vpc_main_route_table_id
  description = "The main route table id of VPC."
}

# Subnets
output "subnet_name" {
  value       = module.vpc.subnet_name
  description = "The Name of subnet."
}

output "subnet_id" {
  value       = module.vpc.subnet_id
  description = "The ID of subnet."
}

output "subnet_cidr" {
  value       = module.vpc.subnet_cidr
  description = "The CIDR of subnet."
}

output "subnet_availability_zone" {
  value       = module.vpc.subnet_availability_zone
  description = "The availability zone of subnet."
}

output "subnet2_name" {
  value       = module.vpc.subnet2_name
  description = "The Name of subnet."
}

output "subnet2_id" {
  value       = module.vpc.subnet2_id
  description = "The ID of subnet."
}

output "subnet2_cidr" {
  value       = module.vpc.subnet2_cidr
  description = "The CIDR of subnet."
}

output "subnet2_availability_zone" {
  value       = module.vpc.subnet2_availability_zone
  description = "The availability zone of subnet."
}

# Internet Gateway
output "internet_gateway_name" {
  value       = module.vpc.internet_gateway_name
  description = "The name of internet gateway."
}

output "internet_gateway_id" {
  value       = module.vpc.internet_gateway_id
  description = "The ID of internet gateway."
}

# Route tables
output "route_table_name" {
  value       = module.vpc.route_table_name
  description = "The name of route table."
}

output "route_table_id" {
  value       = module.vpc.route_table_id
  description = "The ID of route table."
}

output "route_table2_name" {
  value       = module.vpc.route_table2_name
  description = "The name of 2nd route table."
}

output "route_table2_id" {
  value       = module.vpc.route_table2_id
  description = "The ID of 2nd route table."
}

# Route table associations to subnets
output "route_table_association_id" {
  value       = module.vpc.route_table_association_id
  description = "The ID of associated route table ."
}

output "route_table_association2_id" {
  value       = module.vpc.route_table_association2_id
  description = "The ID of 2nd associated route table ."
}

#Security groups
output "instance_sg_name" {
  value       = module.vpc.instance_sg_name
  description = "The name of security group of instance."
}

output "instance_sg_id" {
  value       = module.vpc.instance_sg_id
  description = "The ID of security group of instance."
}

output "lb_sg_name" {
  value       = module.vpc.lb_sg_name
  description = "The name of security group of load balancer."
}

output "lb_sg_id" {
  value       = module.vpc.lb_sg_id
  description = "The ID of security group of load balancer."
}
