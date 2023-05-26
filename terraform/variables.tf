variable "environment" {
  type = string
}
 
variable "resource_group_name" {
  type = string
}
 
variable "location" {
  type = string
  default = "westeurope"
}
 
variable "functionapp_storage_account_name" {
  type = string
}
 
variable "azurerm_linux_function_app_name" {
  type = string
}