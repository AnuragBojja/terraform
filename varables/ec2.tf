resource "aws_instance" "terraform" {
  ami           = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.terraform_sg.id]
  tags = var.ec2_tags
}

resource "aws_security_group" "terraform_sg" {
  name   = "terraform_sg"
  description = "created using terraform allow all ports"
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = var.cidr
  }
  ingress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = var.cidr
  }
  tags = {
    Name = "terraform_sg"
  }
}

resource "aws_route53_record" "  " {
  zone_id = aws_route53_zone.primary.zone_id
  name    = "www.example.com"
  type    = "A"
  ttl     = 1
  records = [aws_eip.lb.public_ip]
}