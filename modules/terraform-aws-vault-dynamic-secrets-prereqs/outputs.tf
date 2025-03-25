output "aws_secret_backend_path" {
  description = "The details of the AWS secrets engine backend."
  value       = vault_aws_secret_backend.aws_secrets_engine.path
}

output "jwt_backend_path" {
  description = "The details of the JWT auth backend."
  value       = vault_jwt_auth_backend.tfc_jwt.path
}

output "vault_service_account_arn" {
  description = "The ARN of the AWS IAM user that's used by the Vault AWS secrets engine."
  value       = aws_iam_user.vault_service_account.arn
}
