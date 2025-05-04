# Primary Region Backup Vault
resource "aws_backup_vault" "primary_vault" {
  provider = aws.primary
  name     = "${var.project_name}-primary-vault"
  tags = {
    Name = "${var.project_name}-primary-vault"
  }
}

# Secondary Region Backup Vault
resource "aws_backup_vault" "secondary_vault" {
  provider = aws.secondary
  name     = "${var.project_name}-secondary-vault"
  tags = {
    Name = "${var.project_name}-secondary-vault"
  }
}
