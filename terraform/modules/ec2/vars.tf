variable "env" {
  description = "Environment Name"
  type        = string
}

variable "app_name" {
  description = "Application Name"
  type        = string
}

variable "vpc_cidr_block" {
  description = "CIDR Block for the VPC"
  type        = string
}

variable "private_cidr_block" {
  description = "CIDR block for the Private Subnets"
  type        = list(string)
}

variable "public_cidr_block" {
  description = "CIDR Block for the Public Subnets"
  type        = list(string)
}

variable "app_vpc_id" {
  description = "Application VPC id"
  type        = string
}

variable "private_subnet_ids" {
  description = "Private Subnet Ids"
  type        = list(string)
}

variable "public_subnet_ids" {
  description = "Public Subnet Ids"
  type        = list(string)
}

#EC2 Variables
variable "key_name" {
  description = "EC2 Key Name"
  type        = string
}

variable "instance_type" {
  description = "Instance Type"
  type        = string
}

#ASG Variables
variable "desired_capacity" {
  description = "Desired Capacity"
  type        = number
}

variable "min_size" {
  description = "Min Required Instances"
  type        = number
}

variable "max_size" {
  description = "Max Required Instances"
  type        = number
}
