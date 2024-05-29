resource "aws_s3_bucket" "my_first_bucket" {
  bucket = var.first_bucket
  force_destroy = var.force_destroy
} 

