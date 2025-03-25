# Vault JWT TFE Identity Complete Example

This example demonstrates how to use the `terraform-vault-jwt-tfe-identity` module to configure a Vault JWT identity for a TFE/C workspace.

## Usage

1.  Configure the Vault provider in `config.tf`.
2.  Set the required variables in `main.tf`.
3.  Run the following commands:

```bash
terraform init
terraform plan
terraform apply
```

---

<!-- BEGIN_TF_DOCS -->

### Providers

No providers.
### Requirements

| Name | Version |
|------|---------|
| terraform | ~> 1.5.0 |
| vault | ~> 4.3.0 |
### Inputs

No inputs.
### Outputs

| Name | Description |
|------|-------------|
| token_policies | The policies that are attached to the role in Vault |
| vault_jwt_workload_identity_role | The role that's created in Vault for the TFE Workspace or Project |
### Resources

No resources.
<!-- END_TF_DOCS -->