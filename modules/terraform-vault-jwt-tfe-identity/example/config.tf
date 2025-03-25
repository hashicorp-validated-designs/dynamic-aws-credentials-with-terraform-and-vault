terraform {
  required_version = "~> 1.9.8"
  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = "~> 4.4.0"
    }
  }
}

provider "vault" {
}
