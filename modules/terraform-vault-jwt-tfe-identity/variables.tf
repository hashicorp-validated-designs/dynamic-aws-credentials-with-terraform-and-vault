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

variable "name_prefix" {
  description = "The prefix that will be used to provide a consistent naming convention to created resources."
  type        = string
  default     = null
}

variable "jwt_auth_backend_path" {
  type        = string
  description = "The path of the jwt auth backend under which the role will be created"
  default     = null
}

variable "token_ttl" {
  type        = number
  description = "The token lifetime in seconds"
  default     = null
}

variable "token_num_uses" {
  type        = number
  default     = 0
  description = "The maximum number of times a generated token may be used (within its lifetime); 0 means unlimited"
}

variable "aws_secrets_backend_roles" {
  type        = list(string)
  description = "The list of AWS roles that will be used to generate a Vault policy for the JWT role"
  default     = null
}

variable "aws_secrets_backend_path" {
  description = "The path to the AWS secrets engine in Vault."
  type        = string
  default     = null
}

variable "vault_custom_jwt_role_policy" {
  description = "The custom policy to be attached to the JWT role"
  type        = object({
    name      = string
    directory = string
  })
  default     = null
}
