# variable "instance" {
# #     default = {
# #         mongodb = {
# #             instance_type = "t3.micro"
# #         }
# #         redis = {
# #             instance_type = "t3.micro"
# #         }
# #         mysql = {
# #             instance_type = "t3.micro"
# #         }
# #     }
#     default = [ "mongodb","mysql","redis" ]
# # #   default = {
# # #     ### <service-name>  = <instance_type>
# # #     mongodb = "t3.micro"
# # #     redis   = "t3.micro"
# # #     mysql   = "t3.small"
# # #   }
# }
variable "common_tags" {
    default = {
        Project = "Roboshop"
        Env = "Dev"
        Terraform = "true"
    }
}

variable "name" {
    default = "local"
}
variable "project" {
    default = "Roboshop" 
}
variable "zone_id" {
  default = "Z086025214DK5VMINA2N"
}

variable "domain_name" {
  default = "anuragaws.shop"
}

variable "cidr" {
    default = ["0.0.0.0/0"]

}

variable "ingress_list" {
  default = [22,8080,80,2207]
}