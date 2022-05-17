data "ionoscloud_datacenter" "dev_talks" {
    name            = format("%sDatacenter", var.name)
    location        = var.location
}

module "lan1" {
    source          = "./network"
    datacenter_id   = data.ionoscloud_datacenter.dev_talks.id
    name            = format("%sLan1", var.name)
    public          = var.lan_public
}


module "lan2" {
    source          = "./network"
    datacenter_id   = data.ionoscloud_datacenter.dev_talks.id
    name            = format("%sLan2", var.name)
    public          = var.lan_public
}

data "ionoscloud_lan" "lan1" {
    depends_on = [
      module.lan1
    ]
    datacenter_id   = data.ionoscloud_datacenter.dev_talks.id
    name            = format("%sLan1", var.name)
}

data "ionoscloud_lan" "lan2" {
    depends_on = [
      module.lan2
    ]
    datacenter_id   = data.ionoscloud_datacenter.dev_talks.id
    name            = format("%sLan2", var.name)
}

module "alb" {
    depends_on = [
      module.lan1,
      module.lan2
    ]
    source          = "./alb/alb"
    datacenter_id   = data.ionoscloud_datacenter.dev_talks.id
    name            = format("%sAlb", var.name)
    listener_lan    = data.ionoscloud_lan.lan1.id
    ips             = var.ips
    target_lan      = data.ionoscloud_lan.lan2.id
    lb_private_ips  = var.lb_private_ips
}