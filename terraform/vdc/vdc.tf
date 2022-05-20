resource "ionoscloud_datacenter"  "dev_talks" {
  name			= "DevTalksTerraform"
  location		= var.location
  description	= "Datacenter for Dev Talks Demo"
}