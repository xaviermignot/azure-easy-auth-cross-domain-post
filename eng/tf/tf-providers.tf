terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.89.0"
    }

    azuread = {
      source  = "hashicorp/azuread"
      version = "2.12.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "3.1.0"
    }
  }
}

provider "azurerm" {
  features {}
}
