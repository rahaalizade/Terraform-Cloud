provider "aws" {
  region = "us-east-1"
}

data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_vpc" "my_vpc" {
  cidr_block = var.cidr_vpc

  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "pub_subnet" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = var.cidr_pub_subnet

  tags = {
    Name = var.pub_subnet_name
  }
}

resource "aws_subnet" "priv_subnet" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = var.cidr_priv_subnet

  tags = {
    Name = var.priv_subnet_name
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "InternetGW"
  }
}

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

resource "aws_route_table_association" "public_route" {
  subnet_id      = aws_subnet.pub_subnet.id
  route_table_id = aws_route_table.rt.id
}

resource "aws_eip" "eip" {
  domain = "vpc"
}

resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.priv_subnet.id

  tags = {
    Name = "gw NAT"
  }
  depends_on = [aws_internet_gateway.gw]
}


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

resource "aws_route_table_association" "private_route_a" {
  subnet_id      = aws_subnet.priv_subnet.id
  route_table_id = aws_route_table.private_rt.id
}
