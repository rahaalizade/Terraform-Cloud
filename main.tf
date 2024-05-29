terraform {
  backend "s3" {
    bucket         = "terraform-remote-state" 
    key            = "my-terraform-cloud-project"
    region         = "us-east-1"
  }
}

provider "aws" {
  region = var.region
}

module "s3_bucket" {
  source             = "./modules/s3_buckets"
  first_bucket       = var.first_bucket
  force_destroy      = var.force_destroy
}

module "remote_state" {
  source                    = "./modules/remote_state"
  remote_state_bucket       = var.remote_state_bucket
}
