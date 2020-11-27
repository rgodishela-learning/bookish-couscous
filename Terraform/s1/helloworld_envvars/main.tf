terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 2.70"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = var.region
}

resource "aws_instance" "helloworld" {
  ami           = "ami-0cda377a1b884a1bc"
  instance_type = "t2.micro"
  tags = {
    Name = "helloworld_envvars"
  }
}
