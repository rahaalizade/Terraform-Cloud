provider "aws" {
  region = var.region
}

module "s3_bucket" {
  source             = "./modules/s3_buckets"
  first_bucket       = var.first_bucket
  force_destroy      = var.force_destroy
  versioning_enabled = var.versioning_enabled 
}
