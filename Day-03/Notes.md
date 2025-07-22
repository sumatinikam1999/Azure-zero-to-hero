- A resource is an instance of service

- user request via jira to create vm to devops

- create vm -> add details -> create ---->> Azure Resource Manager ---> Resource(linux vm). 

- reply back to user

- VM service we using to create VM resource


GUI
CLI
API

- resources manager: responsible for creating resources

## Mandatory Things
- Resource Group: grouping of resources(vm+db or anything or combination of resources)
- why and how to combine resources 
- why -> because it is mandatory in azure, if you group means you can track courses of particular projects, allow you to manage the access, removing access, maintaing security standards
- payment transaction UI --> devops --> each people request resources -> access permission security monitoring cost auditing

- track as per project and enviornment
- payment : dev qa prod
- we create resource group per environment
- grouping of resources can be done as per organizational standards
- resource and resource group : 1:1
- one resource can go in one resource group only

#Subscription: 

🔹 What is a Network Interface?
- A Network Interface (short form: NIC) is a virtual representation of a network adapter that connects your Virtual Machine (VM) to the network — it handles:

- IP addressing (private/public)

- Subnet association

- NSG (Network Security Group) attachment

** Routing traffic in/out of the VM
🔹 Why is it required in Azure?
- In Azure, a VM must be attached to a NIC — it’s a strict design decision. This is because:

- Azure follows a modular networking design: Network Interfaces are separate, reusable components.

- You can create/update/manage the NIC separately without touching the VM.

- One VM can have multiple NICs (multi-homing), each connected to different subnets/VNETs.

- This modularity allows flexibility but requires explicitly creating a NIC.

🔹 What do we use in AWS instead?
- In AWS, networking is a bit more abstracted.

- You don’t create a separate network interface manually most of the time — when you create an EC2 instance, you define:

- Subnet

- Security Group

- Public IP

## All of these are attached directly to the EC2 instance, and AWS automatically creates an ENI (Elastic Network Interface) in the background.

- However, if needed, AWS also allows you to create/manage ENIs separately:

```
resource "aws_network_interface" "nic" {
  subnet_id   = aws_subnet.example.id
  private_ips = ["10.0.0.50"]
}
```

## So, in Azure you must create a NIC, because it is the bridge between VM and network. It gives you more control, but requires more code.