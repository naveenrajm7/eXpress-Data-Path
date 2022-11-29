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
## Network-Interface-Card  - Connectivity in Trex and DUT
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

resource "aws_subnet" "xdp_private_subnet1" {
  vpc_id            = aws_vpc.xdp_vpc.id
  cidr_block        = var.private_subnet1
  availability_zone = var.aws_az

  tags = {
    Name = "xdp-private-subnet1"
  }
}

resource "aws_subnet" "xdp_private_subnet2" {
  vpc_id            = aws_vpc.xdp_vpc.id
  cidr_block        = var.private_subnet2
  availability_zone = var.aws_az

  tags = {
    Name = "xdp-private-subnet2"
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
  name   = "PING and SSH"
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
}

data "template_file" "linux_source" {
  template = "${file("${path.module}/../scripts/linux-source.sh")}"
  vars = {
    host_name = var.d2_name
    linux_source_dir = "linux-aws-5.15.0"
  }
}

resource "aws_network_interface" "ti_0" {
  subnet_id       = aws_subnet.xdp_public_subnet.id
  security_groups = [aws_security_group.xdp_sg.id]
  private_ips     = ["198.18.60.11"]
  tags = {
    Name = "tRex Int 0"
  }
}

resource "aws_network_interface" "ti_1" {
  subnet_id       = aws_subnet.xdp_private_subnet1.id
  private_ips     = ["198.18.1.11"]
  security_groups = [aws_security_group.xdp_sg.id]

  tags = {
    Name = "tRex Int 1"
  }
}

resource "aws_network_interface" "ti_2" {
  subnet_id       = aws_subnet.xdp_private_subnet2.id
  private_ips     = ["198.18.2.11"]
  security_groups = [aws_security_group.xdp_sg.id]

  tags = {
    Name = "tRex Int 2"
  }
}

resource "aws_network_interface" "di_0" {
  subnet_id       = aws_subnet.xdp_public_subnet.id
  security_groups = [aws_security_group.xdp_sg.id]
  private_ips     = ["198.18.60.10"]
  tags = {
    Name = "DUT Int 0"
  }
}

resource "aws_network_interface" "di_1" {
  subnet_id       = aws_subnet.xdp_private_subnet1.id
  private_ips     = ["198.18.1.10"]
  security_groups = [aws_security_group.xdp_sg.id]

  tags = {
    Name = "DUT Int 1"
  }
}

resource "aws_network_interface" "di_2" {
  subnet_id       = aws_subnet.xdp_private_subnet2.id
  private_ips     = ["198.18.2.10"]
  security_groups = [aws_security_group.xdp_sg.id]

  tags = {
    Name = "DUT Int 2"
  }
}

resource "aws_instance" "trex" {
  ami           = var.instance_ami
  instance_type = var.instance_type
  key_name = var.instance_key

  # Use below with c5n
  placement_group = aws_placement_group.xdp_pg.id

  network_interface {
    network_interface_id = aws_network_interface.ti_0.id
    device_index         = 0
  }

  network_interface {
    network_interface_id = aws_network_interface.ti_1.id
    device_index         = 1
  }
  network_interface {
    network_interface_id = aws_network_interface.ti_2.id
    device_index         = 2
  }

  user_data = join("\n", [data.template_file.install_tools.rendered, data.template_file.install_trex.rendered])
  
  tags = {
    Name = var.d1_name
  }
}

resource "aws_instance" "xdp_dut" {
  ami           = var.instance_ami
  instance_type = var.instance_type
  key_name = var.instance_key

  # Use below with c5n
  placement_group = aws_placement_group.xdp_pg.id

  network_interface {
    network_interface_id = aws_network_interface.di_0.id
    device_index         = 0
  }
  network_interface {
    network_interface_id = aws_network_interface.di_1.id
    device_index         = 1
  }
  network_interface {
    network_interface_id = aws_network_interface.di_2.id
    device_index         = 2
  }

  user_data = join("\n", [data.template_file.install_tools.rendered, data.template_file.linux_source.rendered])

  tags = {
    Name = var.d2_name
  }
}

resource "aws_eip" "trex_public_ip" {
  vpc                       = true
  network_interface         = aws_network_interface.ti_0.id
  associate_with_private_ip = "198.18.60.11"
}

resource "aws_eip" "dut_public_ip" {
  vpc                       = true
  network_interface         = aws_network_interface.di_0.id
  associate_with_private_ip = "198.18.60.10"
}