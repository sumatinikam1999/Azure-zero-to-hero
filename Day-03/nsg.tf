resource "azurerm_network_security_group" "nsg" {
    name = "netsg"
    location = "East US"
    resource_group_name = azurerm_resource_group_name.rg.name


    security_rule {
        name = "nsg-i"
        priority = 1001
        direction = "Inbound"
        access = "Allow"
        protocol = "Tcp"
        source_port_range = "*" 
        
#We accept traffic from any source port.
#In AWS, you don’t usually define source port ranges.

        destination_port_range = "*"

#RDP uses port 3389.
#In AWS, you'd write this under "port range".

        source_address_prefix = 3389

#"*" means any IP address can connect (not secure for production).
#In AWS, this is like 0.0.0.0/0.

        destination_address_prefix = "*"

#"*" means traffic can go to any IP in this subnet.
#This is usually fine for basic setups.

    }

    security_rule {
        name = "nsg-o"
        priority = 1002
        direction = "Outbound"
        access = "Allow"
        protocol = "*"
        source_port_range = "*"
        destination_port_range = "*'
        source_address_prefix = "*"
        destination_address_prefix = "Internet"
    }
}

#Azure needs priority numbers for rules (lower number = higher priority).

#AWS doesn’t need this – it just allows rules to exist.