################################################################################
# Route 53 Backend
################################################################################

terraform {
  backend "s3" {
    bucket         = "example-tfstate-s3"
    key            = "prod/route_53.tfstate"
    region         = "us-east-1"
    encrypt        = "true"
    dynamodb_table = "example-terraform-state"
  }
}
