data "ionoscloud_datacenter" "dev_talks" {
    name            = format("%sDatacenter", var.name)
    location        = var.location
}

module "lan" {
    count           = 2
    source          = "./network"
    datacenter_id   = data.ionoscloud_datacenter.dev_talks.id
    name            = (count.index == 0 ? format("%sLan1", var.name): format("%sLan2", var.name))
}

module "alb" {
    source          = "./alb/alb"
    datacenter_id   = data.ionoscloud_datacenter.dev_talks.id
    name            = format("%sAlb", var.name)
    listener_lan    = module.lan[0].lan_id
    ips             = var.ips
    target_lan      = module.lan[1].lan_id
    lb_private_ips  = var.lb_private_ips
}


module "server" {
    count           = 2
    source          = "./server"
    datacenter_id   = data.ionoscloud_datacenter.dev_talks.id
    name            = (count.index == 0 ? format("%sServer1", var.name): format("%sServer2", var.name))
    cpu_family      = var.cpu_family
    lan             = module.lan[1].lan_id
    
}