terraform {
  backend "s3" {
    bucket       = "tiago-terraform-backend"
    key          = "atividade1/terraform.tfstate"
    region       = "us-east-1"
    use_lockfile = true
  }
}