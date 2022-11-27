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

variable "ins1_name" {
  description = "Cisco TRex Traffic Generator"
  type        = string
  default     = "tRex"
}

variable "ins2_name" {
  description = "XDP Device Under Test"
  type        = string
  default     = "xdp-DUT"
}

variable "instance_type" {
  description = "EC2 Instance type"
  type = string
  default = "t2.micro"
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
  description = "VPC subnet"
  type = string
  default = "10.0.0.0/16"
}

variable "public_subnet" {
  type = string
  default = "10.0.1.0/24"
}