# Public Route Table
resource "aws_route_table" "app_public_rt_table" {
  vpc_id = aws_vpc.app_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.app_igw.id
  }

  tags = {
    Name = "${var.app_name}-${var.env}-public-route-table"
  }
}

#Associate Public Route Table with Public Subnets
resource "aws_route_table_association" "public_subnet_rt_association" {
  count = length(var.az_list)
  subnet_id      = aws_subnet.app_public_subnet[count.index].id
  route_table_id = aws_route_table.app_public_rt_table.id
}

# Private Route Table
resource "aws_route_table" "app_private_rt_table" {
  
  count = length(var.az_list)
  vpc_id = aws_vpc.app_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.app_nat_gw[count.index].id
  }

  tags = {
    Name = "${var.app_name}-${var.env}-private-route-table-${count.index}"
  }
}

#Associate Private Subnet with Private Route Table
resource "aws_route_table_association" "private_subnet_rt_association" {
    count = length(var.az_list)
  subnet_id      = aws_subnet.app_private_subnet[count.index].id
  route_table_id = aws_route_table.app_private_rt_table[count.index].id
}