terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
  backend "s3" {
    bucket = "robosho-terraform-bucket"
    key    = "remote-state-data"
    region = "us-east-1"
    use_lockfile = true
    encrypt = true
  }
}
