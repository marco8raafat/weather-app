output "bastion_sg_id" {
  value = aws_security_group.bastion_sg.id
}

output "kubernetes_sg_id" {
  value = aws_security_group.kubernetes_sg.id
}
