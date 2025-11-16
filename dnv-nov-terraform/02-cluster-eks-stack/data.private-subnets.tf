data "aws_subnets" "private" {
  filter {
    name   = "map-public-ip-on-launch"
    values = ["false"]
  }

  filter {
    name   = "tag:Environment"
    values = ["Development"]
  }

  filter {
    name   = "tag:Project"
    values = ["Networking Stack"]
  }
}
