variable "tfe_organization_name" {
  type        = string
  description = "The name of your Terraform Enterprise organization"
  default     = null
}

variable "tfe_vault_audience" {
  type        = string
  default     = "vault.workload.identity"
  description = "The audience value to use in run identity tokens"
}

variable "tfe_project_name" {
  type        = string
  description = "The project under which the workspace resides"
  default     = null
}

variable "tfe_workspace_name" {
  type        = string
  description = "The name of the workspace that you'd like to connect with Vault"
  default     = null
}

variable "tfe_run_phase" {
  type        = string
  description = "The run phase that the token will be used for"
  default     = "*"
}

variable "vault_jwt_role_name_prefix" {
  description = "The prefix that will be used to provide a consistent naming convention to created resources."
  type        = string
  default     = null
}

variable "vault_jwt_token_ttl" {
  type        = number
  description = "The token lifetime in seconds"
  default     = null
}

variable "vault_jwt_token_num_uses" {
  type        = number
  default     = 0
  description = "The maximum number of times a generated token may be used (within its lifetime); 0 means unlimited"
}

variable "aws_secrets_backend_path" {
  description = "The path to the AWS secrets engine in Vault."
  type        = string
  default     = null
}

variable "vault_custom_jwt_role_policy" {
  type        = object({
    directory = string
    name      = string
  })
  description = "The custom policy to use for the JWT role"
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

variable "vault_namespace" {
  type        = string
  description = "The Vault namespace to use, if not using the default"
  default     = null
}

variable "vault_base64_pem_ca_certificate" {
  type        = string
  description = "This certificate will be used when connecting to Vault. May be required when connecting to Vault instances that use a custom or self-signed certificate"
  default     = null
}

variable "default_aws_run_role" {
  type        = object({
    aws_run_role_arn = string
    vault_role       = string
  })
  description = "The default AWS dynamic credential role."
  default     = null
}

variable "aws_role_aliases" {
  type = map(object({
    tag_suffix              = optional(string)
    aws_run_role_arn    = string
    vault_role = string
  }))
  description = "Collection of AWS dynamic credential aliases."
  default     = null
}
