# VPC Creation for Application
resource "aws_vpc" "app_vpc" {
  cidr_block       = var.vpc_cidr_block
  instance_tenancy = "default"

  tags = {
    Name = "${var.app_name}-${var.env}-VPC"
  }
}

# Private Subnet Creation for the application
resource "aws_subnet" "app_private_subnet" {
  count             = length(var.private_cidr_block)
  vpc_id            = aws_vpc.app_vpc.id
  cidr_block        = var.private_cidr_block[count.index]
  availability_zone = var.az_list[count.index]

  tags = {
    Name = "${var.app_name}-${var.env}-pvt_subnet-${count.index + 1}"
  }
}

# Public Subnet Creation for the application

resource "aws_subnet" "app_public_subnet" {
  count             = length(var.public_cidr_block)
  vpc_id            = aws_vpc.app_vpc.id
  cidr_block        = var.public_cidr_block[count.index]
  availability_zone = var.az_list[count.index]

  tags = {
    "Name" = "${var.app_name}-${var.env}-pub_subnet-${count.index + 1}"
  }
}
