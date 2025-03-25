locals {
  vault_service_account_policy_name = format("%s-policy", var.vault_service_account_name)
  vault_service_role_arn            = format("arn:aws:iam::*:role/%s", var.vault_service_role_name)
}

resource "aws_iam_user" "vault_service_account" {
  name = var.vault_service_account_name
  tags = var.tags
}

resource "aws_iam_user_policy" "vault_service_account_policy" {
  name = local.vault_service_account_policy_name
  user = aws_iam_user.vault_service_account.name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "sts:AssumeRole"
        ]
        Resource = local.vault_service_role_arn
        Condition = {
          StringEquals = {
            "sts:ExternalId" : var.external_id
          }
        }
      }
    ]
  })
}

resource "aws_iam_access_key" "vault_service_account_key" {
  user = aws_iam_user.vault_service_account.name
}

resource "vault_aws_secret_backend" "aws_secrets_engine" {
  path                      = var.aws_backend_path
  access_key                = aws_iam_access_key.vault_service_account_key.id
  secret_key                = aws_iam_access_key.vault_service_account_key.secret
  region                    = var.region
  default_lease_ttl_seconds = var.aws_secrets_backend_tune_settings.default_lease_ttl_seconds
  max_lease_ttl_seconds     = var.aws_secrets_backend_tune_settings.max_lease_ttl_seconds
  description               = "AWS Secrets Engine for dynamic AWS credentials in Terraform Cloud/Enterprise"
}

resource "vault_jwt_auth_backend" "tfc_jwt" {
  path                  = var.jwt_backend_path
  type                  = "jwt"
  oidc_discovery_url    = "https://${var.tfc_hostname}"
  bound_issuer          = "https://${var.tfc_hostname}"
  oidc_discovery_ca_pem = var.oidc_discovery_ca_pem

  tune {
    default_lease_ttl = var.jwt_backend_tune_settings.default_lease_ttl
    max_lease_ttl     = var.jwt_backend_tune_settings.max_lease_ttl
    token_type        = var.jwt_backend_tune_settings.token_type
  }
}
