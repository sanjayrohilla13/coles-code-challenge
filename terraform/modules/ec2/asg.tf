resource "aws_launch_configuration" "app_launch_config" {
  name_prefix = "${var.app_name}-${var.env}-"
  image_id      = data.aws_ami.ec2_ami.id
  instance_type = "t2.micro"
  security_groups = [aws_security_group.public_sg.id]
  key_name = "demo-app-key"
  associate_public_ip_address = true
  user_data = templatefile("${path.module}/user-data/script.sh",{})
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "app_asg" {
  name = "${var.app_name}-${var.env}-ASG"
  launch_configuration = aws_launch_configuration.app_launch_config.name
  vpc_zone_identifier = [for subnet in var.public_subnet_ids : subnet]

  desired_capacity   = 1
  max_size           = 1
  min_size           = 0
  tag {
    key =   "Name"
    value = "${var.app_name}-${var.env}-web_server"
    propagate_at_launch = true
  }
}