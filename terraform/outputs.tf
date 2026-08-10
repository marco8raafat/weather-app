output "bastion_public_ip" {
  value = module.compute.bastion_public_ip
}

output "master_private_ip" {
  value = module.compute.master_private_ip
}

output "worker_private_ips" {
  value = module.compute.worker_private_ips
}

output "inventory_path" {
  value = module.ansible_inventory.inventory_path
}