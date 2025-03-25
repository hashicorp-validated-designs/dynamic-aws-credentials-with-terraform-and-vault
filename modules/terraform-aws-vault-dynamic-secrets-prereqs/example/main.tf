module "terraform_vault_aws_dynamic_creds_prereqs" {
  source = "../"

  tfc_hostname               = "app.terraform.io"
  aws_backend_path           = "aws-tfc"
  external_id                = "01931d16-aa6e-7b2e-8678-f1757c144041"
  region                     = "us-east-1"
  vault_service_account_name = "vault-service-account"
  vault_service_role_name    = "vault-service-role"
  jwt_backend_path           = "jwt-tfc"

  aws_secrets_backend_tune_settings = {
    default_lease_ttl_seconds = 3600
    max_lease_ttl_seconds     = 7200
  }

  jwt_backend_tune_settings = {
    default_lease_ttl = "1h"
    max_lease_ttl     = "2h"
    token_type        = "default-service"
  }

  # OIDC Discovery CA Certificate (example multi-line string)
  oidc_discovery_ca_pem = <<EOF
-----BEGIN CERTIFICATE-----
YOUR-CA-CERTIFICATE-HERE
-----END CERTIFICATE-----
EOF

  tags = {
    environment = "dev"
    application = "vault"
  }
}
