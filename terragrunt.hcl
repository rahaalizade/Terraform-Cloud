generate "backend" {
  path      = "backend.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
terraform {
  backend "s3" {
    bucket         = "raha-remote-state-bucket"
    key            = "terraform.tfstate"
    region         = "us-west-2"
  }
}
EOF
}
