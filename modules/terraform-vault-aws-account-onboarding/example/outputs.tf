output "iam_role_arn" {
  description = "The ARN of the created IAM role"
  value       = module.vault_aws_account_onboarding.iam_role_arn
}

output "iam_role_name" {
  description = "The name of the created IAM role"
  value       = module.vault_aws_account_onboarding.iam_role_name
}
