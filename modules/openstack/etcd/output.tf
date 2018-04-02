output "user_data" {
  value = "${data.ignition_config.etcd.*.rendered}"
}

locals {
  k8s_endpoint_address_format = "{ip: %s, nodeName: %s}"
}

output "k8s_endpoint_addresses" {
  value = "[${join(", ",
    formatlist(local.k8s_endpoint_address_format,
    var.etcd_ip_addresses,
    var.etcd_ip_addresses))}]"
}
