variable "ami_id" {
  default = "ami-0220d79f3f480ecf5"
}

variable "instance_type" {
  default = "t3.micro"
}

variable "instances" {
  type = list
  ### make sure to change count below ###
  default = [ "mongodb","mysql","redis","rabbitmq" ]
  # default = {
  #   Name = "terraform"
  #   Terraform = "true"
  #   Env = "Dev"
  #   Project = "Roboshop"
  # }  
}

variable "cnt" {
  default = 4
}
variable "cidr" {
  default = ["0.0.0.0/0"]
}

variable "zone_id" {
  default = "Z086025214DK5VMINA2N"
}

variable "domain_name" {
  default = "anuragaws.shop"
}

