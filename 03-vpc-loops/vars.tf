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

variable "azs" {
    type = "list"
    default = ["us-east-2a", "us-east-2b"]
}

variable "azs-c" {
    type = "list"
    default = ["A", "B"]
}