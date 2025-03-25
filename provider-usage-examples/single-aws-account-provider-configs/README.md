# Single AWS Account Provider Configurations

This example demonstrates how to configure multiple AWS providers in a single AWS account using dynamic credentials sourced from HashiCorp Vault.

## Provider Configuration

This example showcases two primary methods for configuring AWS providers with dynamic credentials:

### Default Provider

* The default provider is configured without an alias. Any resources that are not explicitly associated with a specific provider will utilize this default provider.
* The credentials for the default provider are sourced from Vault based on the environment variables set in the Terraform Cloud workspace.

### Aliased Providers

* Multiple aliased providers are configured, each with a unique alias. This allows you to use different sets of credentials for different resources within your Terraform configuration.
* The credentials for each aliased provider are sourced from Vault based on the environment variables associated with the corresponding tag. These tags are derived from the Vault AWS roles used to generate the STS credentials.

## Environment Variables

The following table lists the environment variables that are set in the Terraform Cloud workspace to enable Vault workload identity and dynamic credential injection.

| Key | Value | Category |
|---|---|---|
| `TFC_DEFAULT_VAULT_BACKED_AWS_AUTH_TYPE` | `assumed_role` | env |
| `TFC_DEFAULT_VAULT_BACKED_AWS_MOUNT_PATH` | `aws-tfc` | env |
| `TFC_DEFAULT_VAULT_BACKED_AWS_RUN_ROLE_ARN` | `arn:aws:iam::123456789012:role/vault-service-role` | env |
| `TFC_DEFAULT_VAULT_BACKED_AWS_RUN_VAULT_ROLE` | `123456789012-s3-full-access` | env |
| `TFC_VAULT_ADDR` | `https://vault-demo-01-public-vault-acbc4bf5.d7b4d80f.z1...` | env |
| `TFC_VAULT_AUTH_PATH` | `jwt-tfc` | env |
| `TFC_VAULT_BACKED_AWS_AUTH` | `true` | env |
| `TFC_VAULT_BACKED_AWS_AUTH_123456789012_DB_ADMIN` | `true` | env |
| `TFC_VAULT_BACKED_AWS_AUTH_123456789012_EC2_PROV` | `true` | env |
| `TFC_VAULT_BACKED_AWS_RUN_ROLE_ARN_123456789012_DB_ADMIN` | `arn:aws:iam::123456789012:role/vault-service-role` | env |
| `TFC_VAULT_BACKED_AWS_RUN_ROLE_ARN_123456789012_EC2_PROV` | `arn:aws:iam::123456789012:role/vault-service-role` | env |
| `TFC_VAULT_BACKED_AWS_RUN_VAULT_ROLE_123456789012_DB_ADMIN` | `123456789012-dynamodb-admin` | env |
| `TFC_VAULT_BACKED_AWS_RUN_VAULT_ROLE_123456789012_EC2_PROV` | `123456789012-ec2-instance-provisioner` | env |
| `TFC_VAULT_NAMESPACE` | `admin` | env |
| `TFC_VAULT_PROVIDER_AUTH` | `true` | env |
| `TFC_VAULT_RUN_ROLE` | `aws-shinra-app-infra-dev-role` | env |
