# configure AWS provider 
provider "aws" {
    region = var.region
    profile = "teamc-user"
}

# create vpc
module "vpc" {
  source = "../modules/vpc"
  region = var.region
  project_name = var.project_name
  vpc_cidr = var.vpc_cidr
  public_subnet_az1_cidr = var.public_subnet_az1_cidr
  public_subnet_az2_cidr = var.public_subnet_az2_cidr
  public_subnet_az3_cidr = var.public_subnet_az3_cidr
  private_subnet_az1_cidr =var.private_subnet_az1_cidr
  private_subnet_az2_cidr = var.private_subnet_az2_cidr
  private_subnet_az3_cidr = var.private_subnet_az3_cidr
}

#create nat-gateways 
module "nat-gateway" {
  source = "../modules/nat-gateway"
  public_subnet_az1_id = module.vpc.public_subnet_az1_id
  internet_gateway = module.vpc.internet_gateway
  public_subnet_az2_id = module.vpc.public_subnet_az2_id
  public_subnet_az3_id = module.vpc.public_subnet_az3_id
  vpc_id = module.vpc.vpc_id
  private_subnet_az1_id = module.vpc.private_subnet_az1_id
  private_subnet_az2_id = module.vpc.private_subnet_az2_id
  private_subnet_az3_id = module.vpc.private_subnet_az3_id
}