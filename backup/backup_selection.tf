resource "aws_backup_selection" "webapp_backup_selection" {
  provider           = aws.primary
  name               = "${var.project_name}-backup-selection"
  iam_role_arn       = aws_iam_role.backup_role.arn
  backup_plan_id     = aws_backup_plan.webapp_backup_plan.id

  resources = [
    aws_db_instance.webapp_db.arn,
    aws_autoscaling_group.web_asg.arn,
    aws_autoscaling_group.app_asg.arn
  ]
}
