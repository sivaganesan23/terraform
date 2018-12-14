module "network" {
    source          = "./Modules/network"
    proj            = "${var.proj}"
    application     = "${var.application}"
}

module "infra" {
    source          = "./Modules/infra"
}

module "database" {
    source = "./Modules/database"
    proj            = "${var.proj}"
    application     = "${var.application}"
}
