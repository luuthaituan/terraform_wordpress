provider "aws" {
  region = var.region
}

module "networks" {
  source = "./modules/networks"

}

module "ec2" {
  source                        = "./modules/ec2"
  wordpress-public_subnetA-dev  = module.networks.wordpress-public_subnetA-dev
  wordpress-public_subnetB-dev  = module.networks.wordpress-public_subnetB-dev
  wordpress-private_subnetA-dev = module.networks.wordpress-private_subnetA-dev
  wordpress-private_subnetB-dev = module.networks.wordpress-private_subnetB-dev
  vpc_id                        = module.networks.vpc_id
}
