resource "aws_db_subnet_group" "app_db_subnet_group" {
  name       = "${var.app_name}-${var.env}-db_subnet-group"
  subnet_ids = local.private_subnet_ids

  tags = {
    Name = "${var.app_name}-${var.env}-db_subnet-group"
  }
}

resource "aws_db_instance" "app_rds" {
  identifier             = "${var.app_name}-${var.env}-rds"
  allocated_storage      = var.db_allocated_storage
  engine                 = var.db_engine
  engine_version         = var.db_engine_version
  instance_class         = var.db_instance_class
  db_name                = data.aws_ssm_parameter.rds_name.value
  username               = data.aws_ssm_parameter.rds_user.value
  password               = data.aws_ssm_parameter.rds_password.value
  parameter_group_name   = "default.mysql5.7"
  skip_final_snapshot    = true
  apply_immediately      = true
  availability_zone      = "ap-southeast-2a"
  vpc_security_group_ids = [for sg in var.private_security_group_ids : sg]
  db_subnet_group_name   = aws_db_subnet_group.app_db_subnet_group.name

  tags = {
    Name = "${var.app_name}-${var.env}-RDS"
  }

}