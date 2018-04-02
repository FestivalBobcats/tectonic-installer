output "user_data" {
  value = "${data.ignition_config.etcd.*.rendered}"
}

locals {
  k8s_endpoint_address_format = "{ip: %s, nodeName: %s}"
}

output "k8s_endpoint_addresses" {
  value = "[${join(", ",
    formatlist(local.k8s_endpoint_address_format,
    module.etcd.ip_addresses,
    module.etcd.ip_addresses))}]"
}
