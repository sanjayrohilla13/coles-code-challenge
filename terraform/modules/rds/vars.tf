variable "env" {
  description = "Environment Name"
  type        = string
}

variable "app_name" {
  description = "Application Name"
  type        = string
}

variable "az_list" {
  description = "List of the AZ to deploy the application"
  type        = list(string)
}

variable "private_subnet_ids" {
  description = "Private Subnet Ids"
  type        = list(string)
}

variable "private_security_group_ids" {
  description = "Private Security Group Ids"
  type        = list(string)
}

variable "db_engine" {
  description = "RDS Engine (SQL/Postgres)"
  type        = string
}

variable "db_engine_version" {
  description = "Data Base Engine Version"
  type        = string
}

variable "db_parameter_group_name" {
  description = "Data Base Parameter Group Name"
  type        = string
}

variable "db_instance_class" {
  description = "RDS Instance Class"
  type        = string
}

variable "db_allocated_storage" {
  description = "RDS Instance Storage"
  type        = number
}