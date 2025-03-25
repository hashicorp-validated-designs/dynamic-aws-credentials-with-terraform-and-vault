locals {
  extracted_roles              = [for alias in var.aws_role_aliases : alias.vault_role if alias.vault_role != null]
  additional_roles             = var.default_aws_run_role != null ? [var.default_aws_run_role.vault_role] : []
  vault_roles                  = distinct(concat(local.extracted_roles, local.additional_roles))
  tfc_variable_set_name_prefix = var.tfe_workspace_name != null ? var.tfe_workspace_name : var.tfe_project_name
}

data "tfe_workspace" "workspace" {
  count        = var.tfe_workspace_name != null ? 1 : 0
  name         = var.tfe_workspace_name
  organization = var.tfe_organization_name
}

data "tfe_project" "project" {
  count        = var.tfe_project_name != null ? 1 : 0
  name         = var.tfe_project_name
  organization = var.tfe_organization_name
}

module "tfc_vault_jwt_identity" {
  source = "../terraform-vault-jwt-tfe-identity"

  tfe_organization_name        = var.tfe_organization_name
  tfe_vault_audience           = var.tfe_vault_audience
  tfe_project_name             = var.tfe_project_name
  tfe_workspace_name           = var.tfe_workspace_name
  jwt_auth_backend_path        = var.vault_jwt_auth_backend_path
  name_prefix                  = var.vault_jwt_role_name_prefix
  token_ttl                    = var.vault_jwt_token_ttl
  token_num_uses               = var.vault_jwt_token_num_uses
  aws_secrets_backend_roles    = local.vault_roles
  aws_secrets_backend_path     = var.aws_secrets_backend_path
  vault_custom_jwt_role_policy = var.vault_custom_jwt_role_policy
}

module "tfc_vault_dynamic_vars" {
  source = "../terraform-tfe-vault-dynamic-creds-variables"

  tfe_organization_name           = var.tfe_organization_name
  tfe_variable_set_name_prefix    = local.tfc_variable_set_name_prefix
  tfe_project_id                  = var.tfe_project_name != null ? data.tfe_project.project[0].id : null
  tfe_workspace_id                = var.tfe_workspace_name != null ? data.tfe_workspace.workspace[0].id : null
  vault_address                   = var.vault_address
  vault_jwt_auth_backend_role     = module.tfc_vault_jwt_identity.vault_jwt_workload_identity_role
  vault_jwt_auth_backend_path     = var.vault_jwt_auth_backend_path
  vault_namespace                 = var.vault_namespace
  vault_base64_pem_ca_certificate = var.vault_base64_pem_ca_certificate
  aws_secret_backend_mount_path   = var.aws_secrets_backend_path
  default_aws_run_role            = var.default_aws_run_role
  aws_role_aliases                = var.aws_role_aliases
}
