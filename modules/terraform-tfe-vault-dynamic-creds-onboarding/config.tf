terraform {
  required_version = "~> 1.9.8"
  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = "~> 4.4.0"
    }
    tfe = {
      source  = "hashicorp/tfe"
      version = "~> 0.62.0"
    }
  }
}
