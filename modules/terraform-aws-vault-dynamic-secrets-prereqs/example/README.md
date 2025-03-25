# Dynamic Secrets Prereqs Complete Example

Configuration in this directory creates the resources in this module with all variables defined.

## Usage

To run this example you must configure the AWS and Vault providers and execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

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
| aws_backend_path | The details of the AWS secrets engine backend. |
| jwt_backend_path | The details of the JWT auth backend. |
| vault_service_account_arn | The ARN of the AWS IAM user that's used by the Vault AWS secrets engine. |
### Resources

No resources.
<!-- END_TF_DOCS -->