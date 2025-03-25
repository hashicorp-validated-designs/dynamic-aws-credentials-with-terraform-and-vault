data "aws_caller_identity" "current" {}

locals {
  policy_documents = {
    for key, value in var.vault_aws_role_configurations : key => (
      value.custom_policy_name != null ?
      file(format("%s/%s/%s.json", path.root, value.custom_policy_directory, value.custom_policy_name)) : null
    )
  }
  with_built_in_policy = { for k, v in var.vault_aws_role_configurations : k => v if v.aws_built_in_policy_name != null }
}

resource "aws_iam_role" "vault_service_role" {
  name = var.vault_service_role_name
  tags = var.tags

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"

        Principal = {
          AWS = var.vault_service_user_arn
        }

        Condition = {
          StringEquals = {
            "sts:ExternalId" : var.external_id
          }
        }
      }
    ]
  })
}

data "aws_iam_policy" "built_in_policy_service_role" {
  count = var.vault_aws_service_role_config.aws_built_in_policy_name != null ? 1 : 0
  arn   = "arn:aws:iam::aws:policy/${var.vault_aws_service_role_config.aws_built_in_policy_name}"
}

resource "aws_iam_policy" "custom_policy" {
  count  = var.vault_aws_service_role_config.custom_policy_name != null ? 1 : 0
  name   = var.vault_aws_service_role_config.custom_policy_name
  policy = file(format("%s/%s/%s.json", path.root, var.vault_aws_service_role_config.custom_policy_directory, var.vault_aws_service_role_config.custom_policy_name))
  tags   = var.tags
}

resource "aws_iam_role_policy_attachment" "vault_service_role_policy_attachment" {
  role       = aws_iam_role.vault_service_role.name
  policy_arn = var.vault_aws_service_role_config.aws_built_in_policy_name != null ? data.aws_iam_policy.built_in_policy_service_role[0].arn : aws_iam_policy.custom_policy[0].arn
}

data "aws_iam_policy" "built_in_policy_vault_role" {
  for_each = local.with_built_in_policy
  arn      = "arn:aws:iam::aws:policy/${each.value.aws_built_in_policy_name}"
}

resource "vault_aws_secret_backend_role" "dynamic_credentials" {
  for_each        = var.vault_aws_role_configurations
  backend         = var.aws_secrets_backend_path
  name            = format("%s-%s", data.aws_caller_identity.current.account_id, each.value.name)
  credential_type = "assumed_role"
  external_id     = var.external_id
  default_sts_ttl = each.value.default_sts_ttl
  max_sts_ttl     = each.value.max_sts_ttl
  role_arns       = [aws_iam_role.vault_service_role.arn]
  policy_document = local.policy_documents[each.key] != null ? local.policy_documents[each.key] : data.aws_iam_policy.built_in_policy_vault_role[each.key].policy
}
