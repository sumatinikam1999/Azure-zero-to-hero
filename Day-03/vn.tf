resource "azurerm_virtual_network" "vnet" {
    name = "demo-vnet"
    location = "East US"
    address_space = ["10.0.0.0/16"]
    resource_group_name = azurerm_resource_group.rg.name
}