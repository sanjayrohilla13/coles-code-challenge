terraform {
backend "s3" {
    bucket         = "059114722599-tf-state-bucket"                    
    key            = "terraform/ColesCodeTest/dev/terraform.tfstate"  
    dynamodb_table = "coles-dev-tf-state-lock"                
    region         = "ap-southeast-2"
  }
  required_providers {
    aws = {
      version = "~> 4.22.0"
      source  = "hashicorp/aws"
    }
  }
}