resource "aws_lightsail_instance" "instance" {
  count = var.instance_enabled ? var.instance_count : 0

  name              = var.name
  availability_zone = var.availability_zone
  blueprint_id      = var.blueprint_id
  bundle_id         = var.bundle_id
  key_pair_name     = var.key_pair_name
  depends_on        = [aws_lightsail_key_pair.instance]
  tags = var.tags
}

resource "aws_lightsail_key_pair" "instance" {
  count      = var.instance_enabled ? 1 : 0
  name       = var.key_pair_name
  public_key = var.public_key
}
resource "aws_lightsail_instance_public_ports" "main" {
  instance_name = join("", aws_lightsail_instance.instance.*.name)
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