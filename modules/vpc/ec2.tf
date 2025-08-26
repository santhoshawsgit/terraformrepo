# Security group for EC2
resource "aws_security_group" "ec2_sg" {
  name        = "${var.tool}-sg"
  description = "Security group for ${var.tool} EC2"
  vpc_id      = aws_vpc.dockervpc.id

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.tool}-sg"
  }
}


# EC2 instance
resource "aws_instance" "ec2" {
  ami                         = var.ec2_ami
  instance_type               = var.ec2_instance_type
  subnet_id                   = aws_subnet.dockerpubsub.id
  vpc_security_group_ids      = [aws_security_group.ec2_sg.id]
  key_name                    = var.key_pair_name
  associate_public_ip_address = true

  tags = {
    Name = "${var.tool}-ec2"
  }
}