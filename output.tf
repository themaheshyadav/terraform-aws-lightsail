output "keypair_id" {
  value = join("", aws_lightsail_key_pair.lightsail-key.*.id)
}
output "keypair_arn" {
  value = join("", aws_lightsail_key_pair.lightsail-key.*.arn)
}
output "instance_name" {
  value = join("", aws_lightsail_instance.mahesh.*.name)
}
output "instance_blueprint_id" {
  value = join("", aws_lightsail_instance.mahesh.*.blueprint_id)
}
#output "instance_tags" {
#  value = join("", aws_lightsail_instance.mahesh.*.tags)
#}