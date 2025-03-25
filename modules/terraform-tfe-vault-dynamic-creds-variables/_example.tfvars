# Terraform Enterprise Configuration
tfe_organization_name = "YourTFEOrganization"
tfe_project_id        = "YourTFEProjectID"   # Optional: use if attaching to a project
tfe_workspace_id      = "YourTFEWorkspaceID" # Optional: use if attaching to a workspace

# Vault Configuration
vault_address               = "https://vault.yourdomain.com"
vault_jwt_auth_backend_role = "YourVaultRole"
vault_jwt_auth_backend_path = "YourJWTAuthBackendPath"
vault_namespace             = "YourVaultNamespace"
base64_pem_ca_certificate   = "YourBase64EncodedCACertificate"

# AWS Secrets Backend Configuration
aws_secret_backend_mount_path = "YourAWSSecretBackendMountPath"

# Default AWS Secret Backend Role (optional)
default_aws_run_role_arn = "YourAWSSecretBackendRoleARN"
default_vault_role       = "YourAWSSecretBackendRole"

# Tagged AWS multi-provider aliases
aws_role_aliases = {
  TFC_VAULT_BACKED_AWS_RUN_VAULT_ROLE_CORE_WAN = {
    tag_suffix       = "CORE_WAN"
    aws_run_role_arn = "arn:aws:iam::123456789012:role/vault-service-role-test-01"
    vault_role       = "123456789012-shinra-sra-dev-core-wan-associator"
  }
  TFC_VAULT_BACKED_AWS_RUN_VAULT_ROLE_PARAM_READER = {
    tag_suffix       = "PARAM_READER"
    aws_run_role_arn = "arn:aws:iam::123456789012:role/vault-service-role-test-01"
    vault_role       = "123456789012-shinra-sra-dev-parameter-store-reader"
  }
  TFC_VAULT_BACKED_AWS_RUN_VAULT_ROLE_S3_READER = {
    tag_suffix       = "S3_READER"
    aws_run_role_arn = "arn:aws:iam::098765432109:role/vault-service-role-test-02"
    vault_role       = "098765432109-shinra-sra-dev-s3-security-log-reader"
  }
}
