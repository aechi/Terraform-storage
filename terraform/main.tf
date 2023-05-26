data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}
 
 
resource "azurerm_service_plan" "example" {
  name                = "app-service-plan2023"
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = var.location
  os_type             = "Linux"
  sku_name            = "F1"
}
 
resource "azurerm_linux_web_app" "example" {
  name                = var.azurerm_linux_function_app_name
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = var.location
  service_plan_id            = azurerm_service_plan.example.id

    site_config { 
    always_on               = false
    application_stack {
      java_version           = "11"      
    }
  }
}