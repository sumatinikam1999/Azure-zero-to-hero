resource "azurerm_network_interface_security_group_association" "nisg" {
    network_interface_id = azurerm_network_interface.nic.id
    network_security_group_id = azurerm_network_security_group.sg.id
}

#Purpose: Attaches a security group (NSG) to the NIC.

#Like AWS: attach security group to an ENI.