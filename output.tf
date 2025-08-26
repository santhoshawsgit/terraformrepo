output "ec2_public_ip" {
  value = module.vpc.instance_ip_address
}
