module "network" {
    source          = "./Modules/network"
    proj            = "${var.proj}"
    application     = "${var.application}"
}

module "infra" {
    source          = "./Modules/infra"
    dbuser          = "${module.database.dbuser}" 
    dbname          = "${module.database.dbname}" 
    dbpass          = "${module.database.dbpass}" 
    dbip            = "${module.database.dbip}" 
}

module "database" {
    source = "./Modules/database"
    proj            = "${var.proj}"
    application     = "${var.application}"
    private_subnets = "${module.network.private_subnets}"
}
