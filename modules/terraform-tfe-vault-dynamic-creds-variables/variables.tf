variable "tfe_organization_name" {
  type        = string
  description = "The name of your Terraform Enterprise organization"
  default     = null
}

variable "tfe_variable_set_name_prefix" {
  type        = string
  description = "The prefix to use for the Terraform Enterprise or Cloud variable set"
  default     = null
}

variable "tfe_project_id" {
  type        = string
  description = "The ID of the Terraform Enterprise project you'd like to use with Vault"
  default     = null
}

variable "tfe_workspace_id" {
  type        = string
  description = "The ID of the Terraform Enterprise workspace you'd like to use with Vault"
  default     = null
}

variable "vault_address" {
  type        = string
  description = "The URL of the Vault instance you'd like to use with Terraform Enterprise"
  default     = null
}

variable "vault_jwt_auth_backend_role" {
  type        = string
  description = "The name of the Vault role to create for the Terraform Enterprise workspace"
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
  type = object({
    aws_run_role_arn = string
    vault_role       = string
  })
  description = "The default AWS dynamic credential role."
  default     = null
}

variable "aws_secret_backend_mount_path" {
  type        = string
  description = "The mount path of the AWS secrets engine in Vault."
  default     = null
}

variable "aws_role_aliases" {
  type = map(object({
    tag_suffix       = optional(string)
    aws_run_role_arn = string
    vault_role       = string
  }))
  description = "Collection of AWS dynamic credential aliases."
  default     = null
}
