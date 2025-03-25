module "tfe_vault_dynamic_creds_variables" {
  source = "../"

  tfe_organization_name           = "your-organization"
  tfe_variable_set_name_prefix    = "a-sensible-prefix"
  tfe_project_id                  = "a-project-id"
  tfe_workspace_id                = null # Set this to null if using tfe_project_id
  vault_address                   = "https://vault.yourdomain.com"
  vault_jwt_auth_backend_role     = "the-name-of-your-vault-role"
  vault_jwt_auth_backend_path     = "jwt-tfc"
  vault_namespace                 = "a-vault-namespace"
  vault_base64_pem_ca_certificate = "YourBase64EncodedCACertificate"
  aws_secret_backend_mount_path   = "YourAWSSecretBackendMountPath"

  # default_aws_run_role = {
  #   aws_run_role_arn = "YourAWSSecretBackendRoleARN"
  #   vault_role       = "YourAWSSecretBackendRole"
  # }

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
}
