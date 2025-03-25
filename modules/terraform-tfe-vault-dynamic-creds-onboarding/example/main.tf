module "terraform_tfe_vault_dynamic_creds_onboarding" {
  source = "../"

  tfe_organization_name           = "your-organization"
  tfe_vault_audience              = "vault.workload.identity"
  tfe_run_phase                   = "*"
  tfe_project_name                = null # Set this to null if using tfe_workspace_name
  tfe_workspace_name              = "a-workspace-name"
  vault_jwt_token_ttl             = 3600 # in seconds
  vault_jwt_token_num_uses        = 0    # 0 means unlimited until expiration
  aws_secrets_backend_path        = "aws"
  vault_address                   = "https://vault.yourdomain.com"
  vault_jwt_auth_backend_path     = "jwt-tfc"
  vault_base64_pem_ca_certificate = "YourBase64EncodedCACertificate"
  vault_custom_jwt_role_policy    = null # Set this to null if not using a custom policy
  vault_namespace                 = "admin"
  vault_jwt_role_name_prefix      = "a-sensible-prefix"

  default_aws_run_role = {
    aws_run_role_arn = "arn:aws:iam::092467136106:role/vault-service-role"
    vault_role       = "092467136106-s3-full-access"
  }

  aws_role_aliases = {
    TFC_VAULT_BACKED_AWS_RUN_VAULT_ROLE_EC2_PROV = {
      aws_run_role_arn = "arn:aws:iam::092467136106:role/vault-service-role"
      tag_suffix       = "092467136106_EC2_PROV"
      vault_role       = "092467136106-ec2-instance-provisioner"
    }
    TFC_VAULT_BACKED_AWS_RUN_VAULT_ROLE_DB_ADMIN = {
      aws_run_role_arn = "arn:aws:iam::092467136106:role/vault-service-role"
      tag_suffix       = "092467136106_DB_ADMIN"
      vault_role       = "092467136106-dynamodb-admin"
    }
  }
}
