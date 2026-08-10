Purpose
-------
This module creates the security groups used by the bastion and Kubernetes nodes.

Inputs
------
- `vpc_id` (string) - VPC ID where SGs will be created
- `my_public_ip` (string) - CIDR allowed for bastion SSH access
- `bastion_sg_name` (string) - Name for bastion SG (default: `bastion-sg`)
- `kubernetes_sg_name` (string) - Name for k8s SG (default: `k8s-sg`)

Outputs
-------
- `bastion_sg_id` - ID of the bastion security group
- `kubernetes_sg_id` - ID of the kubernetes security group
