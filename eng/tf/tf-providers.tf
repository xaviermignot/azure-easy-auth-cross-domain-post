terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.88.1"
    }

    azuread = {
      source  = "hashicorp/azuread"
      version = "2.12.0"
    }
  }
}

provider "azurerm" {
  features {}
}
