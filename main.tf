provider "aws" {
  region = var.aws_region
}

resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  tags = {
    Name     = "VPC-${terraform.workspace}"
    Curso    = "DevOps"
    Ambiente = terraform.workspace
  }
}

resource "aws_subnet" "publica" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = cidrsubnet(var.vpc_cidr, 8, 1)
  map_public_ip_on_launch = true
  tags = {
    Name     = "Subnet-Publica-${terraform.workspace}"
    Curso    = "DevOps"
    Ambiente = terraform.workspace
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name     = "IGW-${terraform.workspace}"
    Curso    = "DevOps"
    Ambiente = terraform.workspace
  }
}

resource "aws_route_table" "rt_publica" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name     = "RT-Publica-${terraform.workspace}"
    Curso    = "DevOps"
    Ambiente = terraform.workspace
  }
}

resource "aws_route_table_association" "rt_assoc" {
  subnet_id      = aws_subnet.publica.id
  route_table_id = aws_route_table.rt_publica.id
}

module "servidor_web" {
  source = "./modules/servidor-web"

  vpc_id    = aws_vpc.main.id
  subnet_id = aws_subnet.publica.id
  meu_ip    = var.meu_ip

  # Seleciona t2.micro ou t3.micro conforme o workspace
  instance_type = lookup(var.tipos_instancia, terraform.workspace, "t2.micro")
  ambiente      = terraform.workspace
}