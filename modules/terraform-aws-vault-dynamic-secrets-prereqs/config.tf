terraform {
  required_version = "~> 1.9.8"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.75.1"
    }
    vault = {
      source  = "hashicorp/vault"
      version = "~> 4.4.0"
    }
  }
}
