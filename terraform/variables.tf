variable "name" {
    type = string
    description = "The name of the datacenter"
}

### vdc
variable "location" {
    type = string
    description = "The location of the LAN"
}

# variable "datacenter_description" {
#     type = string
#     description = "The description of the datacenter"
# }

### network

variable "lan_public" {
    type = bool
}

### alb 
variable "ips" {
    type = list(string) 
    description = "ID of the listening (inbound) LAN"
}

variable "lb_private_ips" {
    type = list(string) 
}