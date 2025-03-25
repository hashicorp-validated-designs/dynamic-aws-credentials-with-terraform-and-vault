output "aws_backend_path" {
  description = "The details of the AWS secrets engine backend."
  value       = module.terraform_vault_aws_dynamic_creds_prereqs.aws_secret_backend_path
}

output "jwt_backend_path" {
  description = "The details of the JWT auth backend."
  value       = module.terraform_vault_aws_dynamic_creds_prereqs.jwt_backend_path
}

output "vault_service_account_arn" {
  description = "The ARN of the AWS IAM user that's used by the Vault AWS secrets engine."
  value       = module.terraform_vault_aws_dynamic_creds_prereqs.vault_service_account_arn
}
