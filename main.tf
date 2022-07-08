resource "aws_iam_policy" "this" {
  name = "SymSecretsManager${title(var.environment)}"
  path = "/sym/"

  description = "Addon policy granting access to Secrets Manager secrets"
  policy      = <<EOT
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "secretsmanager:DescribeSecret",
        "secretsmanager:GetSecretValue"
      ],
      "Resource": "*",
      "Condition": { "StringEquals": { "secretsmanager:ResourceTag/${var.tag_name}": "${var.environment}" } }
    }
  ]
}
EOT
}
