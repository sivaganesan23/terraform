module "network" {
    source = "./Modules/network"
    proj  = "${var.proj}"
}

module "infra" {
    source = "./Modules/infra"
}

module "database" {
    source = "./Modules/database"
}
