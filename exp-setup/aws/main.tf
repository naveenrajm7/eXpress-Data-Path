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
  region  = var.aws_region
}


## TODO: 
## Placement-group (cluster) - Need large machine 
## Network-Interface-Card  - Need large machine
## 

resource "aws_vpc" "xdp_vpc" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = "xdp-vpc"
  }
}

resource "aws_subnet" "xdp_public_subnet" {
  vpc_id            = aws_vpc.xdp_vpc.id
  cidr_block        = var.public_subnet
  availability_zone = var.aws_az

  tags = {
    Name = "xdp-public-subnet"
  }
}

resource "aws_internet_gateway" "xdp_ig" {
  vpc_id = aws_vpc.xdp_vpc.id

  tags = {
    Name = "xdp-internet-gateway"
  }
}

resource "aws_route_table" "xdp_public_rt" {
  vpc_id = aws_vpc.xdp_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.xdp_ig.id
  }

  route {
    ipv6_cidr_block = "::/0"
    gateway_id      = aws_internet_gateway.xdp_ig.id
  }

  tags = {
    Name = "xdp-public-route-table"
  }
}

resource "aws_route_table_association" "xdp_public_1_rt_a" {
  subnet_id      = aws_subnet.xdp_public_subnet.id
  route_table_id = aws_route_table.xdp_public_rt.id
}

resource "aws_security_group" "xdp_sg" {
  name   = "HTTP and SSH"
  vpc_id = aws_vpc.xdp_vpc.id

  ingress {
    description = "Ping"
    from_port   = 8 # Echo request
    to_port     = 0 
    protocol    = "icmp" 
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "For security group"
    from_port   = 0
    to_port     = 0    
    protocol    = -1 
    self = true
  }

  egress {
    description = "Allow all outgoing traffic"
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

resource "aws_placement_group" "xdp_pg" {
  name     = "xdp-pg"
  strategy = "cluster"
}


data "template_file" "install_trex" {
  template = "${file("${path.module}/../scripts/install-trex.sh")}"
  vars = {
    host_name = var.d1_name
  }
}

data "template_file" "install_tools" {
  template = "${file("${path.module}/../scripts/install-tools.sh")}"
  # vars = {
  #   consul_address = "${aws_instance.consul.private_ip}"
  # }
}

data "template_file" "linux_source" {
  template = "${file("${path.module}/../scripts/linux-source.sh")}"
  vars = {
    host_name = var.d2_name
    linux_source_dir = "linux-aws-5.15.0"
  }
}

resource "aws_instance" "trex" {
  ami           = var.instance_ami
  instance_type = var.instance_type
  key_name = var.instance_key

  subnet_id                   = aws_subnet.xdp_public_subnet.id
  vpc_security_group_ids      = [aws_security_group.xdp_sg.id]
  associate_public_ip_address = true

  # Use below with c5n
  # placement_group = aws_placement_group.xdp_pg.id

  user_data = join("\n", [data.template_file.install_tools.rendered, data.template_file.install_trex.rendered])

  
  tags = {
    Name = var.d1_name
  }
}

resource "aws_instance" "xdp_dut" {
  ami           = var.instance_ami
  instance_type = var.instance_type
  key_name = var.instance_key

  subnet_id                   = aws_subnet.xdp_public_subnet.id
  vpc_security_group_ids      = [aws_security_group.xdp_sg.id]
  associate_public_ip_address = true

  # Use below with c5n
  # placement_group = aws_placement_group.xdp_pg.id

  user_data = join("\n", [data.template_file.install_tools.rendered, data.template_file.linux_source.rendered])

  tags = {
    Name = var.d2_name
  }
}

resource "aws_network_interface" "ti_1" {
  subnet_id       = aws_subnet.xdp_public_subnet.id
  private_ips     = ["198.18.1.2"]
  security_groups = [aws_security_group.xdp_sg.id]

  attachment {
    instance     = aws_instance.trex.id
    device_index = 1
  }
}

# resource "aws_network_interface" "ti_2" {
#   subnet_id       = aws_subnet.xdp_public_subnet.id
#   private_ips     = ["198.18.100.2"]
#   security_groups = [aws_security_group.xdp_sg.id]

#   attachment {
#     instance     = aws_instance.trex.id
#     device_index = 2
#   }
# }

resource "aws_network_interface" "di_1" {
  subnet_id       = aws_subnet.xdp_public_subnet.id
  private_ips     = ["198.18.1.1"]
  security_groups = [aws_security_group.xdp_sg.id]

  attachment {
    instance     = aws_instance.xdp_dut.id
    device_index = 1
  }
}

# resource "aws_network_interface" "di_2" {
#   subnet_id       = aws_subnet.xdp_public_subnet.id
#   private_ips     = ["198.18.100.1"]
#   security_groups = [aws_security_group.xdp_sg.id]

#   attachment {
#     instance     = aws_instance.xdp_dut.id
#     device_index = 2
#   }
# }