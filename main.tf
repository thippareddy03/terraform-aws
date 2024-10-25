resource "aws_vpc" "vpc_info" {
  cidr_block         = var.vpc_info.cidr_block
  enable_dns_support = var.vpc_info.enable_dns_support
  tags               = merge(var.vpc_info.tags, { Name = var.vpc_info.name })
}