# Multi-AWS Account Provider Configurations

This example demonstrates how to configure multiple AWS providers across two distinct AWS accounts using dynamic credentials sourced from HashiCorp Vault. This setup enables deployments into each account using a unique set of Vault AWS Secret Engine roles.

## Provider Configuration

This example showcases how to configure AWS providers with dynamic credentials for multiple accounts:

### Aliased Providers

* Multiple aliased providers are configured, each with a unique alias that includes the AWS account ID. This allows you to use different sets of credentials for different resources and accounts within your Terraform configuration.
* The credentials for each aliased provider are sourced from Vault based on the environment variables associated with the corresponding tag. These tags are derived from the Vault AWS roles used to generate the STS credentials.

## Environment Variables

The following table lists the environment variables that are set at the TFE Project level to enable Vault workload identity and dynamic credential injection for all workspaces within the project:

| Key | Value | Category |
|---|---|---|
| `TFC_DEFAULT_VAULT_BACKED_AWS_AUTH_TYPE` | `assumed_role` | env |
| `TFC_DEFAULT_VAULT_BACKED_AWS_MOUNT_PATH` | `aws-tfc` | env |
| `TFC_VAULT_ADDR` | `https://vault-demo-01-public-vault-acbc4bf5.d7b4d80f.z1...` | env |
| `TFC_VAULT_AUTH_PATH` | `jwt-tfc` | env |
| `TFC_VAULT_BACKED_AWS_AUTH` | `false` | env |
| `TFC_VAULT_BACKED_AWS_AUTH_123456789012_DB_ADMIN` | `true` | env |
| `TFC_VAULT_BACKED_AWS_AUTH_123456789012_EC2_PROV` | `true` | env |
| `TFC_VAULT_BACKED_AWS_AUTH_123456789012_S3_ADMIN` | `true` | env |
| `TFC_VAULT_BACKED_AWS_AUTH_210987654321_DB_ADMIN` | `true` | env |
| `TFC_VAULT_BACKED_AWS_AUTH_210987654321_EC2_PROV` | `true` | env |
| `TFC_VAULT_BACKED_AWS_AUTH_210987654321_S3_ADMIN` | `true` | env |
| `TFC_VAULT_BACKED_AWS_RUN_ROLE_ARN_123456789012_DB_ADMIN` | `arn:aws:iam::123456789012:role/vault-service-role` | env |
| `TFC_VAULT_BACKED_AWS_RUN_ROLE_ARN_123456789012_EC2_PROV` | `arn:aws:iam::123456789012:role/vault-service-role` | env |
| `TFC_VAULT_BACKED_AWS_RUN_ROLE_ARN_123456789012_S3_ADMIN` | `arn:aws:iam::123456789012:role/vault-service-role` | env |
| `TFC_VAULT_BACKED_AWS_RUN_ROLE_ARN_210987654321_DB_ADMIN` | `arn:aws:iam::210987654321:role/vault-service-role` | env |
| `TFC_VAULT_BACKED_AWS_RUN_ROLE_ARN_210987654321_EC2_PROV` | `arn:aws:iam::210987654321:role/vault-service-role` | env |
| `TFC_VAULT_BACKED_AWS_RUN_ROLE_ARN_210987654321_S3_ADMIN` | `arn:aws:iam::210987654321:role/vault-service-role` | env |
| `TFC_VAULT_BACKED_AWS_RUN_VAULT_ROLE_123456789012_DB_ADMIN` | `123456789012-dynamodb-admin` | env |
| `TFC_VAULT_BACKED_AWS_RUN_VAULT_ROLE_123456789012_EC2_PROV` | `123456789012-ec2-instance-provisioner` | env |
| `TFC_VAULT_BACKED_AWS_RUN_VAULT_ROLE_123456789012_S3_ADMIN` | `123456789012-s3-full-access` | env |
| `TFC_VAULT_BACKED_AWS_RUN_VAULT_ROLE_210987654321_DB_ADMIN` | `210987654321-dynamodb-admin` | env |
| `TFC_VAULT_BACKED_AWS_RUN_VAULT_ROLE_210987654321_EC2_PROV` | `210987654321-ec2-instance-provisioner` | env |
| `TFC_VAULT_BACKED_AWS_RUN_VAULT_ROLE_210987654321_S3_ADMIN` | `210987654321-s3-full-access` | env |
| `TFC_VAULT_NAMESPACE` | `admin` | env |
| `TFC_VAULT_PROVIDER_AUTH` | `true` | env |
| `TFC_VAULT_RUN_ROLE` | `app-team-cosmo-dev-role` | env |
