variable "instance" {
    default = {
        mongodb = {
            ami = "ami-0220d79f3f480ecf5"
            instance_type = "t3.micro"
        }
        redis = {
            ami = "ami-0220d79f3f480ecf5"
            instance_type = "t3.micro"
        }
        mysql = {
            ami = "ami-0220d79f3f480ecf5"
            instance_type = "t3.micro"
        }
    }
#   default = [ "mongodb","mysql","redis","rabbitmq" ]
#   default = {
#     ### <service-name>  = <instance_type>
#     mongodb = "t3.micro"
#     redis   = "t3.micro"
#     mysql   = "t3.small"
#   }
}

variable "zone_id" {
  default = "Z086025214DK5VMINA2N"
}

variable "domain_name" {
  default = "anuragaws.shop"
}
