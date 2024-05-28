resource "aws_s3_bucket" "test" {
  bucket  = "${var.bucket_name}"
}

resource "aws_s3_bucket" "terraform_state" {
  bucket  = "${var.state_bucket_name}"
}

resource "aws_s3_bucket_versioning" "enabled" {
  bucket = aws_s3_bucket.terraform_state.id
  versioning_configuration {
    status = "Enabled"
  }
}
