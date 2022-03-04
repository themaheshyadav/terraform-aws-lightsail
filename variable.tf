variable "availability_zone" {
  type = string
  default = "eu-west-1a"
}
variable "name" {
  type = string
  default = ""
}
variable "blueprint_id" {
  type = string
  default = ""
}
variable "bundle_id" {
  type = string
  default = ""
}
variable "key_pair_name" {
  type = string
  default = ""
}
variable "tags" {
  type = map(any)
  default = {}
}

variable "public_key" {
  type = string
  default = ""
}
variable "enabled" {
  type = bool
  default = false
}

variable "public_key_name" {
  default =  ""
}
variable "port_info" {
  type = list(object({
    protocol  = string
    port = number
    cidrs = list(string)
  }))
  default = null
}
variable "ip_enabled" {
  type = bool
  default = false
}


