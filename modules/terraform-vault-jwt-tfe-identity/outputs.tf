output "vault_jwt_workload_identity_role" {
  value       = vault_jwt_auth_backend_role.tfe_role.role_name
  description = "The role that's created in Vault for the TFE Workspace or Project"
}

output "token_policies" {
  value       = concat([vault_policy.policy.name], ["default"])
  description = "The policies that are attached to the role in Vault"
}
