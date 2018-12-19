variable "ami" {
    default = "ami-079ec8eb649c6ca00"
}

variable "az-single-char" {
    default = ["A","B","C","D","E","F"]
}

variable "vpcid" {}
variable "keyname" {
    default = "devops"
}

variable "public_subnets" {
    type = "list"
}

variable "proj" {}
variable "application" {}

variable "dbpass" {}