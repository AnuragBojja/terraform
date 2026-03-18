locals {
  instance = "t3.micro"
  common_name = "${var.name}-${var.project}"
  ami_id = data.aws_ami.roboshop_ami.id
  ec2_tags = merge(
    var.common_tags,
    {
      Name = local.common_name
    }
  )
}