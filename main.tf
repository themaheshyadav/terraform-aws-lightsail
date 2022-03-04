resource "aws_lightsail_instance" "mahesh" {
  count = var.enabled ? 1:0
  name              = var.name
  availability_zone = var.availability_zone
  blueprint_id      = var.blueprint_id
  bundle_id         = var.bundle_id
  key_pair_name     = var.key_pair_name
  tags              = var.tags
}


resource "aws_lightsail_key_pair" "lightsail-key" {
  count = var.enabled ? 1:0
  name = var.key_pair_name
  public_key = var.public_key
}

resource "aws_lightsail_static_ip" "testip" {
  count =  var.enabled && var.ip_enabled ? 1:0
  name = "example"
}

resource "aws_lightsail_static_ip_attachment" "test" {
  count = var.ip_enabled ? 1:0
  static_ip_name = join("", aws_lightsail_static_ip.testip.*.id)
  instance_name  = join("", aws_lightsail_instance.mahesh.*.id)
}

resource "aws_lightsail_instance_public_ports" "testport" {
  instance_name = join("", aws_lightsail_instance.mahesh.*.id)

  dynamic "port_info" {
    for_each = var.port_info == null ? [] : var.port_info
    content {
      protocol  = port_info.value.protocol
      from_port = port_info.value.port
      to_port   = port_info.value.port
      cidrs     = port_info.value.cidrs
    }
  }
}