terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
    backend "s3" {
      bucket = "remote-state-bucket-raha"
      key    = "stateFolder/dev/us-east-1/network.tfstate"
      region = "us-east-1"
      dynamodb_table = "remote-state-bucket-raha"
  }
}


module "network" {
  source = "../../../modules/network"
  cidr_vpc         = "10.10.0.0/16"
  cidr_pub_subnet  = "10.10.1.0/24"
  cidr_priv_subnet = "10.10.2.0/24"
  vpc_name         = "vpc1"
}
