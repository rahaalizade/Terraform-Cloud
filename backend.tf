terraform {
  backend "s3" {
    bucket         = "terraform-remote-state" 
    key            = "my-terraform-cloud-project"
    region         = "us-east-1"
  }
}

