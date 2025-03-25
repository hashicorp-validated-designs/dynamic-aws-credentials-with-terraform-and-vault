tfe_organization_name = "your-organization-name"
tfe_vault_audience    = "vault.workload.identity"
tfe_project_name      = null               # Set to null if tfe_workspace_name is set
tfe_workspace_name    = "a-workspace-name" # Set to null if tfe_project_name is set

vault_address                   = "https://vault.yourdomain.com"
vault_base64_pem_ca_certificate = "YourBase64EncodedCACertificate"
vault_namespace                 = "a-vault-namespace"
vault_jwt_auth_backend_path     = "jwt-tfc"
vault_jwt_role_name_prefix      = "0123456789012-shinra-sra-dev"
vault_jwt_token_ttl             = 3600
vault_jwt_token_num_uses        = 0
vault_custom_jwt_role_policy    = null
vault_aws_secrets_backend_path  = "aws-tfc"

# Default AWS Secret Backend Role (optional)
default_aws_run_role = {
  aws_run_role_arn = null # set to null if not needed
  vault_role       = null # set to null if not needed
}

# AWS Role Aliases
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
