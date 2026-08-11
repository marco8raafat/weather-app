resource "aws_instance" "bastion" {
  ami = var.ubuntu_ami
  instance_type = var.instance_type
  subnet_id = var.public_subnet_id
  vpc_security_group_ids = [
    var.bastion_sg_id
  ]
  key_name = var.key_name
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
  key_name = var.key_name
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
  key_name = var.key_name
  root_block_device {
    volume_size = var.root_volume_size
    volume_type = var.root_volume_type
    encrypted   = var.root_volume_encrypted
  }
  tags = {
    Name = "${var.name_prefix}-k8s-worker-${count.index + 1}"
  }
}
