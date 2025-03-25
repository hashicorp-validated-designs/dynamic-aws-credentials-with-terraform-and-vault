output "all_vault_aws_roles" {
  description = "The AWS role aliases to be used in the Terraform Cloud Workspace or Project environment variables to support dynamic credentials."
  value       = merge(module.aws_vault_account_onboarding_01.vault_aws_roles, module.aws_vault_account_onboarding_02.vault_aws_roles)
}

output "vault_aws_roles_01" {
  description = "The AWS role aliases to be used in the Terraform Cloud Workspace or Project environment variables to support dynamic credentials."
  value       = module.aws_vault_account_onboarding_01.vault_aws_roles
}

output "vault_aws_roles_02" {
  description = "The AWS role aliases to be used in the Terraform Cloud Workspace or Project environment variables to support dynamic credentials."
  value       = module.aws_vault_account_onboarding_02.vault_aws_roles
}
