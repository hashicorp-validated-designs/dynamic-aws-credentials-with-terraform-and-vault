# Prerequisites Example

This example sets the stage for dynamically generating AWS credentials with HashiCorp Vault. It uses the `terraform-aws-vault-dynamic-secrets-prereqs` module to configure the foundational elements required for secure and automated credential management.

## Establishing Secure Communication

This example focuses on establishing the core components for secure communication and authentication between AWS, Vault, and Terraform Cloud/Enterprise (TFE/C):

### IAM User for Vault

* An IAM user is created within your AWS account. This user acts as Vault's identity within AWS, allowing it to interact with AWS services.
* This dedicated user adheres to the principle of least privilege. Its permissions are carefully scoped to only the necessary actions, minimizing potential security risks.

### AWS Secrets Engine

* The AWS secrets engine is configured within Vault. This engine is responsible for dynamically generating AWS credentials based on defined roles and policies.
* By utilizing the secrets engine, you eliminate the need to manage long-lived AWS credentials, significantly reducing your security risk surface.

### JWT Authentication

* JWT (JSON Web Token) authentication is enabled in Vault. This allows TFE/C to authenticate with Vault using JWT, a secure and industry-standard method.
* JWT authentication enables workload identity federation, eliminating the need for static credentials and enhancing security.

## Why These Prerequisites Matter

These prerequisites are crucial for establishing a secure and robust foundation for dynamic AWS credential generation. They ensure that Vault can interact with AWS securely, TFE/C can authenticate with Vault, and dynamic credentials can be generated with appropriate permissions.

By automating the creation and configuration of these components, this example simplifies the setup process and promotes consistency across your infrastructure.

## Additional Details

To gain a better understanding of the components please refer to the module's [README](../../modules/terraform-aws-vault-dynamic-secrets-prereqs/README.md)

<!-- BEGIN_TF_DOCS -->

### Providers

No providers.
### Modules

| Name | Source | Version |
|------|--------|---------|
| terraform_vault_aws_dynamic_creds_prereqs | ../../modules/terraform-aws-vault-dynamic-secrets-prereqs | n/a |
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
