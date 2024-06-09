terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
    backend "s3" {
      bucket = "remote-state-bucket-raha"
      key    = "stateFolder/prod/us-west-1/network.tfstate"
      region = "us-east-1"
      dynamodb_table = "remote-state-bucket-raha"
  }
}


module "network" {
  source = "../../../modules/network"
  cidr_vpc         = var.cidr_vpc
  cidr_pub_subnet  = var.cidr_pub_subnet
  cidr_priv_subnet = var.cidr_priv_subnet
  vpc_name         = var.vpc_name
  priv_subnet_name = var.priv_subnet_name
  pub_subnet_name  = var.pub_subnet_name
  region_location = var.region_location
}
