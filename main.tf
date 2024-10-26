# VPC Details
resource "aws_vpc" "vpc_info" {
  cidr_block         = var.vpc_info.cidr_block
  enable_dns_support = var.vpc_info.enable_dns_support
  tags               = merge(var.vpc_info.tags, { Name = var.vpc_info.name })
}

# Creating public subnets

resource "aws_subnet" "public" {
  vpc_id            = aws_vpc.vpc_info.id
  count             = length(var.Public_Subnets)
  cidr_block        = var.Public_Subnets[count.index].cidr_block
  availability_zone = var.Public_Subnets[count.index].availability_Zone
  #tags              = var.Public_Subnets[count.index].tags
  tags = merge(var.Public_Subnets[count.index].tags, { Name = var.Public_Subnets[count.index].name })
  depends_on = [aws_vpc.vpc_info]

}

