output "name" {
  description = "The name of generated IAM role"
  value       = aws_iam_role.this.name
}

output "arn" {
  description = "The ARN of generated IAM role"
  value       = aws_iam_role.this.arn
}