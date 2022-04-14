################################################################################
# VPC Backend
################################################################################

terraform {
  backend "s3" {
    bucket         = "example-tfstate-s3"
    key            = "prod/vpc.tfstate"
    region         = "us-east-1"
    encrypt        = "true"
    dynamodb_table = "example-terraform-state"
  }
}
