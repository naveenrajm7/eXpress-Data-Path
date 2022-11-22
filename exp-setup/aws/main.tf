terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "ca-central-1"
}


## TODO: 
## VPC
## Placement-group (cluster) , Network-Interface-Card
## Init scripts
## 

resource "aws_instance" "app_server" {
  ami           = "ami-0a7154091c5c6623e"
  instance_type = "t2.micro"

  tags = {
    Name = var.instance_name
  }
}
