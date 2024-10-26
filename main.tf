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
  tags       = merge(var.Public_Subnets[count.index].tags, { Name = var.Public_Subnets[count.index].name })
  depends_on = [aws_vpc.vpc_info]

}

#Creating private subnets

resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.vpc_info.id
  count             = length(var.Private_Subnets)
  cidr_block        = var.Private_Subnets[count.index].cidr_block
  availability_zone = var.Private_Subnets[count.index].availability_Zone
  tags              = merge(var.Private_Subnets[count.index].tags, { Name = var.Private_Subnets[count.index].name })
  depends_on        = [aws_vpc.vpc_info]

}

#creating internet gate way
resource "aws_internet_gateway" "Interet_Gateway" {
  vpc_id     = aws_vpc.vpc_info.id
  tags       = merge(var.IG.tags, { Name = var.IG.name })
  depends_on = [aws_vpc.vpc_info]

}
#Creation of public route table
resource "aws_route_table" "public_route" {
  count      = length(var.Public_Subnets) > 0 ? 1 : 0
  vpc_id     = aws_vpc.vpc_info.id
  tags       = merge(var.Public_Route.tags, { Name = var.Public_Route.name })
  depends_on = [aws_vpc.vpc_info, aws_subnet.public]
}
#Creation of private route table
resource "aws_route_table" "private_route" {
  count      = length(var.Private_Subnets) > 0 ? 1 : 0
  vpc_id     = aws_vpc.vpc_info.id
  tags       = merge(var.Private_Route.tags, { Name = var.Private_Route.name })
  depends_on = [aws_vpc.vpc_info, aws_subnet.private]
}
#Creation of public route table association
resource "aws_route_table_association" "public_association" {
  count          = length(var.Public_Subnets) > 0 ? 1 : 0
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public_route[0].id
  depends_on     = [aws_route_table.public_route]
}
#Creation of private route table association
resource "aws_route_table_association" "private_association" {
  count          = length(var.Private_Subnets) > 0 ? 1 : 0
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private_route[0].id
  depends_on     = [aws_route_table.private_route]
}



