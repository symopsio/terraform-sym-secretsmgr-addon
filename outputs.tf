output "policy_arn" {
  description = "Secrets access policy arn"
  value       = aws_iam_policy.this.arn
}
