variable "vpc_name" {
  description = "It is my VPC name"
  type        = string
}

variable "cidr_vpc" {
  description = "It's a CIDR block for our VPC"
  #default     = "10.0.0.0/16"
}

variable "cidr_pub_subnet" {
  description = "It's a CIDR block for our public subnet"
  #default     = "10.0.1.0/24"
}

variable "cidr_priv_subnet" {
  description = "It's a CIDR block for our private subnet"
  #default     = "10.0.2.0/24"
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