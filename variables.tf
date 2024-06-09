variable "cidr_vpc" {
  description = "It's a CIDR block for our VPC"
  default = "10.0.0.0/24"
}

variable "cidr_pub_subnet" {
  description = "It's a CIDR block for our public subnet"
  default = "10.0.1.0/24"
}
