resource "local_file" "ansible_inventory" {
  filename        = var.inventory_path
  file_permission = "0644"

  content = templatefile("${path.module}/inventory.tpl", {
    bastion_public_ip = var.bastion_public_ip
    master_private_ip = var.master_private_ip
    worker_private_ips = var.worker_private_ips
    private_key_path = var.private_key_path
  })
}
