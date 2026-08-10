variable "vpc_id" {
  type = string
}

variable "my_public_ip" {
  type = string
}

variable "bastion_sg_name" {
  type    = string
  default = "bastion-sg"
}

variable "kubernetes_sg_name" {
  type    = string
  default = "k8s-sg"
}
