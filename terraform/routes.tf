resource "aws_route" "route-public-subnets" {
  count                  = 2
  route_table_id         = aws_route_table.public-subnets-rt[count.index].id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.vpc-InternetGateway.id
}

resource "aws_route_table_association" "public-subnet-association" {
  count          = 2
  subnet_id      = aws_subnet.alb-public-subnet[count.index].id
  route_table_id = aws_route_table.public-subnets-rt[count.index].id
}


resource "aws_route_table" "public-subnets-rt" {
  count  = 2
  vpc_id = aws_vpc.main-vpc.id

  tags = {
    Name = "hello-world-public-subnets-rt"
  }
}
