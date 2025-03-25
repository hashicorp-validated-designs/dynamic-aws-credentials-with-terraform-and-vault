variable "aws_backend_path" {
  description = "The unique path this backend should be mounted at"
  type        = string
  default     = "aws-tfc"
}

variable "external_id" {
  description = "The external ID to use for the IAM role trust policy."
  type        = string
  default     = null
}

variable "aws_secrets_backend_tune_settings" {
  description = "The settings to tune the AWS secrets backend."
  type = object({
    default_lease_ttl_seconds = number
    max_lease_ttl_seconds     = number
  })
  default = {
    default_lease_ttl_seconds = 3600
    max_lease_ttl_seconds     = 7200
  }
}

variable "region" {
  description = "The AWS region for API calls."
  type        = string
  default     = "us-east-1"
}

variable "tags" {
  description = "The tags to apply to the AWS resources."
  type        = map(string)
  default     = null
}

variable "vault_service_account_name" {
  description = "The name of the IAM user that Vault will use."
  type        = string
  default     = "vault-service-account"
}

variable "vault_service_role_name" {
  description = "The name of the IAM role that Vault will assume."
  type        = string
  default     = "vault-service-role"
}

variable "jwt_backend_path" {
  description = "The unique path this backend should be mounted at."
  type        = string
  default     = "jwt-tfc"
}

variable "jwt_backend_tune_settings" {
  description = "The settings to tune the JWT backend."
  type = object({
    default_lease_ttl = string
    max_lease_ttl     = string
    token_type        = string
  })
  default = {
    default_lease_ttl = "1h"
    max_lease_ttl     = "2h"
    token_type        = "default-service"
  }
}

variable "tfc_hostname" {
  description = "The hostname of the TFE instance."
  type        = string
  default     = "app.terraform.io"
}

variable "oidc_discovery_ca_pem" {
  description = "The CA certificate to use for OIDC discovery."
  type        = string
  default     = null
}
