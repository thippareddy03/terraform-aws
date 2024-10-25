variable "vpc_info" {
  type = object({
    name               = string
    cidr_block         = string
    enable_dns_support = bool
    tags               = map(string)
  })
  description = "This provides vpc info"
}