Purpose
-------
Render an Ansible inventory file from module inputs.

Inputs
------
- `bastion_public_ip`, `master_private_ip`, `worker_private_ips`, `private_key_path`
- `inventory_path` - path to write the inventory (default: `../ansible/inventory/inventory.ini`)

Outputs
-------
- `inventory_path` - path to the written inventory file
