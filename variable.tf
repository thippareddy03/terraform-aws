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