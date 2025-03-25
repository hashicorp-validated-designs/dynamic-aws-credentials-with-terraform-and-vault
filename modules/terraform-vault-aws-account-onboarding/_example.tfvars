vault_aws_service_role_config = {
  aws_built_in_policy_name = "AdministratorAccess" # built-in policy name, set to null if not using built-in policy
  custom_policy_name       = null                  # the name of the custom policy without .json extension, set to null if not using custom policy
  custom_policy_directory  = null                  # the directory where the custom policy is stored, set to null if not using custom policy
}

aws_secrets_backend_path = "aws"

external_id = "01931d16-aa6e-7b2e-8678-f1757c144041"

tags = {
  environment = "dev"
  application = "vault"
}

vault_aws_role_configurations = {
  ec2_instance_provisioner = {
    name                     = "ec2-instance-provisioner"
    tag_suffix               = "EC2_PROV"
    aws_built_in_policy_name = "AmazonEC2FullAccess"
    custom_policy_name       = null
    custom_policy_directory  = "path/to/vault/role/policy"
    default_sts_ttl          = 3600
    max_sts_ttl              = 10800
  }
  s3_read_only_access = {
    name                     = "s3-read-only-access"
    tag_suffix               = "S3_READER"
    aws_built_in_policy_name = "AmazonS3ReadOnlyAccess"
    custom_policy_name       = null
    custom_policy_directory  = "path/to/vault/role/policy"
    default_sts_ttl          = 3600
    max_sts_ttl              = 10800
  }
  s3_full_access = {
    name                     = "s3-full-access"
    tag_suffix               = "S3_ADMIN"
    aws_built_in_policy_name = "AmazonS3FullAccess"
    custom_policy_name       = null
    custom_policy_directory  = "path/to/vault/role/policy"
    default_sts_ttl          = 3600
    max_sts_ttl              = 10800
  }
}

vault_service_role_name = "vault-service-role-example"

vault_service_user_arn = "arn:aws:iam::123456789012:user/vault-service-user"
