terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_vpc" "my_vpc" {
  cidr_block       = "10.0.0.0/16"

  tags = {
    Name = "Raha VPC"
  }
}

resource "aws_subnet" "sb01" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "Subnet01"
  }
}

resource "aws_subnet" "sb02" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "Subnet02"
  }
}
