[bastion]
bastion ansible_host=${bastion_public_ip} ansible_user=ubuntu

[master]
master ansible_host=${master_private_ip} ansible_user=ubuntu

[workers]
%{ for idx, ip in worker_private_ips }
worker${idx + 1} ansible_host=${ip} ansible_user=ubuntu
%{ endfor }

[kubernetes:children]
master
workers

[kubernetes:vars]
ansible_user=ubuntu
ansible_ssh_private_key_file=${private_key_path}
ansible_ssh_common_args='-o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o ProxyCommand="ssh -i ${private_key_path} -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -W %h:%p ubuntu@${bastion_public_ip}"'
