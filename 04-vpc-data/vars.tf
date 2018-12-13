variable "vpc-cidr" {
    default = "10.0.0.0/22"
}

variable "project-name" {
    default = "Student"
}

variable "pub-sub-cidr" {
    type = "list"
    default = ["10.0.0.0/24", "10.0.1.0/24"]
}

variable "priv-sub-cidr" {
    type = "list"
    default = ["10.0.2.0/24", "10.0.3.0/24"]
}

#### If you use this kind of approach then it is going to be a problem iof you are running this code aginist other regions.
## Alternatively we will use data  
#variable "azs" {
#    type = "list"
#    default = ["us-east-2a", "us-east-2b"]
#}

data "aws_availability_zones" "available" {}

variable "azs-c" {
    type = "list"
    default = ["A", "B", "C", "D", "E", "F"]
}