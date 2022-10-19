variable "role_name" {
  description = "Role for github actions."
  type        = string
}

variable "oidc_url" {
  description = "The issuer of the OIDC token."
  type        = string
}

variable "oidc_client_id" {
  description = "Custom audience"
  type        = string
}

variable "oidc_thumbprint" {
  description = "Thumbprint of the issuer."
  type        = string
}

variable "iam_role_permissions_boundary" {
  description = "Permission boundary"
  type        = string
  sensitive   = true
}

variable "project_repository_condition" {
  description = ""
  type        = string
}