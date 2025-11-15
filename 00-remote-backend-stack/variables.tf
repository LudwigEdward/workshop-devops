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


variable "remote_backend" {
  type = object({
    bucket_name               = string
    dynamo_table_name         = string
    dynamo_table_billing_mode = string
    dynamo_table_hash_key     = string
    dynamo_hash_key_type      = string
  })
  default = {
    bucket_name               = "workshop-nov-remote-backend-bucket-lesb"
    dynamo_table_name         = "workshop-nov-state-locking-table"
    dynamo_table_billing_mode = "PAY_PER_REQUEST"
    dynamo_table_hash_key     = "LockID"
    dynamo_hash_key_type      = "S"
  }
}
