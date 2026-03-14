resource "aws_instance" "terraform" {
  count = length(var.instances)
  ami           = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.terraform_sg.id]
  tags = {
    Name = var.instances[count.index]
    }
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

resource "aws_route53_record" "roboshop" {
  count = length(var.instances)
  zone_id = var.zone_id
  name    = "${var.instances[count.index]}.${var.domain_name}"
  #name = "${aws_instance.terraform[count.index].tags.Name}.${var.domain_name}"
  type    = "A"
  ttl     = 1
  records = [aws_instance.terraform[count.index].private_ip]
}