resource "azurerm_network_interface" "nic" {
    name = "demo-nic"
    location = "East US"
    azurerm_resource_group = azurerm_resource_group.rg.name

    ip_configuration {
        name = "ip-config"
        azurerm_subnet = azurerm_subnet.snet.name
        private_ip_address_association = "Dynamic"
        public_ip_address_id = public_ip_address_id.pip.name
    }
}




#Purpose: Connects the VM to subnet and public IP (like AWS ENI).

#ip_configuration: Links subnet + assigns dynamic private IP + connects public IP.

#subnet_id: Subnet to attach this NIC.

#public_ip_address_id: Attaches public IP.