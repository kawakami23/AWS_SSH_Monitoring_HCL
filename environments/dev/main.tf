terraform {
  required_version = ">=1.10.2"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>5.81.0"
    }
  }
  backend "s3" {
    bucket  = "terraform-tfstate-ssh-monitoring"
    region  = "ap-northeast-1"
    key     = "terraform.tfstate"
    encrypt = true
  }
}

module "network" {
  source = "../../modules/network"
  common = local.common
  network = local.network
}

module "ec2" {
  source = "../../modules/ec2"
  common = local.common
  network = module.network
}
