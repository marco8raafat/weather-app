module "networking" {
  source = "./modules/networking"

  vpc_cidr            = var.vpc_cidr
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
  availability_zone   = var.availability_zone
  name_prefix         = var.name_prefix
}

module "security" {
  source = "./modules/security"

  vpc_id        = module.networking.vpc_id
  my_public_ip  = var.my_public_ip
  bastion_sg_name = var.bastion_sg_name
  kubernetes_sg_name = var.kubernetes_sg_name
}

module "compute" {
  source = "./modules/compute"

  ubuntu_ami        = var.ubuntu_ami
  instance_type     = var.instance_type
  public_subnet_id  = module.networking.public_subnet_id
  private_subnet_id = module.networking.private_subnet_id
  bastion_sg_id     = module.security.bastion_sg_id
  kubernetes_sg_id  = module.security.kubernetes_sg_id
  key_name          = var.key_name
  worker_count      = var.worker_count
  root_volume_size  = var.root_volume_size
  root_volume_type  = var.root_volume_type
  root_volume_encrypted = var.root_volume_encrypted
  private_key_filename = var.private_key_filename
  tls_algorithm     = var.tls_algorithm
  tls_rsa_bits      = var.tls_rsa_bits
  name_prefix       = var.name_prefix
}

module "ansible_inventory" {
  source = "./modules/ansible-inventory"

  bastion_public_ip = module.compute.bastion_public_ip
  master_private_ip = module.compute.master_private_ip
  worker_private_ips = module.compute.worker_private_ips
  private_key_path  = module.compute.private_key_path
  inventory_path    = var.inventory_path
}