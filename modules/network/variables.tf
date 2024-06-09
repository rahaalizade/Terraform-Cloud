variable "vpc_name" {
  description = "It is my VPC name"
  type        = string
}

variable "cidr_vpc" {
  description = "It's a CIDR block for our VPC"
}

variable "cidr_pub_subnet" {
  description = "It's a CIDR block for our public subnet"
}

variable "cidr_priv_subnet" {
  description = "It's a CIDR block for our private subnet"
}

variable "pub_subnet_name" {
  description = "It's a name for our private subnet"
}

variable "priv_subnet_name" {
  description = "It's a name for our private subnet"
}

variable "region_location" {
  description = "It's the name of region"
}