variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "ca-central-1"
}

variable "aws_az" {
  description = "Availability zone"
  type        = string
  default     = "ca-central-1a"
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
  default = "c5n.xlarge" # t2.micro, c5n.xlarge
}

variable "instance_ami" {
  type        = string
  description = "The id of the machine image (AMI) to use for the server."
  default = "ami-0a7154091c5c6623e" # Ubuntu 22.04
  validation {
    condition     = length(var.instance_ami) > 4 && substr(var.instance_ami, 0, 4) == "ami-"
    error_message = "The image_id value must be a valid AMI id, starting with \"ami-\"."
  }
}

variable "instance_key" {
  description = "Key pair"
  type = string
  default = "xdp681"
}

variable "vpc_cidr_block" {
  description = "VPC CIDR"
  type = string
  default = "198.18.0.0/16" # RFC 2544, aws /15 not allowed
}

variable "public_subnet" {
  type = string
  default = "198.18.0.0/16"
}

variable "nics" {
  type = list(object({name = string,int_ips = list(string)}))
  default = [
    { 
      name =  "trex"
      int_ips = ["198.18.1.2", "198.18.100.2"]
    },
    {
      name = "xdp_dut"
      int_ips = ["198.18.1.1", "198.18.100.1"]
    }
  ]
}




# TO DO with c5.large
# Placement group
# NIC device 2 