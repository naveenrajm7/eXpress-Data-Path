variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-1"
}

variable "aws_az" {
  description = "Availability zone"
  type        = string
  default     = "us-east-1a"
}

variable "d1_name" {
  description = "Cisco TRex Traffic Generator"
  type        = string
  default     = "tRex"
}

variable "d2_name" {
  description = "XDP Device Under Test"
  type        = string
  default     = "xdp-DUT"
}

variable "instance_type" {
  description = "EC2 Instance type"
  type = string
  default = "c5n.xlarge" # t2.micro, c5n.xlarge, c5n.2xlarge, c5n.4xlarge ,c5n.9xlarge, c5n.18xlarge (High speed experiment)
}

variable "instance_ami" {
  type        = string
  description = "The id of the machine image (AMI) to use for the server."
  default = "ami-0574da719dca65348" # Ubuntu 22.04 # us ami-0574da719dca65348 # ca ami-0a7154091c5c6623e
  validation {
    condition     = length(var.instance_ami) > 4 && substr(var.instance_ami, 0, 4) == "ami-"
    error_message = "The image_id value must be a valid AMI id, starting with \"ami-\"."
  }
}

variable "instance_key" {
  description = "Key pair"
  type = string
  default = "xdp681us"
}

variable "vpc_cidr_block" {
  description = "VPC CIDR"
  type = string
  default = "198.18.0.0/16" # RFC 2544, aws /15 not allowed
}

variable "public_subnet" {
  type = string
  default = "198.18.60.0/24"
}

variable "private_subnet1" {
  type = string
  default = "198.18.1.0/24"
}

variable "private_subnet2" {
  type = string
  default = "198.18.2.0/24"
}

variable "nics" {
  type = list(object({name = string,int_ips = list(string)}))
  default = [
    { 
      name =  "trex"
      int_ips = ["198.18.1.11", "198.18.2.11"]
    },
    {
      name = "xdp_dut"
      int_ips = ["198.18.1.10", "198.18.2.10"]
    }
  ]
}