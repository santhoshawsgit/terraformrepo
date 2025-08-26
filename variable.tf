# VPC CIDR block
variable "tool" {
  description = "dockertool"
  type        = string
  default     = "doc"
}


variable "ec2_ami" {
  description = "AMI ID for EC2 instance"
  type        = string
  default     = "ami-1234567890abcdef0"
}

variable "ec2_instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "key_pair_name" {
  description = "Name of the existing AWS key pair to use"
  type        = string
  default     = "key"
}