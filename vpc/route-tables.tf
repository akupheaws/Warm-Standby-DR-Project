resource "aws_internet_gateway" "primary" {
  provider = aws.primary
  vpc_id   = aws_vpc.primary.id
  tags = {
    Name = "${var.project_name}-igw-primary"
  }
}

resource "aws_route_table" "public_primary" {
  provider = aws.primary
  vpc_id   = aws_vpc.primary.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.primary.id
  }
  tags = {
    Name = "${var.project_name}-public-rt-primary"
  }
}

resource "aws_route_table_association" "public_primary" {
  for_each       = { for k, v in aws_subnet.primary : k => v if contains(k, "public") }
  provider       = aws.primary
  subnet_id      = each.value.id
  route_table_id = aws_route_table.public_primary.id
}
