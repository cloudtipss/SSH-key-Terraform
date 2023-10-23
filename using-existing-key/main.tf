### VPC and Security Group block
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.1.2"

  name = "${var.env}-vpc"

  cidr = var.cidr
  azs  = var.aws_availability_zones

  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true

  public_subnet_tags = merge(
    var.additional_tags,
    {
      "Subnet" = "Public"
    }
  )

  private_subnet_tags = merge(
    var.additional_tags,
    {
      "Subnet" = "Private"
    }
  )
}

resource "aws_security_group" "ssh" {
  name        = "allow_ssh"
  description = "Allow ssh inbound traffic"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}

### SSH Key 
resource "aws_key_pair" "public_key" {
  key_name   = var.ssh_key_name
  public_key = "${file("ec2-manual-key.pub")}"
}

### EC2 Instance 
module "ec2-instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.5.0"

  name = var.ec2_name
  instance_type = var.ec2_type
  subnet_id = module.vpc.public_subnets[0]
  associate_public_ip_address = true
  key_name = aws_key_pair.public_key.key_name
  vpc_security_group_ids = [aws_security_group.ssh.id]
}