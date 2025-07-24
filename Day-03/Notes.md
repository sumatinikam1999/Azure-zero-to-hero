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






-------------



🔹 What is a Network Interface (NIC)?
A Network Interface is like a network cable that connects a computer (or Virtual Machine in the cloud) to a network.

In Azure, a NIC (Network Interface Card) is the virtual version of that cable. It helps the VM:

Get an IP address

Connect to a subnet

Use firewall rules (through NSG – Network Security Group)

Send and receive data over the network

🔹 Why is it needed in Azure?
Azure requires each Virtual Machine to have at least one NIC. Why?

Because:

NICs are separate resources: You can create or change them without touching the VM.

One VM can have more than one NIC (for advanced networking).

NICs make it easy to manage networking rules, IP addresses, and connections.

🧠 Simple Example:
Imagine a virtual office computer (VM). To connect it to the internet or other devices, you need a network cable (NIC).

Without the NIC, the computer is just sitting there — it can’t talk to anyone.

So, Azure makes it mandatory to attach a NIC when you create a VM.



In AWS, the reason you don't explicitly create a Network Interface (NIC) when setting up a VM (called an EC2 instance in AWS) is due to how the AWS networking model works, which is a bit more integrated and automatic compared to Azure. Let's break it down:

1. AWS Default Setup:
When you launch an EC2 instance in AWS, it automatically gets a primary network interface (eth0). You don't need to manually create or attach it. This network interface is automatically:

Assigned an IP address (private and public, if needed)

Associated with a subnet in your VPC (Virtual Private Cloud)

Handled by AWS itself for routing traffic in/out of your EC2 instance

2. No Need for Manual NIC Creation:
In AWS, the networking component (NIC) is automatically attached to the EC2 instance when you create it, and you don't need to separately manage it unless you need special setups, like multiple interfaces (multi-homing) or advanced networking.

For example:

When you launch a VM in AWS (EC2), it gets the NIC behind the scenes, and it just "works."

In Azure, you must explicitly create and manage the NIC, because it's more modular and separate from the VM itself.

3. Flexibility in AWS:
If you need additional NICs for special cases (like connecting to multiple networks), you can attach more ENIs (Elastic Network Interfaces) to your EC2 instance.

This is similar to Azure where you can have multiple NICs, but the default setup in AWS is simpler because it automatically handles the first NIC.

🔑 Key Difference:
Azure: NIC is a separate, modular resource that you need to create and manage.

AWS: EC2 instances automatically get a NIC when launched, but you can attach additional ENIs if needed.


In Azure, you need to define the OS disk explicitly as a separate resource because Azure has a modular design, allowing more detailed configuration for storage and networking components.
