resource "aws_instance" "terraform" {
  ami           = "ami-0220d79f3f480ecf5"
  instance_type = "t3.micro"
  region = "us-east-1"
  security_groups = "sg-0c38430134803699d"
  tags = {
    Name = "terraform"
    Terraform = "true"
  }
}