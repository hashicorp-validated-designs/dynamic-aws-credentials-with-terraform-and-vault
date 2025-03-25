data "terraform_remote_state" "vault_aws_dynamic_creds_prereqs" {
  backend = "local"

  config = {
    path = "../aws-account-onboarding/terraform.tfstate"
  }
}

module "aws_shinra_app_infra_dev" {
  source = "../../modules/terraform-tfe-vault-dynamic-creds-onboarding"

  tfe_organization_name           = var.tfe_organization_name
  tfe_vault_audience              = var.tfe_vault_audience
  tfe_project_name                = null
  tfe_workspace_name              = "aws-shinra-app-infra-dev"
  vault_jwt_token_ttl             = 3600
  vault_jwt_token_num_uses        = 0
  aws_secrets_backend_path        = var.aws_secrets_backend_path
  vault_address                   = var.vault_address
  vault_jwt_auth_backend_path     = var.vault_jwt_auth_backend_path
  vault_base64_pem_ca_certificate = var.vault_base64_pem_ca_certificate
  vault_custom_jwt_role_policy    = null
  vault_namespace                 = "admin"
  vault_jwt_role_name_prefix      = "aws-shinra-app-infra-dev"

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

module "aws_cosmo_app_infra_dev" {
  source = "../../modules/terraform-tfe-vault-dynamic-creds-onboarding"

  tfe_organization_name           = var.tfe_organization_name
  tfe_vault_audience              = var.tfe_vault_audience
  tfe_project_name                = "app-team-cosmo-dev"
  tfe_workspace_name              = null
  vault_jwt_token_ttl             = 3600
  vault_jwt_token_num_uses        = 0
  aws_secrets_backend_path        = var.aws_secrets_backend_path
  vault_address                   = var.vault_address
  vault_jwt_auth_backend_path     = var.vault_jwt_auth_backend_path
  vault_base64_pem_ca_certificate = var.vault_base64_pem_ca_certificate
  vault_custom_jwt_role_policy    = null
  vault_namespace                 = "admin"
  vault_jwt_role_name_prefix      = "app-team-cosmo-dev"

  aws_role_aliases = {
    "092467136106_TFC_VAULT_BACKED_AWS_RUN_VAULT_ROLE_S3_ADMIN" = {
      aws_run_role_arn = "arn:aws:iam::092467136106:role/vault-service-role"
      tag_suffix       = "092467136106_S3_ADMIN"
      vault_role       = "092467136106-s3-full-access"
    }
    "092467136106_TFC_VAULT_BACKED_AWS_RUN_VAULT_ROLE_EC2_PROV" = {
      aws_run_role_arn = "arn:aws:iam::092467136106:role/vault-service-role"
      tag_suffix       = "092467136106_EC2_PROV"
      vault_role       = "092467136106-ec2-instance-provisioner"
    }
    "092467136106_TFC_VAULT_BACKED_AWS_RUN_VAULT_ROLE_DB_ADMIN" = {
      aws_run_role_arn = "arn:aws:iam::092467136106:role/vault-service-role"
      tag_suffix       = "092467136106_DB_ADMIN"
      vault_role       = "092467136106-dynamodb-admin"
    }
    "888577062959_TFC_VAULT_BACKED_AWS_RUN_VAULT_ROLE_DB_ADMIN" = {
      aws_run_role_arn = "arn:aws:iam::888577062959:role/vault-service-role"
      tag_suffix       = "888577062959_DB_ADMIN"
      vault_role       = "888577062959-dynamodb-admin"
    }
    "888577062959_TFC_VAULT_BACKED_AWS_RUN_VAULT_ROLE_EC2_PROV" = {
      aws_run_role_arn = "arn:aws:iam::888577062959:role/vault-service-role"
      tag_suffix       = "888577062959_EC2_PROV"
      vault_role       = "888577062959-ec2-instance-provisioner"
    }
    "888577062959_TFC_VAULT_BACKED_AWS_RUN_VAULT_ROLE_S3_ADMIN" = {
      aws_run_role_arn = "arn:aws:iam::888577062959:role/vault-service-role"
      tag_suffix       = "888577062959_S3_ADMIN"
      vault_role       = "888577062959-s3-full-access"
    }
  }
}

module "aws_cosmo_app_deploy_dev" {
  source = "../../modules/terraform-tfe-vault-dynamic-creds-onboarding"

  tfe_organization_name           = var.tfe_organization_name
  tfe_vault_audience              = var.tfe_vault_audience
  tfe_project_name                = "app-team-cosmo-deploy-dev"
  tfe_workspace_name              = null
  vault_jwt_token_ttl             = 3600
  vault_jwt_token_num_uses        = 0
  aws_secrets_backend_path        = var.aws_secrets_backend_path
  vault_address                   = var.vault_address
  vault_jwt_auth_backend_path     = var.vault_jwt_auth_backend_path
  vault_base64_pem_ca_certificate = var.vault_base64_pem_ca_certificate
  vault_custom_jwt_role_policy    = null
  vault_namespace                 = "admin"
  vault_jwt_role_name_prefix      = "app-team-cosmo-deploy-dev"
  aws_role_aliases                = data.terraform_remote_state.vault_aws_dynamic_creds_prereqs.outputs.all_vault_aws_roles
}
