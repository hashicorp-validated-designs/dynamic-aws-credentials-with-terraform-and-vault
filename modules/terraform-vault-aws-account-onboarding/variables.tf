variable "vault_aws_service_role_config" {
  description = "Configuration for the Vault AWS service role."
  type = object({
    aws_built_in_policy_name = optional(string)
    custom_policy_name       = optional(string)
    custom_policy_directory  = optional(string)
  })
  default = null
}

variable "aws_secrets_backend_path" {
  description = "The path to the AWS secrets engine in Vault."
  type        = string
  default     = null
}

variable "external_id" {
  description = "The external ID to use for the IAM role trust policy."
  type        = string
  default     = null
}

variable "tags" {
  description = "The tags to apply to the AWS resources."
  type        = map(string)
  default     = null
}

variable "vault_aws_role_configurations" {
  description = "Configuration for various policies, including suffixes, Vault role policy filters, and directories."
  type = map(object({
    name                     = string
    tag_suffix               = optional(string)
    aws_built_in_policy_name = optional(string)
    custom_policy_name       = optional(string)
    custom_policy_directory  = optional(string)
    default_sts_ttl          = optional(number)
    max_sts_ttl              = optional(number)
  }))
  default = {
    default_role = {
      name                     = "assumed-role"
      tag_suffix               = null
      aws_built_in_policy_name = "ReadOnlyAccess"
      custom_policy_name       = null
      custom_policy_directory  = null
      default_sts_ttl          = 3600
      max_sts_ttl              = 10800
    }
  }
}

variable "vault_service_role_name" {
  description = "The name of the IAM role that Vault will use."
  type        = string
  default     = "vault-service-role"
}

variable "vault_service_user_arn" {
  description = "The ARN of the IAM user that Vault will use."
  type        = string
  default     = null
}
