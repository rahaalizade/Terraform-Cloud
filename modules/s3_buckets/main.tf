resource "aws_s3_bucket" "my_first_bucket" {
  bucket = var.first_bucket
  force_destroy = var.force_destroy
} 

resource "aws_s3_bucket_versioning" "versioning_enabled" {
  bucket = aws.s3_bucket.first_bucket.id

  versioning_configuration {
    enabled = var.versioning_enabled
  }

} 
