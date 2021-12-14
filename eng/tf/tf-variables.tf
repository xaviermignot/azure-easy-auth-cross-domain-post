variable "location" {
  type        = string
  description = "the location to use for all resources"
}

variable "dns_zone_name" {
  type        = string
  description = "the name of the dns zone"
}

variable "dns_zone_rg_name" {
  type        = string
  description = "the resource group name of the dns zone"
}
