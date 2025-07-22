resource "azurerm_public_ip" "pip" {
    name = "public"
    location = "East US"
    azurerm_resource_group = azurerm_resource_group.rg.name
    allocation_method = Dynamic
}

# Dynamic means IP may change if VM is restarted. Use Static if you want fixed IP.