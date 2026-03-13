resource "aws_instance" "terraform" {
  ami           = "ami-0220d79f3f480ecf5"
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.terraform_sg.id]
  tags = {
    Name = "terraform"
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
    cidr_blocks     = ["0.0.0.0/0"]
  }
  ingress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
  tags = {
    Name = "terraform_sg"
  }
}
  