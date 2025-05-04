resource "aws_vpc" "primary" {
  provider = aws.primary
  cidr_block = var.vpc_cidr_primary
  tags = {
    Name = "${var.project_name}-vpc-primary"
  }
}

resource "aws_vpc" "secondary" {
  provider = aws.secondary
  cidr_block = var.vpc_cidr_secondary
  tags = {
    Name = "${var.project_name}-vpc-secondary"
  }
}
