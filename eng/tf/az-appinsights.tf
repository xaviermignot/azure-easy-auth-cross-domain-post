resource "azurerm_application_insights" "ai" {
  name                = "ai-${local.suffix}"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name

  application_type = "web"
}
