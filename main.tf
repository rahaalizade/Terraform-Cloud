provider "aws" {
  region = var.region
}

module "s3_bucket" {
  source              = "./modules/s3_buckets"
  remote_state_bucket        = var.remote_state_bucket
  force_destroy       = var.force_destroy
}

