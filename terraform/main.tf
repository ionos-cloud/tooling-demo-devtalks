module "datacenter" {
    source          = "./vdc"
    location        = var.location
}

module "lan" {
    count           = 2
    source          = "./network/lan"
    datacenter_id   = module.datacenter.datacenter_id
    name            = format("lan%s%s", count.index+1, var.name)
    public          = (count.index == 0 ? true: false)
}

module "ip_block" {
    source          = "./network/ip_block"
    location        = var.location
}

module "server" {
    count           = 2
    source          = "./compute"
    datacenter_id   = module.datacenter.datacenter_id
    server_name     = format("ws%s", count.index+1)
    cpu_family      = var.cpu_family
    image_name      = (count.index == 0 ? var.snapshot1 : var.snapshot2)
    volume_name     = format("hdd%s", count.index+1)
    lan     = module.lan[1].lan_id
    ips     = (count.index == 0 ? var.server_private_ips_1: var.server_private_ips_2)
  }

module "alb" {
    source          = "./alb"
    datacenter_id   = module.datacenter.datacenter_id
    listener_lan    = module.lan[0].lan_id
    ips             = [module.ip_block.ips[0]]
    target_lan      = module.lan[1].lan_id
    lb_private_ips  = var.lb_private_ips
    target_ip1      = module.server[0].server_private_ip
    target_ip2      = module.server[1].server_private_ip
}

output "alb_connection_ip" {
    value = module.ip_block.ips[0]
}