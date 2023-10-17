variable "aws_profile" {
  description = "Set this variable if you use another profile besides the default awscli profile called 'default'."
  type        = string
  default     = "default"
}

variable "aws_region" {
  description = "Set this variable if you use another aws region."
  type        = string
  default     = "us-east-1"
}

variable "env" {
  description = "Set this variable to specify environment"
  type        = string
  default     = "dev"
}

variable "private_subnets" {
  description = "private subnets to create, need to have 1 for each AZ"
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "public_subnets" {
  description = "public subnets to create, need to have 1 for each AZ"
  default     = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
}

variable "aws_availability_zones" {
  description = "AWS availability zones"
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "cidr" {
  description = "Cird block for your VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "additional_tags" {
  default     = {
    "project"     = "cloudtipss-vpc"
    "owner"       = "cloudtipss.com"
  }
  description = "Additional resource tags"
  type        = map(string)
}

variable "ssh_key_name" {
  description = "File name to save your private key"
  type        = string
  default     = "ec2-manual-key"
}

variable "ec2_name" {
  description = "Name for your EC2 Instance"
  type        = string
  default     = "ec2-terraform"
}

variable "ec2_type" {
  description = "Type of your instance"
  type        = string
  default     = "t3.small"
}