provider "aws" {
  region = var.region_location
}

#### Creating VPC ####
resource "aws_vpc" "my_vpc" {
  cidr_block = var.cidr_vpc

  tags = {
    Name = var.vpc_name
  }
}


#### Creating Public Subnet for VPC ####
resource "aws_subnet" "pub_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.cidr_pub_subnet
  availability_zone = "${var.region_location}a"

  tags = {
    Name = var.pub_subnet_name
  }
}


#### Creating Private Subnet for VPC ####
resource "aws_subnet" "priv_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.cidr_priv_subnet
  availability_zone = "${var.region_location}a"

  tags = {
    Name = var.priv_subnet_name
  }
}


#### Creating Internet Gateway ####
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "InternetGW"
  }
}


#### Creating a Route Table for routinh to IGW ####
resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }


  tags = {
    Name = "Internet-RT"
  }
}


#### Creating table assocoation for public subnet ####
resource "aws_route_table_association" "public_route" {
  subnet_id      = aws_subnet.pub_subnet.id
  route_table_id = aws_route_table.rt.id
}

#### Creating a public IP for NAT GW ####
resource "aws_eip" "eip" {
  domain = "vpc"
}


#### Creating NAT GW for private subnet ####
resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.priv_subnet.id

  tags = {
    Name = "gw NAT"
  }
  depends_on = [aws_internet_gateway.gw]
}


#### Creating route table for private subnet ####
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gw.id
  }


  tags = {
    Name = "Private-RT"
  }
}


#### Creating table association for private subnet ####
resource "aws_route_table_association" "private_route_a" {
  subnet_id      = aws_subnet.priv_subnet.id
  route_table_id = aws_route_table.private_rt.id
}
