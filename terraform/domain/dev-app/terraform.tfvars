# Application Level Variables
env      = "dev"
app_name = "coles"

# VPC Varibales
region             = "ap-southeast-2"
az_list            = ["ap-southeast-2a", "ap-southeast-2b"]
vpc_cidr_block     = "10.0.0.0/24"
private_cidr_block = ["10.0.0.0/28", "10.0.0.16/28"]
public_cidr_block  = ["10.0.0.32/28", "10.0.0.48/28"]