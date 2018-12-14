module "network" {
    source          = "./Modules/network"
    proj            = "${var.proj}"
    application     = "${var.application}"
}

module "infra" {
    source          = "./Modules/infra"
    proj            = "${var.proj}"
    application     = "${var.application}"
}

module "database" {
    source = "./Modules/database"
}
