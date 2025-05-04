resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "${var.project_name}-rds-subnet-group"
  subnet_ids = [aws_subnet.primary["app_a"].id, aws_subnet.primary["app_b"].id]

  tags = {
    Name = "${var.project_name}-rds-subnet-group"
  }
}
