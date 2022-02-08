terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "ap-northeast-2"
}

resource "aws_instance" "app_server" {
  ami                    = "ami-0454bb2fefc7de534"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["sg-0fed760a99e6a90cf"]
  key_name               = "snow"
  tags = {
    Name = var.instance_name
  }
}
