variable "datacenter_id" {
    type = string
    description = "The UUID of the datacenter"
}

variable "server_name" {
    type = string
    description = "The name of the server"
}

variable "volume_name" {
    type = string
    description = "The name of the volume"
}

variable "cpu_family" {
    type = string
    description = "The  cpu_family of the server"
}

variable "lan" {
    type = string
    description = "The id of the LAN"
}


variable "ips" {
    type = list(string)
}

variable "image_name" {
    type = string  
}