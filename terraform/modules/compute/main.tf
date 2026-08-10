resource "tls_private_key" "ssh_key" {
  algorithm = var.tls_algorithm
  rsa_bits  = var.tls_rsa_bits
}

resource "local_file" "private_key" {
  filename        = var.private_key_filename
  content         = tls_private_key.ssh_key.private_key_pem
  file_permission = "0400"
}

resource "aws_key_pair" "weather_key" {
  key_name   = var.key_name
  public_key = tls_private_key.ssh_key.public_key_openssh
}

resource "aws_instance" "bastion" {
  ami = var.ubuntu_ami
  instance_type = var.instance_type
  subnet_id = var.public_subnet_id
  vpc_security_group_ids = [
    var.bastion_sg_id
  ]
  key_name = aws_key_pair.weather_key.key_name
  associate_public_ip_address = true
  root_block_device {
    volume_size = var.root_volume_size
    volume_type = var.root_volume_type
    encrypted   = var.root_volume_encrypted
  }
  tags = {
    Name = "${var.name_prefix}-bastion"
  }
}

resource "aws_instance" "master" {
  ami = var.ubuntu_ami
  instance_type = var.instance_type
  subnet_id = var.private_subnet_id
  vpc_security_group_ids = [
    var.kubernetes_sg_id
  ]
  key_name = aws_key_pair.weather_key.key_name
  associate_public_ip_address = false
  root_block_device {
    volume_size = var.root_volume_size
    volume_type = var.root_volume_type
    encrypted   = var.root_volume_encrypted
  }
  tags = {
    Name = "${var.name_prefix}-k8s-master"
  }
}

resource "aws_instance" "worker" {
  count = var.worker_count
  ami = var.ubuntu_ami
  instance_type = var.instance_type
  subnet_id = var.private_subnet_id
  vpc_security_group_ids = [
    var.kubernetes_sg_id
  ]
  key_name = aws_key_pair.weather_key.key_name
  root_block_device {
    volume_size = var.root_volume_size
    volume_type = var.root_volume_type
    encrypted   = var.root_volume_encrypted
  }
  tags = {
    Name = "${var.name_prefix}-k8s-worker-${count.index + 1}"
  }
}
