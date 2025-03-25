# Provisioning Examples

This folder contains a set of examples demonstrating how to provision the resources necessary for setting up dynamic AWS credentials with HashiCorp Vault and Terraform Enterprise/Cloud (TFE/C).

## Examples

The examples are organized in the following order:

1. [**Prerequisites:**](./1.%20prerequisites/README.md) This example sets up the foundational components, including an IAM user in AWS, the AWS secrets engine in Vault, and JWT authentication for TFE/C.
2. [**AWS Account Onboarding:**](./2.%20aws-account-onboarding/README.md) This example onboards target AWS accounts to Vault, creating IAM roles and policies and configuring Vault AWS secret backend roles.
3. [**TFE Project/Workspace Onboarding:**](./3.%20tfe-project-workspace-onboarding/README.md) This example configures TFE/C workspaces or projects to use dynamic AWS credentials from Vault, setting up JWT authentication and the necessary environment variables.

## Running the Examples

Each example folder contains its own README with detailed instructions on how to run it.

**Note:** The examples are designed to be executed in sequence, as they build upon each other.
