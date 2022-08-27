variable "env" {
  description = "Environment Name"
  type        = string
}

variable "app_name" {
  description = "Application Name"
  type        = string
}

variable "region" {
  description = "AWS Region to deploy the application"
  type        = string
  default     = "ap-southeast-2"
}

variable "az_list" {
  description = "List of the AZ to deploy the application"
  type        = list(string)
}

variable "vpc_cidr_block" {
  description = "CIDR Block for the VPC"
  type        = string
}

variable "private_cidr_block" {
  description = "Private CIDR Block for the Subnets"
  type        = list(string)
}

variable "public_cidr_block" {
  description = "Public CIDR Block for the Subnets"
  type        = list(string)
}

#EC2 Module Variables
