resource "aws_eip" "primary_nat" {
  provider = aws.primary
  count    = 2
  vpc      = true
}

resource "aws_nat_gateway" "primary" {
  provider      = aws.primary
  count         = 2
  allocation_id = aws_eip.primary_nat[count.index].id
  subnet_id     = values(aws_subnet.primary)[count.index].id # public_a and public_b
  tags = {
    Name = "${var.project_name}-nat-${count.index}-primary"
  }
}
