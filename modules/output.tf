output "instance_ip_address" {
  value = aws_instance.ec2.public_ip
  value = aws_instance.ec2.private_ip
}
