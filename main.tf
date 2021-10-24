provider "aws" {
  region = "us-east-2"
  access_key = "AKIAUCNGB7RCXJRKL4OB"
  secret_key = "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"

}

resource "aws_instance" "web" {
  ami           = "ami-00399ec92321828f5"
  instance_type = "t2.micro"

  tags = {
    Name = "my-instance-server"
  }
}
resource "aws_vpc" "dev" {
  cidr_block       = "172.20.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "dev-vpc"
  }
}
resource "aws_subnet" "public-subnet" {
  vpc_id     = aws_vpc.dev.id
  cidr_block = "172.20.10.0/24"

  tags = {
    Name = "dev-public-subnet"
  }
}
resource "aws_subnet" "private-subnet" {
  vpc_id     = aws_vpc.dev.id
  cidr_block = "172.20.20.0/24"

  tags = {
    Name = "dev-private-subnet"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.dev.id

  tags = {
    Name = "main-inetrnet-getway"
  }
}
resource "aws_nat_gateway" "example" {
  allocation_id = aws_eip.example.id
  subnet_id     = aws_subnet.example.id

  tags = {
    Name = "gw NAT"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.example]
}
