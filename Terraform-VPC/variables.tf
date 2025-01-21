variable vpc_cidr {
  type        = string
  description = "My Vpc  CIDR block"
}


variable subnet_cidr {
  type        = list(string)
  description = "My subnet  CIDRs"
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable subnet_names {
  type        = list(string)
  description = "My subnet  names"
  default     = ["public-subnet-1", "public-subnet-2"]
}

variable sg_name {
  description = "Security Group Name"
  type        = string
}

variable sg_description {
  description = "Security Group Description"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}
