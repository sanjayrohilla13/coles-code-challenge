module "vpc" {
  source             = "../../modules/vpc"
  env                = var.env
  app_name           = var.app_name
  region             = var.region
  az_list            = var.az_list
  vpc_cidr_block     = var.vpc_cidr_block
  private_cidr_block = var.private_cidr_block
  public_cidr_block  = var.public_cidr_block
}

module "ec2" {
  source             = "../../modules/ec2"
  env                = var.env
  app_name           = var.app_name
  app_vpc_id         = module.vpc.app_vpc_id
  private_subnet_ids = module.vpc.private_subnet_ids
  public_subnet_ids  = module.vpc.public_subnet_ids
  vpc_cidr_block     = var.vpc_cidr_block
  private_cidr_block = var.private_cidr_block
  public_cidr_block  = var.public_cidr_block
  key_name           = var.key_name
  instance_type      = var.instance_type
  desired_capacity   = var.desired_capacity
  max_size           = var.max_size
  min_size           = var.min_size
}

module "rds" {
  source                     = "../../modules/rds"
  app_name                   = var.app_name
  env                        = var.env
  private_subnet_ids         = module.vpc.private_subnet_ids
  private_security_group_ids = module.ec2.private_security_group_ids
}