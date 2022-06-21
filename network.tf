
resource "aws_vpc" "acme-vpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = "acme"
  }
}


resource "aws_subnet" "acme-public" {
  vpc_id     = aws_vpc.acme-vpc.id
  cidr_block = var.public_subnet_cidr

  tags = {
    Name = "acme-public"
  }
}
