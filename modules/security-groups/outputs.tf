output "private_alb_security_group_id" {
  value = aws_security_group.private_alb_security_group.id
}

output "public_alb_security_group_id" {
  value = aws_security_group.public_alb_security_group.id
}

output "linux_security_group_id" {
  value = aws_security_group.linux_security_group.id
}

output "windows_security_group_id" {
  value = aws_security_group.windows_security_group.id
}