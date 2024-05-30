data "aws_s3_bucket" "existing_bucket" {
  bucket = "raha-terraform-state-v1"
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
  versioning {
    status = "Enabled"
  }
} 

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.remote_state_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}
