resource "aws_backup_plan" "webapp_backup_plan" {
  provider = aws.primary
  name     = "${var.project_name}-backup-plan"

  rule {
    rule_name         = "daily-backup"
    target_vault_name = aws_backup_vault.primary_vault.name
    schedule          = "cron(0 5 * * ? *)" # Daily at 5 AM UTC

    lifecycle {
      delete_after = 30
    }

    copy_action {
      destination_vault_arn = aws_backup_vault.secondary_vault.arn
      lifecycle {
        delete_after = 30
      }
    }
  }

  tags = {
    Name = "${var.project_name}-backup-plan"
  }
}
