provider "aws" {
  region = "us-west-2"
}

module "s3_bucket" {
  source = "../modules/s3_buckets"
  bucket-name = "raha-is-going-to-munich"

}

