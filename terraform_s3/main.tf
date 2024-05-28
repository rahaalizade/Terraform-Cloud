provider "aws" {
  region = "us-east-1"
}

module "terraform_state" {
  source = "./"
  bucket_name = "${var.bucket_name}"
  dynamodb_table_name = "${dynamodb_table_name}"
} 
