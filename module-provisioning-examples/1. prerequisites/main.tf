module "terraform_vault_aws_dynamic_creds_prereqs" {
  source = "../../modules/terraform-aws-vault-dynamic-secrets-prereqs"

  external_id = "01931d16-aa6e-7b2e-8678-f1757c144041"
  region      = "us-east-1"

  aws_secrets_backend_tune_settings = {
    default_lease_ttl_seconds = 3600
    max_lease_ttl_seconds     = 7200
  }

  jwt_backend_tune_settings = {
    default_lease_ttl = "1h"
    max_lease_ttl     = "2h"
    token_type        = "default-service"
  }

  tags = {
    environment = "dev"
    application = "vault"
  }
}
