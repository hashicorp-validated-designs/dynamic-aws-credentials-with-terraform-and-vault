output "iam_role_arn" {
  description = "The ARN of the created IAM role"
  value       = aws_iam_role.vault_service_role.arn
}

output "iam_role_name" {
  description = "The name of the created IAM role"
  value       = aws_iam_role.vault_service_role.name
}

output "policy_arn" {
  description = "The ARN of the policy attached to the IAM role"
  value       = var.vault_aws_service_role_config.aws_built_in_policy_name != null ? data.aws_iam_policy.built_in_policy_service_role[0].arn : aws_iam_policy.custom_policy[0].arn
}

output "policy_name" {
  description = "The name of the policy attached to the IAM role"
  value       = var.vault_aws_service_role_config.aws_built_in_policy_name != null ? var.vault_aws_service_role_config.aws_built_in_policy_name : var.vault_aws_service_role_config.custom_policy_name
}

output "vault_aws_secret_backend_role_names" {
  description = "The name of the Vault AWS secret backend role"
  value       = { for key, role in vault_aws_secret_backend_role.dynamic_credentials : key => role.name }
}

output "vault_aws_roles" {
  description = "The Vault AWS roles to be used in the Terraform Cloud Workspace or Project environment variables to support dynamic credentials."
  value = {
    for key, role_config in var.vault_aws_role_configurations :
    format("%s_TFC_VAULT_BACKED_AWS_RUN_VAULT_ROLE_%s", data.aws_caller_identity.current.account_id, upper(role_config.tag_suffix)) => {
      tag_suffix       = format("%s_%s", data.aws_caller_identity.current.account_id, role_config.tag_suffix)
      aws_run_role_arn = aws_iam_role.vault_service_role.arn
      vault_role       = vault_aws_secret_backend_role.dynamic_credentials[key].name
    }
  }
}
