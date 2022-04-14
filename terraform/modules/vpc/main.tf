################################################################################
# VPC Module
################################################################################

# VPC
resource "aws_vpc" "main-vpc" {
  cidr_block           = var.vpc_cidr
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  enable_classiclink   = "false"
  tags                 = var.vpc_tags
}

# Subnets
resource "aws_subnet" "main-public-subnet" {
  vpc_id                  = aws_vpc.main-vpc.id
  cidr_block              = var.subnet_cidr
  map_public_ip_on_launch = "true"
  availability_zone       = var.availability_zone
  tags                    = var.subnet_tags
}

resource "aws_subnet" "main-public-subnet2" {
  vpc_id                  = aws_vpc.main-vpc.id
  cidr_block              = var.subnet2_cidr
  map_public_ip_on_launch = "true"
  availability_zone       = var.availability_zone2
  tags                    = var.subnet2_tags
}

# Internet Gateway
resource "aws_internet_gateway" "main-gw" {
  vpc_id = aws_vpc.main-vpc.id
  tags   = var.internet_gateway_tags
}

# Route tables
resource "aws_route_table" "main-public-rt" {
  vpc_id = aws_vpc.main-vpc.id
  route {
    cidr_block = var.route_table_cidr
    gateway_id = aws_internet_gateway.main-gw.id
  }
  tags = var.route_table_tags
}

resource "aws_route_table" "main-public-rt2" {
  vpc_id = aws_vpc.main-vpc.id
  route {
    cidr_block = var.route_table2_cidr
    gateway_id = aws_internet_gateway.main-gw.id
  }
  tags = var.route_table2_tags
}

# Route table associations to subnets
resource "aws_route_table_association" "main-public-rta" {
  subnet_id      = aws_subnet.main-public-subnet.id
  route_table_id = aws_route_table.main-public-rt.id
}

resource "aws_route_table_association" "main-public-rta2" {
  subnet_id      = aws_subnet.main-public-subnet2.id
  route_table_id = aws_route_table.main-public-rt2.id
}

# Security groups
resource "aws_security_group" "main-instance-sg" {
  name        = var.instance_sg_name
  description = "Allow traffic on ssh(22) and http(8000)"
  vpc_id      = aws_vpc.main-vpc.id
  depends_on  = [resource.aws_security_group.main-lb-sg]
  ingress {
    description = "Allow SSH from your public IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${chomp(data.http.myip.body)}/32"] #data.http.myip.body places the IP fteched by the data source.
  }
  ingress {
    description     = "Allow HTTP from clients"
    from_port       = 8000
    to_port         = 8000
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
    security_groups = [resource.aws_security_group.main-lb-sg.id]
  }
  egress {
    description = "Allow internet access for the instance"
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "main-lb-sg" {
  name        = var.lb_sg_name
  description = "Allow traffic on HTTP(80)"
  vpc_id      = aws_vpc.main-vpc.id
  ingress {
    description = "HTTP from LB"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    description = "Allow internet access for the LB"
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
