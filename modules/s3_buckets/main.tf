data "aws_s3_bucket" "existing_bucket" {
  bucket = var.remote_state_bucket 
}

locals {
  bucket_exists = (
    length(data.aws_s3_bucket.existing_bucket.id) > 0
  )
}

resource "aws_s3_bucket" "remote_state_bucket" {
  count         = local.bucket_exists ? 0 : 1
  bucket        = var.remote_state_bucket
  force_destroy = var.force_destroy
} 

resource "aws_s3_bucket_versioning" "this" {
  count         = local.bucket_exists ? 0 : 1
  bucket = aws_s3_bucket.remote_state_bucket[0].id
  versioning_configuration {
    status = "Enabled"
  }
}

