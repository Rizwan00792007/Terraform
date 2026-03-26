variable "ami_type" { }

variable "ec2_type" { }

variable "instances" {
  type = map(object({
    server_name = string
    role        = string
    environment = string
    team        = string
  }))
}