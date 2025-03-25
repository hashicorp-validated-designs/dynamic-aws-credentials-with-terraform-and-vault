variable "tfe_organization_name" {
  description = "The name of the Terraform Enterprise organization in which to build workspaces in"
  type        = string
  default     = null
}

variable "tfe_hostname" {
  description = "The hostname of the Terraform Enterprise instance"
  type        = string
  default     = "app.terraform.io"
}

variable "tfe_vault_audience" {
  type        = string
  default     = "vault.workload.identity"
  description = "The audience value to use in run identity tokens"
}

variable "aws_secrets_backend_path" {
  description = "The path to the AWS secrets engine in Vault."
  type        = string
  default     = null
}

variable "vault_address" {
  type        = string
  description = "The URL of the Vault instance you'd like to use with Terraform Enterprise"
  default     = null
}

variable "vault_jwt_auth_backend_path" {
  type        = string
  description = "The path of the jwt auth backend under which the role will be created"
  default     = null
}

variable "vault_base64_pem_ca_certificate" {
  type        = string
  description = "This certificate will be used when connecting to Vault. May be required when connecting to Vault instances that use a custom or self-signed certificate"
  default     = null
}