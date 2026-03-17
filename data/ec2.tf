resource "aws_instance" "terraform" {
  for_each = var.instance
  #for_each = toset(var.instance)
  ami           = data.aws_ami.roboshop_ami.id
  instance_type = each.value.instance_type
  vpc_security_group_ids = [aws_security_group.terraform_sg.id]
  tags = {
    Name = each.key
    Terraform = "true"
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
  for_each = aws_instance.terraform
  zone_id = var.zone_id
  name    = "${each.key}.${var.domain_name}"
  #name = "${aws_instance.terraform[count.index].tags.Name}.${var.domain_name}"
  type    = "A"
  ttl     = 1
  records = [each.value.private_ip]
  allow_overwrite = true
}  