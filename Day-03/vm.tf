 resource "azurerm_windows_virtual_machine" "vm" {
    name = "wvm"
    location = "East US"
    resource_group_name = azurerm_resource_group_name.rg.name
    size = "Standard_B1s"
    network_interface_ids = [azurerm_network_interface.nic.name]
 }

 os_disk {
    name = "os-disk"
    storage_account_type = "Standard_LRS"
    caching = "ReadWrite"
 }

 source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer = "WindowsServer"
    sku = "2019-Datacenter"
    version = "latest"
 }