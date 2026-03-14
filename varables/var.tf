variable "ami_id" {
  default = "ami-0220d79f3f480ecf5"
}

variable "instance_type" {
  default = "t3.micro"
}

variable "ec2_tags" {
  default = {
    Name = "terraform"
    Terraform = "true"
    Env = "Dev"
    Project = "Roboshop"
  }  
}

variable "cidr" {
  default = ["0.0.0.0/0"]
}