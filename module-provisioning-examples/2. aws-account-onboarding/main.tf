data "terraform_remote_state" "vault_aws_dynamic_creds_prereqs" {
  backend = "local"

  config = {
    path = "../prerequisites/terraform.tfstate"
  }
}

module "aws_vault_account_onboarding_01" {
  providers = {
    aws = aws.account-01
  }

  source = "../../modules/terraform-vault-aws-account-onboarding"

  aws_secrets_backend_path = data.terraform_remote_state.vault_aws_dynamic_creds_prereqs.outputs.aws_backend_path
  external_id              = var.external_id
  vault_service_user_arn   = data.terraform_remote_state.vault_aws_dynamic_creds_prereqs.outputs.vault_service_account_arn
  vault_service_role_name  = "vault-service-role"

  tags = {
    environment = "dev"
    application = "vault"
  }

  vault_aws_service_role_config = {
    aws_built_in_policy_name = "AdministratorAccess" # built-in policy name, set to null if not using built-in policy
    custom_policy_name       = null                  # the name of the custom policy without .json extension, set to null if not using custom policy
    custom_policy_directory  = null                  # the directory where the custom policy is stored, set to null if not using custom policy
  }

  vault_aws_role_configurations = {
    ec2_instance_provisioner = {
      name                     = "ec2-instance-provisioner"
      tag_suffix               = "EC2_PROV"
      custom_policy_name       = null
      custom_policy_directory  = null
      aws_built_in_policy_name = "AmazonEC2FullAccess" # built-in policy name, set to null if not using built-in policy
      default_sts_ttl          = 3600
      max_sts_ttl              = 7200
    }
    s3_full_access = {
      name                     = "s3-full-access"
      tag_suffix               = "S3_ADMIN"
      custom_policy_name       = null
      custom_policy_directory  = null
      aws_built_in_policy_name = "AmazonS3FullAccess" # built-in policy name, set to null if not using built-in policy
      default_sts_ttl          = 3600
      max_sts_ttl              = 7200
    }
    dynamodb_table_admin = {
      name                     = "dynamodb-admin"
      tag_suffix               = "DB_ADMIN"
      custom_policy_name       = "dynamodb-full-access" # trim the .json extension, i.e. dynamodb-full-access.json becomes dynamodb-full-access
      custom_policy_directory  = "policies"
      aws_built_in_policy_name = null
      default_sts_ttl          = 3600
      max_sts_ttl              = 7200
    }
  }
}

module "aws_vault_account_onboarding_02" {
  providers = {
    aws = aws.account-02
  }

  source = "../../modules/terraform-vault-aws-account-onboarding"

  aws_secrets_backend_path = data.terraform_remote_state.vault_aws_dynamic_creds_prereqs.outputs.aws_backend_path
  external_id              = var.external_id
  vault_service_user_arn   = data.terraform_remote_state.vault_aws_dynamic_creds_prereqs.outputs.vault_service_account_arn
  vault_service_role_name  = "vault-service-role"

  tags = {
    environment = "dev"
    application = "vault"
  }

  vault_aws_service_role_config = {
    aws_built_in_policy_name = "AdministratorAccess" # built-in policy name, set to null if not using built-in policy
    custom_policy_name       = null                  # the name of the custom policy without .json extension, set to null if not using custom policy
    custom_policy_directory  = null                  # the directory where the custom policy is stored, set to null if not using custom policy
  }

  vault_aws_role_configurations = {
    ec2_instance_provisioner = {
      name                     = "ec2-instance-provisioner"
      tag_suffix               = "EC2_PROV"
      custom_policy_name       = "ec2-full-access" # trim the .json extension, i.e. ec2-full-access.json becomes ec2-full-access
      custom_policy_directory  = "policies"
      aws_built_in_policy_name = null
      default_sts_ttl          = 3600
      max_sts_ttl              = 7200
    }
    s3_full_access = {
      name                     = "s3-full-access"
      tag_suffix               = "S3_ADMIN"
      custom_policy_name       = "s3-full-access" # trim the .json extension, i.e. s3-full-access.json becomes s3-full-access
      custom_policy_directory  = "policies"
      aws_built_in_policy_name = null
      default_sts_ttl          = 3600
      max_sts_ttl              = 7200
    }
    dynamodb_table_admin = {
      name                     = "dynamodb-admin"
      tag_suffix               = "DB_ADMIN"
      custom_policy_name       = "dynamodb-full-access" # trim the .json extension, i.e. dynamodb-full-access.json becomes dynamodb-full-access
      custom_policy_directory  = "policies"
      aws_built_in_policy_name = null
      default_sts_ttl          = 3600
      max_sts_ttl              = 7200
    }
  }
}
