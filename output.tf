output "Connect_to_instance" {
  description = "The public IP address assigned to the instance"
  value       = "ssh -i ${var.path}/${var.private_key_name} ec2-user@${module.ec2-instance.public_ip}"
}