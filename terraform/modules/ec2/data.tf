data "aws_ami" "ec2_ami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# Get Instance 
data "aws_instances" "app_instance" {
  instance_tags = {
    Name = "${var.app_name}-${var.env}-web_server"
  }
    instance_state_names = ["running"]
}
