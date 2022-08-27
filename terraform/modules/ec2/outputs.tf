output "private_security_group_ids" {
  value = aws_security_group.private_sg[*].id
}