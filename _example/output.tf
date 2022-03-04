output "instance_blueprint_id" {
  value = join("", module.lightsail.*.instance_blueprint_id)
}
output "keypair_id" {
  value = join("", module.lightsail.*.keypair_id)
}