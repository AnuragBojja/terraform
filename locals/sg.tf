resource "aws_security_group" "terraform_sg" {
  name   = "roboshop_secure_sg"
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = var.cidr
  }
  dynamic "ingress" {
    for_each = toset(var.ingress_list)
    content {
        from_port       = ingress.value
        to_port         = ingress.value
        protocol        = "tcp"
        cidr_blocks     = var.cidr
    }
    
  }
  tags = local.ec2_tags
}