#Module      : LABEL
#Description : Terraform label module variables.
variable "environment" {
  type        = string
}

variable "label_order" {
  type        = list(any)
  default     = []
}

variable "delimiter" {
  type        = string
  default     = "-"
}



variable "name" {
  type        = string
  default     = ""
}



variable "attributes" {
  type        = list(any)
  default     = []
}

variable "tags" {
  type        = map(any)
  default     = {}
}

#Module      : Lightsail
#Description : Terraform Lightsail module variables.
variable "availability_zone" {
  type        = string
  default     = "ap-south-1a"
  sensitive   = true
}

variable "blueprint_id" {
  type        = string
  default     = "ubuntu_16_04_2"
  sensitive   = true
}

variable "bundle_id" {
  type        = string
  default     = "micro_2_1"
  sensitive   = true
}


variable "use_default_key_pair" {
  type        = bool
  default     = true
}

variable "user_data" {
  type        = string
  default     = ""
  sensitive   = true
}

variable "create_static_ip" {
  type        = bool
  default     = false
  sensitive   = true
}

variable "lightsail_enabled" {
  type        = bool
  default     = true
}

variable "key_pair_name" {
  type        = string
  default     = ""
  sensitive   = true
}

variable "instance_count" {
  type        = number
  default     = 1
}

variable "instance_enabled" {
  type        = bool
  default     = true
}

variable "pgp_key" {
  default     = null
  sensitive   = true
}

variable "public_key" {
  type        = string
  default     = ""
  sensitive   = true
}

variable "key_path" {
  type        = string
  default     = ""
  sensitive   = true
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