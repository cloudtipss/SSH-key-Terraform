## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="provider_local"></a> [local](#provider\_local) | n/a |
| <a name="provider_tls"></a> [tls](#provider\_tls) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ec2-instance"></a> [ec2-instance](#module\_ec2-instance) | terraform-aws-modules/ec2-instance/aws | 5.5.0 |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | terraform-aws-modules/vpc/aws | 5.1.2 |

## Resources

| Name | Type |
|------|------|
| [aws_key_pair.public_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair) | resource |
| [aws_security_group.ssh](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [local_file.private_key](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [tls_private_key.ssh_key](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_tags"></a> [additional\_tags](#input\_additional\_tags) | Additional resource tags | `map(string)` | <pre>{<br>  "owner": "cloudtipss.com",<br>  "project": "cloudtipss-vpc"<br>}</pre> | no |
| <a name="input_aws_availability_zones"></a> [aws\_availability\_zones](#input\_aws\_availability\_zones) | AWS availability zones | `list` | <pre>[<br>  "us-east-1a",<br>  "us-east-1b",<br>  "us-east-1c"<br>]</pre> | no |
| <a name="input_aws_profile"></a> [aws\_profile](#input\_aws\_profile) | Set this variable if you use another profile besides the default awscli profile called 'default'. | `string` | `"default"` | no |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | Set this variable if you use another aws region. | `string` | `"us-east-1"` | no |
| <a name="input_cidr"></a> [cidr](#input\_cidr) | Cird block for your VPC | `string` | `"10.0.0.0/16"` | no |
| <a name="input_ec2_name"></a> [ec2\_name](#input\_ec2\_name) | Name for your EC2 Instance | `string` | `"ec2-terraform"` | no |
| <a name="input_ec2_type"></a> [ec2\_type](#input\_ec2\_type) | Type of your instance | `string` | `"t3.small"` | no |
| <a name="input_env"></a> [env](#input\_env) | Set this variable to specify environment | `string` | `"dev"` | no |
| <a name="input_path"></a> [path](#input\_path) | Full path to you ssh folder or other folder to save private key | `string` | `"/Users/mykhailozhuravel/.ssh"` | no |
| <a name="input_private_key_name"></a> [private\_key\_name](#input\_private\_key\_name) | File name to save your private key | `string` | `"ec2-terraform.pem"` | no |
| <a name="input_private_subnets"></a> [private\_subnets](#input\_private\_subnets) | private subnets to create, need to have 1 for each AZ | `list` | <pre>[<br>  "10.0.1.0/24",<br>  "10.0.2.0/24",<br>  "10.0.3.0/24"<br>]</pre> | no |
| <a name="input_public_subnets"></a> [public\_subnets](#input\_public\_subnets) | public subnets to create, need to have 1 for each AZ | `list` | <pre>[<br>  "10.0.4.0/24",<br>  "10.0.5.0/24",<br>  "10.0.6.0/24"<br>]</pre> | no |
| <a name="input_ssh_key_name"></a> [ssh\_key\_name](#input\_ssh\_key\_name) | File name to save your private key | `string` | `"ec2-terraform"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_Connect_to_instance"></a> [Connect\_to\_instance](#output\_Connect\_to\_instance) | The public IP address assigned to the instance |
