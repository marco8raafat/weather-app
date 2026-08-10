variable "bastion_public_ip" {
  type = string
}

variable "master_private_ip" {
  type = string
}

variable "worker_private_ips" {
  type = list(string)
}

variable "private_key_path" {
  type = string
}

variable "inventory_path" {
  type    = string
  default = "../ansible/inventory/inventory.ini"
}
