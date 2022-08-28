#Private Security Group
resource "aws_security_group" "private_sg" {
  name        = "private_sg"
  description = "Security Group for Private Subnet"
  vpc_id      = var.app_vpc_id

  ingress {
    description     = "Data Base Port"
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.public_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.app_name}-${var.env}-private-SG"
  }
}

#Public Security Group
resource "aws_security_group" "public_sg" {
  name        = "public_sg"
  description = "Security Group for Public Subnet"
  vpc_id      = var.app_vpc_id

  ingress {
    description = "Data Base Port"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.app_name}-${var.env}-public-SG"
  }
}