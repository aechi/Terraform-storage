terraform {
  backend "azurerm" {
  }
}

provider "azurerm" {
  # Configuration options
  skip_provider_registration = "true"
  subscription_id = "97c37559-6638-46e2-9ef5-451dd20445e0"
  tenant_id = "c6537e5c-aa83-4924-886b-877ad74ea895"
  client_id = "d2313b26-81e7-44aa-ab80-89c87e6f649f"
  client_secret = "XXXX"
features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "resourcegroup-test-tbd-3"
  location = "westeurope"
}
