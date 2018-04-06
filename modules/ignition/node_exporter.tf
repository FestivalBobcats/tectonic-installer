data "ignition_systemd_unit" "node_exporter" {
  name    = "node-exporter.service"
  enabled = true

  dropin = [
    {
      name    = "50-node-exporter.conf"
      content = "${file("${path.module}/resources/dropins/50-node-exporter.conf")}"
    },
  ]
}
