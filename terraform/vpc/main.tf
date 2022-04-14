################################################################################
# VPC Module
################################################################################

module "vpc" {
  source                = "../modules/vpc/"

  # VPC
  vpc_cidr              = var.vpc_cidr
  vpc_tags              = var.vpc_tags
  
  # Subnets
  subnet_cidr           = var.subnet_cidr
  availability_zone     = var.availability_zone
  subnet_tags           = var.subnet_tags
  subnet2_cidr          = var.subnet2_cidr
  availability_zone2    = var.availability_zone2
  subnet2_tags          = var.subnet2_tags
  
  # Internet gateway
  internet_gateway_tags = var.internet_gateway_tags
  
  # Route tables
  route_table_cidr      = var.route_table_cidr
  route_table_tags      = var.route_table_tags
  route_table2_cidr     = var.route_table2_cidr
  route_table2_tags     = var.route_table2_tags
  
  # Security groups
  instance_sg_name      = var.instance_sg_name
  lb_sg_name            = var.lb_sg_name
}
