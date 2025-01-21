variable vpc_cidr {
  type        = string
  description = "My Vpc  CIDR block"
}


variable subnet_cidr {
  type        = list(string)
  description = "My subnet  CIDRs"
}


variable "subnet_names"{
  description ="Subnet Names"
  type=list(string)
  default =["PublicSubnet1" ,"PublicSubnet1"]
}