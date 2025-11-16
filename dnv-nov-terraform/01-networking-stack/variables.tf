variable "tags" {
  type = map(string)
  default = {
    "Environment" = "Development"
    "Owner"       = "John Doe"
    "Project"     = "Networking Stack"
  }
}

variable "assume_role" {
  type = object({
    role_arn = string
    region   = string
  })
  default = {
    role_arn = "arn:aws:iam::150419829629:role/workshop-nov-role"
    region   = "us-east-1"
  }


}
variable "vpc" {
  type = object({
    name                     = string
    cidr_block               = string
    internet_gateway_name    = string
    public_route_table_name  = string
    private_route_table_name = string
    nat_gateway_name         = string
    public_subnets = list(object({
      name                    = string
      cidr_block              = string
      availability_zone       = string
      map_public_ip_on_launch = bool
    }))
    private_subnets = list(object({
      name                    = string
      cidr_block              = string
      availability_zone       = string
      map_public_ip_on_launch = bool
    }))
  })
  default = {
    name                     = "workshop-nov-vpc"
    cidr_block               = "10.0.0.0/24"
    internet_gateway_name    = "workshop-nov-igw"
    public_route_table_name  = "workshop-nov-public-rt"
    private_route_table_name = "workshop-nov-private-rt"
    nat_gateway_name         = "workshop-nov-nat-gw"
    public_subnets = [
      {
        name                    = "workshop-dvn-nov-public-subnet-1a"
        cidr_block              = "10.0.0.0/26"
        availability_zone       = "us-east-1a"
        map_public_ip_on_launch = true
      },
      {
        name                    = "workshop-dvn-nov-public-subnet-1b"
        cidr_block              = "10.0.0.64/26"
        availability_zone       = "us-east-1b"
        map_public_ip_on_launch = true
      }
    ]
    private_subnets = [
      {
        name                    = "workshop-dvn-nov-private-subnet-1a"
        cidr_block              = "10.0.0.128/26"
        availability_zone       = "us-east-1a"
        map_public_ip_on_launch = false
      },
      {
        name                    = "workshop-dvn-nov-private-subnet-1b"
        cidr_block              = "10.0.0.192/26"
        availability_zone       = "us-east-1b"
        map_public_ip_on_launch = false
      }
    ]
  }
}
