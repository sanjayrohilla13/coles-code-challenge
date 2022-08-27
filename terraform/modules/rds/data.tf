data "aws_ssm_parameter" "rds_name" {
  name = "/rds/rdsname"
}

data "aws_ssm_parameter" "rds_user" {
  name = "/rds/username"
}

data "aws_ssm_parameter" "rds_password" {
  name            = "/rds/password"
  with_decryption = true
}