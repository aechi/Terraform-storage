terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.57.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
  skip_provider_registration = "true"
  subscription_id = "97c37559-6638-46e2-9ef5-451dd20445e0"
  tenant_id = "c6537e5c-aa83-4924-886b-877ad74ea895"
  client_id = "d2313b26-81e7-44aa-ab80-89c87e6f649f"
  client_secret = "A8T8Q~NjM_FtPeeor1jPMu6e14~qGzzBKwMPkbHj"
features {}
}


# Create the resource group
resource "azurerm_resource_group" "rg" {
  name     = "devops-training-rg"
  location = "West Europe"
}

# Create the Linux App Service Plan
resource "azurerm_service_plan" "appserviceplan" {
  name                = "webapp-asp-assessment"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  os_type             = "Linux"
  sku_name            = "F1"
}

# Create the web app, pass in the App Service Plan ID
resource "azurerm_linux_web_app" "webapp" {
  name                  = "webapp-java-assessment"
  location              = azurerm_resource_group.rg.location
  resource_group_name   = azurerm_resource_group.rg.name
  service_plan_id       = azurerm_service_plan.appserviceplan.id
  https_only            = true
  site_config { 
    always_on               = false
    application_stack {
      java_version           = "11"      
    }
  }
}