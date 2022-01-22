resource "aws_internet_gateway" "vpc-InternetGateway" {
  vpc_id = aws_vpc.main-vpc.id

  tags = {
    Name = "hello-world-ig"
  }
}