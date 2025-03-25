# TFE Project/Workspace Onboarding Example

This example demonstrates how to onboard Terraform Enterprise/Cloud (TFE/C) workspaces or projects to Vault for dynamic credential generation and injection. It utilizes the `terraform-tfe-vault-dynamic-creds-onboarding` module, which acts as a wrapper to configure JWT authentication and set the necessary environment variables in TFE/C.

## Enabling Workload Identity and Dynamic Credentials

This example focuses on enabling TFE/C workspaces or projects to authenticate with Vault and seamlessly use dynamic AWS credentials:

### JWT Authentication for Workload Identity

* The example configures JWT (JSON Web Token) authentication for TFE/C workload identity. This enables TFE/C workspaces or projects to authenticate with Vault using JWT, eliminating the need for static, long-lived credentials.
* This is achieved by creating a JWT authentication backend role in Vault and associating it with the specified TFE/C workspaces or projects.
* The JWT authentication backend role is configured with appropriate token policies to control the permissions granted to the TFE/C workspace or project within Vault.

### Environment Variables for Dynamic Credentials

* The example sets up environment variables in TFE/C to enable dynamic credential injection into Terraform providers. These variables provide TFE/C with the necessary information to connect to Vault, authenticate using JWT, and retrieve dynamic AWS credentials.
* The environment variables include the Vault address, the Vault JWT authentication role, and the path to the AWS secrets engine in Vault.
* The example also demonstrates how to configure multiple AWS roles and their associated aliases, allowing TFE/C to dynamically inject different sets of AWS credentials into Terraform providers based on the specific requirements of each workspace or project.

## Data Sourcing

This example uses Terraform's remote state data source to retrieve the `all_vault_aws_roles` output from the `aws-account-onboarding` example. This output contains a map of all the Vault AWS roles that were created, which is then used to configure the `aws_role_aliases` variable in the `terraform-tfe-vault-dynamic-creds-onboarding` module. This demonstrates how to dynamically reference and utilize resources created in previous stages of your infrastructure provisioning workflow.

## Additional Details

To gain a better understanding of the components please refer to the module's [README](../../modules/terraform-tfe-vault-dynamic-creds-onboarding/README.md)

<!-- BEGIN_TF_DOCS -->

### Providers

| Name | Version |
|------|---------|
| terraform | n/a |
### Modules

| Name | Source | Version |
|------|--------|---------|
| aws_cosmo_app_deploy_dev | ../../modules/terraform-tfe-vault-dynamic-creds-onboarding | n/a |
| aws_cosmo_app_infra_dev | ../../modules/terraform-tfe-vault-dynamic-creds-onboarding | n/a |
| aws_shinra_app_infra_dev | ../../modules/terraform-tfe-vault-dynamic-creds-onboarding | n/a |
### Requirements

| Name | Version |
|------|---------|
| terraform | ~> 1.9.8 |
| tfe | ~> 0.62.0 |
| vault | ~> 4.4.0 |
### Inputs

| Name | Description | Type | Default |
|------|-------------|------|---------|
| aws_secrets_backend_path | The path to the AWS secrets engine in Vault. | `string` | `null` |
| tfe_hostname | The hostname of the Terraform Enterprise instance | `string` | `"app.terraform.io"` |
| tfe_organization_name | The name of the Terraform Enterprise organization in which to build workspaces in | `string` | `null` |
| tfe_vault_audience | The audience value to use in run identity tokens | `string` | `"vault.workload.identity"` |
| vault_address | The URL of the Vault instance you'd like to use with Terraform Enterprise | `string` | `null` |
| vault_base64_pem_ca_certificate | This certificate will be used when connecting to Vault. May be required when connecting to Vault instances that use a custom or self-signed certificate | `string` | `null` |
| vault_jwt_auth_backend_path | The path of the jwt auth backend under which the role will be created | `string` | `null` |
### Outputs

No outputs.
### Resources

| Name | Type |
|------|------|
| [terraform_remote_state.vault_aws_dynamic_creds_prereqs](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
<!-- END_TF_DOCS -->
