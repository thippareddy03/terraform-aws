# VPC info
variable "vpc_info" {
  type = object({
    name               = string
    cidr_block         = string
    enable_dns_support = bool
    tags               = map(string)
  })
  description = "This provides vpc info"
}
#Public subnet variables

variable "Public_Subnets" {
  type = list(object({
    name              = string
    cidr_block        = string
    availability_Zone = string
    tags              = map(string)
  }))
  description = "This provide public subnet info"
}

#Private subnet variables

variable "Private_Subnets" {
  type = list(object({
    name              = string
    cidr_block        = string
    availability_Zone = string
    tags              = map(string)
  }))
  description = "This provide private subnet info"
}

# Internet Gateway
variable "IG" {
  type = object({
    name = string
    tags = map(string)
  })
  description = "This value defines internet Gateway"

}

#Public route table
variable "Public_Route" {
  type = object({
    name = string
    tags = map(string)
  })
  description = "This defines public route table info"

}

#Private route table
variable "Private_Route" {
  type = object({
    name = string
    tags = map(string)
  })
  description = "This defines private route table info"

}
#Security group
variable "public_Security_Group_ingress" {
  type = list(object({
    from_port  = number
    to_port    = number
    protocol   = string
    cidr_block = list(string)
    tags       = map(string)
  }))
  description = "This defines public security group ingress rules"
}
variable "public_Security_Group_egress" {
  type = list(object({
    from_port  = number
    to_port    = number
    protocol   = string
    cidr_block = list(string)
    tags       = map(string)
  }))
  description = "This defines public security group egress rules"
}

#Security group
variable "private_Security_Group_ingress" {
  type = list(object({
    from_port  = number
    to_port    = number
    protocol   = string
    cidr_block = list(string)
    tags       = map(string)
  }))
  description = "This defines private security group ingress rules"
}
variable "private_Security_Group_egress" {
  type = list(object({
    from_port  = number
    to_port    = number
    protocol   = string
    cidr_block = list(string)
    tags       = map(string)
  }))
  description = "This defines private security group egress rules"
}

