resource "aws_internet_gateway" "app_igw" {
  vpc_id = aws_vpc.app_vpc.id

  tags = {
    Name = "${var.app_name}-${var.env}-IGW"
  }
}

resource "aws_eip" "app_eip" {
 count = length(var.az_list)
 tags = {
    Name = "${var.app_name}-${var.env}-EIP-${count.index + 1}"
 }
}

resource "aws_nat_gateway" "app_nat_gw" {
  count = length(var.az_list)
  allocation_id = aws_eip.app_eip[count.index].id
  subnet_id     = aws_subnet.app_public_subnet[count.index].id
  
  tags = {
    Name = "${var.app_name}-${var.env}-NAT_GW-${count.index + 1}"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.app_igw]
}