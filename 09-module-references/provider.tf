provider "aws" {}

module "a" {
    source = "./Modules/a"
}

module "b" {
    source = "./Modules/b" 
    vpc_id = "${module.a.vpc_id}"
}
