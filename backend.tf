terraform {
  backend "s3" {
    region     = "us-west-2" 
    key        = "terraform.tfstate"
    bucket     = "raha-remote-state-bucket"
  }
}
