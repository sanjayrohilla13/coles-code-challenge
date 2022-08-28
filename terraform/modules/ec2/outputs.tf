output "private_security_group_ids" {
  value = aws_security_group.private_sg[*].id
}

output "ec2_external_ip" {
  value = data.aws_instances.app_instance.public_ips
}