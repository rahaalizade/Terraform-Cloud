resource "aws_s3_bucket" "terraform_state" {
  bucket = var.remote_state_bucket
 
  lifecycle {
    prevent_destroy = var.prevent_destroy
  }
}