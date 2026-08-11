variable "ubuntu_ami" {
  type = string
}

variable "instance_type" {
  type    = string
  default = "t3.small"
}

variable "public_subnet_id" {
  type = string
}

variable "private_subnet_id" {
  type = string
}

variable "bastion_sg_id" {
  type = string
}

variable "kubernetes_sg_id" {
  type = string
}

variable "key_name" {
  type = string
}

variable "worker_count" {
  type    = number
  default = 2
}

variable "root_volume_size" {
  type    = number
  default = 20
}

variable "root_volume_type" {
  type    = string
  default = "gp3"
}

variable "root_volume_encrypted" {
  type    = bool
  default = true
}

variable "tls_algorithm" {
  type    = string
  default = "RSA"
}

variable "tls_rsa_bits" {
  type    = number
  default = 4096
}

variable "name_prefix" {
  type    = string
  default = "weather"
}
