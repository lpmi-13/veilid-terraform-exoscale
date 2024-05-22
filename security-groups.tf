resource "exoscale_security_group" "veilid-access" {
  name        = "veilid-access"
  description = "allow ssh access and inbound tcp/udp on 5150"
}

resource "exoscale_security_group_rule" "ssh_ipv4" {
  security_group_id = exoscale_security_group.veilid-access.id
  description       = "SSH (IPv4)"
  type              = "INGRESS"
  protocol          = "TCP"
  start_port        = 22
  end_port          = 22
  cidr              = "0.0.0.0/0"
}

resource "exoscale_security_group_rule" "ssh_ipv6" {
  security_group_id = exoscale_security_group.veilid-access.id
  description       = "SSH (IPv6)"
  type              = "INGRESS"
  protocol          = "TCP"
  start_port        = 22
  end_port          = 22
  cidr              = "::/0"
}


resource "exoscale_security_group_rule" "tcp_5150_ipv4" {
  security_group_id = exoscale_security_group.veilid-access.id
  description       = "tcp inbound 5150 (IPv4)"
  type              = "INGRESS"
  protocol          = "TCP"
  start_port        = 5150
  end_port          = 5150
  cidr              = "0.0.0.0/0"
}

resource "exoscale_security_group_rule" "tcp_5150_ipv6" {
  security_group_id = exoscale_security_group.veilid-access.id
  description       = "tcp inbound 5150 (IPv6)"
  type              = "INGRESS"
  protocol          = "TCP"
  start_port        = 5150
  end_port          = 5150
  cidr              = "::/0"
}

resource "exoscale_security_group_rule" "udp_5150_ipv4" {
  security_group_id = exoscale_security_group.veilid-access.id
  description       = "udp inbound 5150 (IPv4)"
  type              = "INGRESS"
  protocol          = "UDP"
  start_port        = 5150
  end_port          = 5150
  cidr              = "0.0.0.0/0"
}

resource "exoscale_security_group_rule" "udp_5150_ipv6" {
  security_group_id = exoscale_security_group.veilid-access.id
  description       = "udp inbound 5150 (IPv6)"
  type              = "INGRESS"
  protocol          = "UDP"
  start_port        = 5150
  end_port          = 5150
  cidr              = "::/0"
}
