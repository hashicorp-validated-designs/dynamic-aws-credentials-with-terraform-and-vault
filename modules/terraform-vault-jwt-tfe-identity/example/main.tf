module "vault_jwt_tfe_identity" {
  source = "../"

  tfe_organization_name     = "YourTFEOrganization"
  tfe_vault_audience        = "vault.workload.identity"
  tfe_project_name          = "your-project-name"
  tfe_workspace_name        = "your-workspace-name"
  tfe_run_phase             = "*"
  name_prefix               = "this-is-a-prefix"
  jwt_auth_backend_path     = "tfc-jwt"
  token_ttl                 = 3600
  token_num_uses            = 0
  aws_secrets_backend_roles = ["your-aws-secrets-backend-role-1", "your-aws-secrets-backend-role-2"]
  aws_secrets_backend_path  = "aws-tfc"
  # vault_custom_jwt_role_policy = {
  #   name      = "your-custom-policy-name"
  #   directory = "path/to/your/custom/policy/directory"
  # }
}
