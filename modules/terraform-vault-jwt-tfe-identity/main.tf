locals {
  tfe_project_claim   = var.tfe_project_name != null ? var.tfe_project_name : "*"
  tfe_workspace_claim = var.tfe_workspace_name != null ? var.tfe_workspace_name : "*"
}

resource "vault_jwt_auth_backend_role" "tfe_role" {
  backend   = var.jwt_auth_backend_path
  role_name = format("%s-%s", var.name_prefix, "role")
  role_type = "jwt"

  token_policies = concat([vault_policy.policy.name], ["default"])
  token_ttl      = var.token_ttl
  token_num_uses = var.token_num_uses

  user_claim        = "terraform_full_workspace"
  bound_audiences   = [var.tfe_vault_audience]
  bound_claims_type = "glob"

  bound_claims = {
    sub = "organization:${var.tfe_organization_name}:project:${local.tfe_project_claim}:workspace:${local.tfe_workspace_claim}:run_phase:${var.tfe_run_phase}"
  }
}

resource "vault_policy" "policy" {
  name   = format("%s-%s", var.name_prefix, "role-policy")
  policy = var.vault_custom_jwt_role_policy != null ? file("${var.vault_custom_jwt_role_policy.directory}/${var.vault_custom_jwt_role_policy.name}.hcl") : <<EOT
%{for vault_role in var.aws_secrets_backend_roles}
path "${var.aws_secrets_backend_path}/roles/${vault_role}" {
  capabilities = ["read", "list"]
}

path "${var.aws_secrets_backend_path}/creds/${vault_role}" {
  capabilities = ["read", "list"]
}

path "${var.aws_secrets_backend_path}/sts/${vault_role}" {
  capabilities = ["read", "list"]
}
%{endfor}
EOT
}
