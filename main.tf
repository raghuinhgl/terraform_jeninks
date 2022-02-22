provider "aws" {
  region     = var.region
  }

resource "aws_security_group" "Ec2_public_security_group1" {
  name        = "ec2-public-sg1"
  description = "instance reaching access for ec2 intances"
  vpc_id      = "vpc-021ae043a26c13bfc"

  ingress {
    from_port   = 8080
    protocol    = "TCP"
    to_port     = 8080
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    protocol    = "TCP"
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_instance" "jenkinsec2" {
  instance_type   = var.instance_type
  ami             = var.ami_id
  key_name        = "jenkins_key"
  security_groups = ["${aws_security_group.Ec2_public_security_group1.name}"]
  
  tags = {
    Name = "Auto-jenkin"
  }
}
