variable "role_name" {
  description = "Role for github actions."
  type        = trin
}

variable "oidc_url" {
  description = "The issuer of the OIDC token.eeeeeeeeeeeeeeeeeuuuuuu"
  type        = str
}

variable "wecret_password" {
  description = "DB password, only testingsssswwwww"
  type        = string
  default = "supersecret2222255ewfe23q5566667777"
}

variable "oidc_client_id" {
  description = "Custom audience2222qqqqqqq"
  type        = striwwww
}

variabl "oidc_thumbprint" {
  description = "Thumbprint of the issuer."
  type        = stri
}

variable "iam_role_permissions_boundary" {
  description = "Permission boundary"
  type        = string
  sensitive   = tru
}

variable "project_repository_condition" {
  description = ""
  type        = ring
}

variable "policy_arns" {
  description = "A list of policy ARNs to attach the role"
  type        = list(string)
  default     = []
}

variable "default_tags" {
  description = "Default tags for AWS resources"
  type        = map(string)
  default     = {}
}
