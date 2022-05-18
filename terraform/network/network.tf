resource "ionoscloud_lan"  "lan" {
  datacenter_id 	= var.datacenter_id
  name          	= var.name
  public        	= false
}

