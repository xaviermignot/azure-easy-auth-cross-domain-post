resource "azurerm_app_service_plan" "plan" {
  name                = "plan-${local.suffix}"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name

  kind     = "Linux"
  reserved = true

  sku {
    tier = "Basic"
    size = "B1"
  }
}

resource "azurerm_app_service" "api" {
  name                = "web-${local.suffix}"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_app_service_plan.plan.id

  site_config {
    dotnet_framework_version = "v6.0"
    linux_fx_version         = "DOTNETCORE|6.0"
  }

  app_settings = {
    "APPINSIGHTS_INSTRUMENTATIONKEY" = azurerm_application_insights.ai.instrumentation_key
  }
}

resource "azurerm_app_service_custom_hostname_binding" "api" {
  hostname            = "${azurerm_dns_cname_record.api.name}.${var.dns_zone_name}"
  app_service_name    = azurerm_app_service.api.name
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_app_service_managed_certificate" "api" {
  custom_hostname_binding_id = azurerm_app_service_custom_hostname_binding.api.id
}

resource "azurerm_app_service_certificate_binding" "api" {
  hostname_binding_id = azurerm_app_service_custom_hostname_binding.api.id
  certificate_id      = azurerm_app_service_managed_certificate.api.id
  ssl_state           = "SniEnabled"
}
