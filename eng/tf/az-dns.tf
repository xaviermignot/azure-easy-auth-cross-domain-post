data "azurerm_dns_zone" "dns" {
  name                = var.dns_zone_name
  resource_group_name = var.dns_zone_rg_name
}

resource "azurerm_dns_cname_record" "api" {
  name                = "${local.suffix}-api"
  zone_name           = var.dns_zone_name
  resource_group_name = var.dns_zone_rg_name

  ttl    = 300
  record = azurerm_app_service.api.default_site_hostname
}

resource "azurerm_dns_txt_record" "api" {
  name                = "asuid.${local.suffix}-api"
  zone_name           = var.dns_zone_name
  resource_group_name = var.dns_zone_rg_name

  ttl = 300

  record {
    value = azurerm_app_service.api.custom_domain_verification_id
  }
}
