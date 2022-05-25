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

variable "server_private_ips_1"{
    type = list(string)
}


variable "server_private_ips_2"{
    type = list(string)
}


### server

variable "cpu_family" {
    type = string
}

variable "snapshot1" {
    type = string
}

variable "snapshot2" {
    type = string
}

# variable "image" {
#     type = string
# }

### alb 
variable "lb_private_ips" {
    type = list(string) 
}


