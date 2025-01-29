module "vpc" {
  source               = "./modules/vpc"
  vpc_cidr             = var.vpc_cidr
  project_name         = var.project_name
  instance_tenancy     = var.instance_tenancy
  enable_dns_hostnames = var.enable_dns_hostnames
  public_subnet_az1_a  = var.public_subnet_az1_a
  public_subnet_az1_b  = var.public_subnet_az1_b
  public_subnet_az1_c  = var.public_subnet_az1_c
  private_subnet_az1_a = var.private_subnet_az1_a
  private_subnet_az1_b = var.private_subnet_az1_b
  private_subnet_az1_c = var.private_subnet_az1_c
  region               = var.region
}

