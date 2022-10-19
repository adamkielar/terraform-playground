## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_openid_connect_provider.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_openid_connect_provider) | resource |
| [aws_iam_role.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_policy_document.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_default_tags"></a> [default\_tags](#input\_default\_tags) | Default tags for AWS resources | `map(string)` | `{}` | no |
| <a name="input_iam_role_permissions_boundary"></a> [iam\_role\_permissions\_boundary](#input\_iam\_role\_permissions\_boundary) | Permission boundary | `string` | n/a | yes |
| <a name="input_oidc_client_id"></a> [oidc\_client\_id](#input\_oidc\_client\_id) | Custom audience | `string` | n/a | yes |
| <a name="input_oidc_thumbprint"></a> [oidc\_thumbprint](#input\_oidc\_thumbprint) | Thumbprint of the issuer. | `string` | n/a | yes |
| <a name="input_oidc_url"></a> [oidc\_url](#input\_oidc\_url) | The issuer of the OIDC token. | `string` | n/a | yes |
| <a name="input_policy_arns"></a> [policy\_arns](#input\_policy\_arns) | A list of policy ARNs to attach the role | `list(string)` | `[]` | no |
| <a name="input_project_repository_condition"></a> [project\_repository\_condition](#input\_project\_repository\_condition) | n/a | `string` | n/a | yes |
| <a name="input_role_name"></a> [role\_name](#input\_role\_name) | Role for github actions. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | The ARN of generated IAM role |
| <a name="output_name"></a> [name](#output\_name) | The name of generated IAM role |

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_openid_connect_provider.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_openid_connect_provider) | resource |
| [aws_iam_role.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_policy_document.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_default_tags"></a> [default\_tags](#input\_default\_tags) | Default tags for AWS resources | `map(string)` | `{}` | no |
| <a name="input_iam_role_permissions_boundary"></a> [iam\_role\_permissions\_boundary](#input\_iam\_role\_permissions\_boundary) | Permission boundary | `string` | n/a | yes |
| <a name="input_oidc_client_id"></a> [oidc\_client\_id](#input\_oidc\_client\_id) | Custom audience | `string` | n/a | yes |
| <a name="input_oidc_thumbprint"></a> [oidc\_thumbprint](#input\_oidc\_thumbprint) | Thumbprint of the issuer. | `string` | n/a | yes |
| <a name="input_oidc_url"></a> [oidc\_url](#input\_oidc\_url) | The issuer of the OIDC token. | `string` | n/a | yes |
| <a name="input_policy_arns"></a> [policy\_arns](#input\_policy\_arns) | A list of policy ARNs to attach the role | `list(string)` | `[]` | no |
| <a name="input_project_repository_condition"></a> [project\_repository\_condition](#input\_project\_repository\_condition) | n/a | `string` | n/a | yes |
| <a name="input_role_name"></a> [role\_name](#input\_role\_name) | Role for github actions. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | The ARN of generated IAM role |
| <a name="output_name"></a> [name](#output\_name) | The name of generated IAM role |
<!-- END_TF_DOCS -->