module "vpc" {
  source = "./modules/vpc"

  vpc_cidr           = "10.0.0.0/16"
  public_subnet_cidr = "10.0.1.0/24"
}

module "security" {
  source = "./modules/security"

  vpc_id = module.vpc.vpc_id
  my_ip  = var.my_ip
}

module "ec2" {
  source = "./modules/ec2"

  subnet_id = module.vpc.subnet_id
  sg_id     = module.security.sg_id
  key_name  = var.key_name
}
