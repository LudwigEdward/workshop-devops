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
