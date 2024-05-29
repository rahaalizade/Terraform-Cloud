terraform {
  backend "s3" {
    bucket         = var.remote_state_bucket
    key            = "./terraform.tfstate"
    region         = var.region
  }
}

