# Application Level Variables
env      = "dev"
app_name = "coles"

# VPC Varibales
region         = "ap-southeast-2"
vpc_cidr_block = "10.0.0.0/24"

// Single AZ Setup
# az_list            = ["ap-southeast-2a"]
# private_cidr_block = ["10.0.0.0/28"]
# public_cidr_block  = ["10.0.0.32/28"]

// Multi AZ Setup
az_list            = ["ap-southeast-2a", "ap-southeast-2b"]
private_cidr_block = ["10.0.0.0/28", "10.0.0.16/28"]
public_cidr_block  = ["10.0.0.32/28", "10.0.0.48/28"]

#EC2 variables
instance_type = "t2.micro"
key_name      = "demo-app-key"

#ASG
desired_capacity = 1
max_size         = 1
min_size         = 0

#RDS
db_engine            = "mysql"
db_engine_version    = "5.7"
db_instance_class    = "db.t3.micro"
db_allocated_storage = 10