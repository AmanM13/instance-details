# ################################################################################
# Route 53 Data Source
# ################################################################################

data "terraform_remote_state" "alb" {
  backend = "s3"
  config = {
    bucket = "example-tfstate-s3"
    key    = "prod/ec2.tfstate"
    region = "us-east-1"
  }
}
