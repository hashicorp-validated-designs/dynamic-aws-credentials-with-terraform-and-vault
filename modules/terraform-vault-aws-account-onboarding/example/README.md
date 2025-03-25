# Vault AWS Account Onboarding Complete Example

This example demonstrates how to use the `terraform-vault-aws-account-onboarding` module to onboard an AWS account to Vault for dynamic credential generation.

## Usage

1. Configure the AWS and Vault providers in `config.tf`.
2. Set the required variables in `main.tf`.
3. Run the following commands:

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
| aws | ~> 5.75.1 |
| vault | ~> 4.4.0 |
### Inputs

No inputs.
### Outputs

| Name | Description |
|------|-------------|
| iam_role_arn | The ARN of the created IAM role |
| iam_role_name | The name of the created IAM role |
### Resources

No resources.
<!-- END_TF_DOCS -->