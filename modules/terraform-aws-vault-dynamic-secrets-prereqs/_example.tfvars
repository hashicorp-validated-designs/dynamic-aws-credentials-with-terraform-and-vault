aws_backend_path = "aws-tfc"

external_id = "example-external-id-1234-5678"

aws_secrets_backend_tune_settings = {
  default_lease_ttl_seconds = 3600
  max_lease_ttl_seconds     = 7200
}

region = "us-east-1"

tags = {
  environment = "dev"
  application = "vault"
}

vault_service_account_name = "vault-service-account-example"

vault_service_role_name = "vault-service-role-example"

jwt_backend_path = "jwt-tfc"

jwt_backend_tune_settings = {
  default_lease_ttl = "1h"
  max_lease_ttl     = "2h"
  token_type        = "default-service"
}

tfc_hostname = "app.terraform.io"

oidc_discovery_ca_pem = <<EOF
-----BEGIN CERTIFICATE-----
-----END CERTIFICATE-----
EOF
