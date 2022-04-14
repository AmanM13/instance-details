################################################################################
# EC2 Data Source
################################################################################

# Data source to fetch the values of instance security group.
data "terraform_remote_state" "instance-sg" {
  backend = "s3"
  config = {
    bucket = "example-tfstate-s3"
    key    = "prod/vpc.tfstate"
    region = "us-east-1"
  }
}

# Data source to fetch the values of VPC.
data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "example-tfstate-s3"
    key    = "prod/vpc.tfstate"
    region = "us-east-1"
  }
}

# Data source to fetch the values of public subnet.
data "terraform_remote_state" "public-subnet" {
  backend = "s3"
  config = {
    bucket = "example-tfstate-s3"
    key    = "prod/vpc.tfstate"
    region = "us-east-1"
  }
}

# Data source to fetch the values of 2nd public subnet.
data "terraform_remote_state" "public-subnet2" {
  backend = "s3"
  config = {
    bucket = "example-tfstate-s3"
    key    = "prod/vpc.tfstate"
    region = "us-east-1"
  }
}

# Data source to fetch the values of load balancer security group.
data "terraform_remote_state" "lb-sg" {
  backend = "s3"
  config = {
    bucket = "example-tfstate-s3"
    key    = "prod/vpc.tfstate"
    region = "us-east-1"
  }
}


