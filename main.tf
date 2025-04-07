provider "aws" {
  region = var.region
}

module "vpc" {
  source      = "./modules/vpc"
  vpc_cidr    = var.vpc_cidr
  subnet_cidr = var.subnet_cidr
  vpc_name    = var.vpc_name
}

module "security" {
  source  = "./modules/security"
  vpc_id  = module.vpc.vpc_id
}

module "ec2" {
  source              = "./modules/ec2"
  ami_id              = var.ami_id
  instance_type       = var.instance_type
  subnet_id           = module.vpc.subnet_id
  security_group_ids  = [module.security.security_group_id]
}