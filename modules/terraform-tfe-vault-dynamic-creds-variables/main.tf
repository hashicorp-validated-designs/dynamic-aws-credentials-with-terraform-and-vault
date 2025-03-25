locals {
  create_workspace_variable_set = var.tfe_workspace_id != null ? true : false
}

resource "tfe_variable_set" "this" {
  name         = "${var.tfe_variable_set_name_prefix}-vault-dyn-aws-creds"
  description  = "Variables that enable Vault backed workload identity."
  organization = var.tfe_organization_name
}

resource "tfe_project_variable_set" "this" {
  count           = local.create_workspace_variable_set == false ? 1 : 0
  project_id      = var.tfe_project_id
  variable_set_id = tfe_variable_set.this.id
}

resource "tfe_workspace_variable_set" "this" {
  count           = local.create_workspace_variable_set == true ? 1 : 0
  workspace_id    = var.tfe_workspace_id
  variable_set_id = tfe_variable_set.this.id
}

# Vault Workload Identity Variables
resource "tfe_variable" "enable_vault_provider_auth" {
  variable_set_id = tfe_variable_set.this.id

  key      = "TFC_VAULT_PROVIDER_AUTH"
  value    = "true"
  category = "env"

  description = "Enable the Workload Identity integration for Vault."
}

resource "tfe_variable" "tfe_vault_addr" {
  variable_set_id = tfe_variable_set.this.id

  key      = "TFC_VAULT_ADDR"
  value    = var.vault_address
  category = "env"

  description = "The address of the Vault instance runs will access."
}

resource "tfe_variable" "tfe_vault_role" {
  variable_set_id = tfe_variable_set.this.id

  key      = "TFC_VAULT_RUN_ROLE"
  value    = var.vault_jwt_auth_backend_role
  category = "env"

  description = "The Vault role runs will use to authenticate."
}

resource "tfe_variable" "tfe_vault_namespace" {
  variable_set_id = tfe_variable_set.this.id

  key      = "TFC_VAULT_NAMESPACE"
  value    = var.vault_namespace
  category = "env"

  description = "The Vault namespace to use, if not using the default"
}

resource "tfe_variable" "tfe_vault_jwt_auth_backend_path" {
  variable_set_id = tfe_variable_set.this.id

  key      = "TFC_VAULT_AUTH_PATH"
  value    = var.vault_jwt_auth_backend_path
  category = "env"

  description = "The path where the jwt auth backend is mounted, if not using the default"
}

resource "tfe_variable" "tfe_vault_encoded_cacert" {
  count           = var.vault_base64_pem_ca_certificate != null ? 1 : 0
  variable_set_id = tfe_variable_set.this.id

  key       = "TFC_VAULT_ENCODED_CACERT"
  value     = var.vault_base64_pem_ca_certificate
  category  = "env"
  sensitive = true

  description = "A Base64 encoded CA certificate to use when authenticating with Vault"
}

# AWS Dynamic Credentials Variables
resource "tfe_variable" "enable_aws_dynamic_credentials" {
  variable_set_id = tfe_variable_set.this.id

  key      = "TFC_VAULT_BACKED_AWS_AUTH"
  value    = var.default_aws_run_role != null ? "true" : "false"
  category = "env"

  description = "Enable AWS dynamic secrets from Vault."
}

resource "tfe_variable" "aws_secret_backend_auth_type" {
  variable_set_id = tfe_variable_set.this.id

  key      = "TFC_DEFAULT_VAULT_BACKED_AWS_AUTH_TYPE"
  value    = "assumed_role"
  category = "env"

  description = "Specifies the type of authentication to perform with AWS."
}

resource "tfe_variable" "aws_secret_backend_mount_path" {
  variable_set_id = tfe_variable_set.this.id

  key      = "TFC_DEFAULT_VAULT_BACKED_AWS_MOUNT_PATH"
  value    = var.aws_secret_backend_mount_path
  category = "env"

  description = "The mount path of the AWS secrets engine in Vault."
}

resource "tfe_variable" "default_aws_run_role_arn" {
  count           = var.default_aws_run_role != null ? 1 : 0
  variable_set_id = tfe_variable_set.this.id

  key      = "TFC_DEFAULT_VAULT_BACKED_AWS_RUN_ROLE_ARN"
  value    = var.default_aws_run_role.aws_run_role_arn
  category = "env"

  description = "The ARN of the role to assume in AWS."
}

resource "tfe_variable" "default_aws_secret_backend_run_vault_role" {
  count           = var.default_aws_run_role != null ? 1 : 0
  variable_set_id = tfe_variable_set.this.id

  key      = "TFC_DEFAULT_VAULT_BACKED_AWS_RUN_VAULT_ROLE"
  value    = var.default_aws_run_role.vault_role
  category = "env"

  description = "The role to use in Vault."
}

# Optionally create tagged variables to support injection of multiple aliased AWS providers
resource "tfe_variable" "aws_secret_backend_run_vault_role_aliases" {
  for_each        = coalesce(var.aws_role_aliases, {})
  variable_set_id = tfe_variable_set.this.id

  key      = format("%s_%s", "TFC_VAULT_BACKED_AWS_RUN_VAULT_ROLE", each.value.tag_suffix)
  value    = each.value.vault_role
  category = "env"

  description = "The role to use in Vault."
}

resource "tfe_variable" "aws_aws_run_role_arn_aliases" {
  for_each        = coalesce(var.aws_role_aliases, {})
  variable_set_id = tfe_variable_set.this.id

  key      = format("%s_%s", "TFC_VAULT_BACKED_AWS_RUN_ROLE_ARN", each.value.tag_suffix)
  value    = each.value.aws_run_role_arn
  category = "env"

  description = "The ARN of the role to assume in AWS."
}

resource "tfe_variable" "aws_aws_run_role_arn_aliases_enable" {
  for_each        = coalesce(var.aws_role_aliases, {})
  variable_set_id = tfe_variable_set.this.id

  key      = format("%s_%s", "TFC_VAULT_BACKED_AWS_AUTH", each.value.tag_suffix)
  value    = "true"
  category = "env"

  description = "Determines whether this role tag/alias is enabled or disabled."
}
