resource "aws_instance" "terraform" {
  # for_each = var.instance
  #for_each = toset(var.instance)
  ami           = local.ami_id
  # instance_type = each.value.instance_type
  instance_type = local.instance
  vpc_security_group_ids = [aws_security_group.terraform_sg.id]
  tags = local.ec2_tags
}


  

# resource "aws_route53_record" "roboshop" {
#   for_each = aws_instance.terraform
#   zone_id = var.zone_id
#   name    = "${each.key}.${var.domain_name}"
#   #name = "${aws_instance.terraform[count.index].tags.Name}.${var.domain_name}"
#   type    = "A"
#   ttl     = 1
#   records = [each.value.private_ip]
#   allow_overwrite = true
# }  