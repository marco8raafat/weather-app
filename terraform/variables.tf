variable "aws_region" {
  description = "AWS Region"
  type        = string
}

variable "my_public_ip" {
  description = "Your public IP address"
  type        = string
}

variable "ubuntu_ami" {
  description = "Ubuntu Server 26.04 LTS AMI ID"
  type        = string
}

variable "key_name" {
  description = "Name of the existing AWS key pair"
  type        = string
}

variable "instance_type" {
  default = "t3.small"
}

variable "availability_zone" {
  default = "us-east-1a"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR block for private subnet"
  type        = string
  default     = "10.0.2.0/24"
}

variable "worker_count" {
  description = "Number of worker ec2s"
  type        = number
  default     = 2
}

variable "root_volume_size" {
  description = "Root block device size in GB"
  type        = number
  default     = 20
}

variable "root_volume_type" {
  description = "Root block device type"
  type        = string
  default     = "gp3"
}

variable "root_volume_encrypted" {
  description = "Whether root volume should be encrypted"
  type        = bool
  default     = true
}

variable "private_key_filename" {
  description = "Filename for the generated private key"
  type        = string
  default     = "weather-key.pem"
}

variable "tls_algorithm" {
  description = "TLS private key algorithm"
  type        = string
  default     = "RSA"
}

variable "tls_rsa_bits" {
  description = "RSA key size in bits"
  type        = number
  default     = 4096
}

variable "name_prefix" {
  description = "Prefix for all created AWS resources"
  type        = string
  default     = "weather"
}

variable "bastion_sg_name" {
  description = "Name for the bastion security group"
  type        = string
  default     = "weather-bastion-sg"
}

variable "kubernetes_sg_name" {
  description = "Name for the Kubernetes security group"
  type        = string
  default     = "weather-kubernetes-sg"
}

variable "inventory_path" {
  description = "Path where the generated Ansible inventory file will be written"
  type        = string
  default     = "../ansible/inventory/inventory.ini"
}