Purpose
-------
This module handles SSH key generation and EC2 instances (bastion, master, workers).

Inputs
------
- `ubuntu_ami` (string) - AMI ID for instances
- `instance_type` (string) - EC2 instance type
- `public_subnet_id` (string) - Public subnet for bastion
- `private_subnet_id` (string) - Private subnet for master/workers
- `bastion_sg_id` (string) - Bastion security group ID
- `kubernetes_sg_id` (string) - Kubernetes security group ID
- `key_name` (string) - Name for the AWS key pair
- `worker_count` (number) - Number of worker instances
- `root_volume_size/type/encrypted` - Root volume settings
- `private_key_filename` - Where to write the private key locally

Outputs
-------
- `bastion_public_ip`, `master_private_ip`, `worker_private_ips`
- `private_key_path` - Local path to generated private key
