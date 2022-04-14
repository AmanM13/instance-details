################################################################################
# VPC Outputs
################################################################################

# VPC
output "vpc_name" {
  value       = resource.aws_vpc.main-vpc.tags
  description = "The name of VPC."
}

output "vpc_id" {
  value       = resource.aws_vpc.main-vpc.id
  description = "The ID of VPC."
}

output "vpc_cidr" {
  value       = resource.aws_vpc.main-vpc.cidr_block
  description = "The CIDR of VPC."
}

output "vpc_main_route_table_id" {
  value       = resource.aws_vpc.main-vpc.main_route_table_id
  description = "The main route table ID of VPC."
}

# Subnets
output "subnet_name" {
  value       = resource.aws_subnet.main-public-subnet.tags
  description = "The name of subnet."
}

output "subnet_id" {
  value       = resource.aws_subnet.main-public-subnet.id
  description = "The ID of subnet."
}

output "subnet_cidr" {
  value       = resource.aws_subnet.main-public-subnet.cidr_block
  description = "The CIDR of subnet."
}

output "subnet_availability_zone" {
  value       = resource.aws_subnet.main-public-subnet.availability_zone
  description = "The availability zone of subnet."
}

output "subnet2_name" {
  value       = resource.aws_subnet.main-public-subnet2.tags
  description = "The name of 2nd subnet."
}

output "subnet2_id" {
  value       = resource.aws_subnet.main-public-subnet2.id
  description = "The ID of 2nd subnet."
}

output "subnet2_cidr" {
  value       = resource.aws_subnet.main-public-subnet2.cidr_block
  description = "The CIDR of 2nd subnet."
}

output "subnet2_availability_zone" {
  value       = resource.aws_subnet.main-public-subnet2.availability_zone
  description = "The availability zone of 2nd subnet."
}

# Internet gateway
output "internet_gateway_name" {
  value       = resource.aws_internet_gateway.main-gw.tags
  description = "The name of internet gateway."
}

output "internet_gateway_id" {
  value       = resource.aws_internet_gateway.main-gw.id
  description = "The ID of internet gateway."
}

# Route tables
output "route_table_name" {
  value       = resource.aws_route_table.main-public-rt.tags
  description = "The name of route table."
}

output "route_table_id" {
  value       = resource.aws_route_table.main-public-rt.id
  description = "The ID of route table."
}

output "route_table2_name" {
  value       = resource.aws_route_table.main-public-rt2.tags
  description = "The name of 2nd route table."
}

output "route_table2_id" {
  value       = resource.aws_route_table.main-public-rt2.id
  description = "The ID of 2nd route table."
}

# Route table associations to subnets
output "route_table_association_id" {
  value       = resource.aws_route_table_association.main-public-rta.id
  description = "The ID of associated route table."
}

output "route_table_association2_id" {
  value       = resource.aws_route_table_association.main-public-rta2.id
  description = "The ID of 2nd associated route table."
}

#Security groups
output "instance_sg_name" {
  value       = resource.aws_security_group.main-instance-sg.name
  description = "The name of security group of instance."
}

output "instance_sg_id" {
  value       = resource.aws_security_group.main-instance-sg.id
  description = "The ID of security group of instance."
}

output "lb_sg_name" {
  value       = resource.aws_security_group.main-lb-sg.name
  description = "The name of security group of load balancer."
}

output "lb_sg_id" {
  value       = resource.aws_security_group.main-lb-sg.id
  description = "The ID of security group of load balancer."
}
