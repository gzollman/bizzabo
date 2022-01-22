data "aws_availability_zones" "available" {
  state = "available"
}

locals {

  subnets_cidrs         = [for index in range(4) : cidrsubnet(var.VPC_CIDR, 4, index)]
  public-subnets_cidrs  = slice(local.subnets_cidrs, 0, 2)
  private-subnets_cidrs = slice(local.subnets_cidrs, 2, 4)
}


resource "aws_subnet" "alb-public-subnet" {
  count             = 2
  cidr_block        = local.public-subnets_cidrs[count.index]
  availability_zone = data.aws_availability_zones.available.names[count.index]
  vpc_id            = aws_vpc.main-vpc.id

  map_public_ip_on_launch = true

  tags = {
    Name = "hello-world--public-subnet"
  }
}

resource "aws_subnet" "webserver-private-subnet" {
  count                   = 2
  cidr_block              = local.private-subnets_cidrs[count.index]
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  vpc_id                  = aws_vpc.main-vpc.id
  map_public_ip_on_launch = false

  tags = {
    Name = "hello-world-private-subnet"
  }
}
