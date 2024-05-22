output "public_ip_ipv4" {
  value = [
    for instance in exoscale_compute_instance.veilid-instance : instance.public_ip_address
  ]
}

output "public_ip_ipv6" {
  value = [
    for instance in exoscale_compute_instance.veilid-instance : instance.ipv6_address
  ]
}
