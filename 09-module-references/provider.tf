provider "aws" {}

module "a" {
    source = "./Modules/a"
}

module "b" {
    source = "./Modules/b"
}