# TFE Vault Dynamic Credentials Onboarding Complete Example

This example demonstrates how to use the `terraform-tfe-vault-dynamic-creds-onboarding` module to onboard a TFE workspace to Vault for dynamic credential generation.

## Usage

1.  Configure the TFE and Vault providers in `config.tf`.
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
| terraform | ~> 1.9.8 |
| tfe | ~> 0.62.0 |
| vault | ~> 4.4.0 |
### Inputs

No inputs.
### Outputs

No outputs.
### Resources

No resources.
<!-- END_TF_DOCS -->
