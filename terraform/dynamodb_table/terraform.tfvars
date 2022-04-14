################################################################################
# DynamoDB Table Variable Values
################################################################################

dynamodb_table_name = "example-terraform-state"
dynamodb_table_tags = {
  Name        = "DynamoDB Terraform State Lock Table"
  Environment = "production"
}
