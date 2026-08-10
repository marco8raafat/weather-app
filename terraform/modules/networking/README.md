Purpose
-------
This module provisions the VPC, public and private subnets, Internet Gateway, NAT Gateway + EIP, route tables, and associations.

Inputs
------
- `vpc_cidr` (string) - VPC CIDR block. Default: `10.0.0.0/16`
- `public_subnet_cidr` (string) - Public subnet CIDR. Default: `10.0.1.0/24`
- `private_subnet_cidr` (string) - Private subnet CIDR. Default: `10.0.2.0/24`
- `availability_zone` (string) - AZ to place subnets. Default: `us-east-1a`
- `name_prefix` (string) - Prefix for resource names/tags. Default: `weather`

Outputs
-------
- `vpc_id` - The created VPC ID
- `public_subnet_id` - Public subnet ID
- `private_subnet_id` - Private subnet ID
- `nat_gateway_id` - NAT gateway ID
- `internet_gateway_id` - Internet gateway ID
