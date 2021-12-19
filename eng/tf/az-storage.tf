resource "azurerm_storage_account" "app" {
  name                = "stor${replace(local.suffix, "-", "")}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location

  account_replication_type  = "LRS"
  account_tier              = "Standard"
  allow_blob_public_access  = true
  enable_https_traffic_only = false

  static_website {
    index_document = "index.html"
  }
}
