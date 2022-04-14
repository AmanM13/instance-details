# VPC Module

This module makes it easier to create:
- VPC
- Subnets
- Internet Gateway
- Route table
- Route table associations to subnets
- Security groups

## Usage

Basic usage of this module is as follows:

* VPC

  ```hcl
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
  ```

* Provide the variables values to the modules from terraform.tfvars file.

  ```hcl
  # VPC
  vpc_cidr = "10.1.0.0/16"
  vpc_tags = {
    Name = "example-vpc"
  }

  # Subnets
  subnet_cidr       = "10.1.0.0/24"
  availability_zone = "us-east-1a"
  subnet_tags = {
    Name = "example-public-subnet"
  }
  subnet2_cidr       = "10.1.2.0/24"
  availability_zone2 = "us-east-1b"
  subnet2_tags = {
    Name = "example-public-subnet2"
  }

  # Internet gateway
  internet_gateway_tags = {
    Name = "example-internet-gateway"
  }

  # Route tables
  route_table_cidr = "0.0.0.0/0"
  route_table_tags = {
    Name = "example-route-table"
  }
  route_table2_cidr = "0.0.0.0/0"
  route_table2_tags = {
    Name = "example-route-table2"
  }

  #Security groups
  instance_sg_name = "example-instance-sg"
  lb_sg_name       = "example-lb-sg"
  ```

* Perform the following commands in the directory:

   Get the plugins
   ```
   terraform init
   ``` 
   Create the infrastructure plan
   ```
   terraform plan
   ``` 
   Execute the infrastructure plan
   ```
   terraform apply
   ``` 
   Destroy the built infrastructure
   ```
   terraform destroy
   ``` 
