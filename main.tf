terraform {
  required_version = ">= 1.5.0"

  required_providers {
    exoscale = {
      source  = "exoscale/exoscale"
      version = ">= 0.59"
    }
  }
}

locals {
  number_of_instances = 1
  zone                = "ch-dk-2" # Zurich
  # "at-vie-1" # Vienna-1
  # "at-vie-2" # Vienna-2
  # "bg-sof-1" # Sofia
  # "ch-gva-2" # Geneva
  # "de-fra-1" # Frankfurt
  # "de-muc-1" # Munich
}

data "exoscale_template" "veilid-template" {
  zone = local.zone
  name = "Linux Ubuntu 22.04 LTS 64-bit"
}

resource "exoscale_compute_instance" "veilid-instance" {
  count = local.number_of_instances
  zone  = local.zone
  name  = "veilid"

  template_id = data.exoscale_template.veilid-template.id
  type        = "standard.micro"
  disk_size   = 10

  private = false

  ipv6 = true

  user_data = file("./setup-veilid.yaml")
  ssh_key   = exoscale_ssh_key.veilid-key.id

  security_group_ids = [exoscale_security_group.veilid-access.id]
}

resource "exoscale_ssh_key" "veilid-key" {
  name       = "veilid-key"
  public_key = "PASTE CONTENTS OF PUBLIC KEY HERE"
}
