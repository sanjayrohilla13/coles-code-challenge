// provision VPC and Subnets
// Sanjay - New Code 
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

#provision the ASG
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
  az_list                    = var.az_list
  db_engine                  = var.db_engine
  db_engine_version          = var.db_engine_version
  db_parameter_group_name    = var.db_parameter_group_name
  db_instance_class          = var.db_instance_class
  db_allocated_storage       = var.db_allocated_storage
  private_subnet_ids         = module.vpc.private_subnet_ids
  private_security_group_ids = module.ec2.private_security_group_ids
}
