variable "name" {
    type = string
    description = "The name of the datacenter"
}

### vdc
variable "location" {
    type = string
    description = "The location of the LAN"
}

### network

variable "lan_public" {
    type = bool
}

### server

variable "cpu_family" {
    type = string
}

### alb 
variable "ips" {
    type = list(string) 
    description = "ID of the listening (inbound) LAN"
}

variable "lb_private_ips" {
    type = list(string) 
}