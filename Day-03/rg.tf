resource "azurerm_resource_group" "rg" {
    name = "demo-rg"
    location = "East US"
}
#all the resources will be created inside resource group 