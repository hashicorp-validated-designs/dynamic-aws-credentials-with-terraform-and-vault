terraform {
  required_version = "~> 1.9.8"
  required_providers {
    tfe = {
      source  = "hashicorp/tfe"
      version = "~> 0.62.0"
    }
  }
}

provider "tfe" {
  hostname = "app.terraform.io"
}
