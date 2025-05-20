locals {
  primary_subnets = {
    public_a = "10.0.0.0/24"
    public_b = "10.0.1.0/24"
    web_a    = "10.0.10.0/24"
    web_b    = "10.0.11.0/24"
    app_a    = "10.0.20.0/24"
    app_b    = "10.0.21.0/24"
  }

  secondary_subnets = {
    public_a = "10.1.0.0/24"
    public_b = "10.1.1.0/24"
    web_a    = "10.1.10.0/24"
    web_b    = "10.1.11.0/24"
    app_a    = "10.1.20.0/24"
    app_b    = "10.1.21.0/24"
  }
}

resource "aws_subnet" "primary" {
  for_each = local.primary_subnets

  provider          = aws.primary
  vpc_id            = aws_vpc.primary.id
  cidr_block        = each.value
  availability_zone = var.azs_primary[regex("[ab]", each.key)[0] == "a" ? 0 : 1]
  tags = {
    Name = "${var.project_name}-${each.key}-primary"
  }
}

resource "aws_subnet" "secondary" {
  for_each = local.secondary_subnets

  provider          = aws.secondary
  vpc_id            = aws_vpc.secondary.id
  cidr_block        = each.value
  availability_zone = var.azs_secondary[regex("[ab]", each.key)[0] == "a" ? 0 : 1]
  tags = {
    Name = "${var.project_name}-${each.key}-secondary"
  }
}
