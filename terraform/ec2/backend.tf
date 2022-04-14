################################################################################
# EC2 Backend
################################################################################

terraform {
  backend "s3" {
    bucket         = "example-tfstate-s3"
    key            = "prod/ec2.tfstate"
    region         = "us-east-1"
    encrypt        = "true"
    dynamodb_table = "example-terraform-state"
  }
}


