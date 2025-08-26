terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "ap-southeast-1"
}


module "vpc1" {
  source        = "./modules/vpc"
  tool          = var.tool
  ec2_ami       = var.ec2_ami
  key_pair_name = var.key_pair_name
}
