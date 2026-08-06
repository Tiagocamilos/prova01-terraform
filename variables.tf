variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "meu_ip" {
  type        = string
  description = "Insira o seu IP público para a porta 22 no formato IP/32"
}

variable "tipos_instancia" {
  type = map(string)
  default = {
    "dev"  = "t2.micro"
    "prod" = "t3.micro"
  }
}