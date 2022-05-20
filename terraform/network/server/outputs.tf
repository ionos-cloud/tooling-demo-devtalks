output "server_id" {
    value = ionoscloud_server.server.id
}

output "server_private_ip" {
    value = ionoscloud_server.server.nic[0].ips[0]
}