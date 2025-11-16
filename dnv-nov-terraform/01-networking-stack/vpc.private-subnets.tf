resource "aws_subnet" "private" {
  count                   = length(var.vpc.private_subnets)
  vpc_id                  = aws_vpc.this.id
  cidr_block              = var.vpc.private_subnets[count.index].cidr_block
  availability_zone       = var.vpc.private_subnets[count.index].availability_zone
  map_public_ip_on_launch = var.vpc.private_subnets[count.index].map_public_ip_on_launch

  tags = {
    Name = var.vpc.private_subnets[count.index].name
  }
}

# resource "aws_subnet" "public_us_east_1a" {
#   vpc_id                  = aws_vpc.this.id
#   cidr_block              = "10.0.1.0/26"
#   availability_zone       = "us-east-1a"
#   map_public_ip_on_launch = true

#   tags = {
#     Name = "workshop-dvn-nov-public-subnet-1a"
#   }
# }

# resource "aws_subnet" "public_us_east_1b" {
#   vpc_id                  = aws_vpc.this.id
#   cidr_block              = "10.0.1.64/26"
#   availability_zone       = "us-east-1b"
#   map_public_ip_on_launch = true

#   tags = {
#     Name = "workshop-dvn-nov-public-subnet-1b"
#   }
# }

