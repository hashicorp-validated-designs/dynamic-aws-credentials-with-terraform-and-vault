output "vault_jwt_workload_identity_role" {
  value       = module.vault_jwt_tfe_identity.vault_jwt_workload_identity_role
  description = "The role that's created in Vault for the TFE Workspace or Project"
}

output "token_policies" {
  value       = module.vault_jwt_tfe_identity.token_policies
  description = "The policies that are attached to the role in Vault"
}
