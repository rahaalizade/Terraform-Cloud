resource "aws_s3_bucket" "remote_state_bucket" {
  bucket = var.remote_state_bucket
  force_destroy = var.force_destroy
} 

