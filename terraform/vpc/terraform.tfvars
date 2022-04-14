################################################################################
# VPC variable values
################################################################################

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

# Security groups
instance_sg_name = "example-instance-sg"
lb_sg_name       = "example-lb-sg"

