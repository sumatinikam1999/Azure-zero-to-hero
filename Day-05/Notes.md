both people requests vm in same region and both vms got created in same data center but it's big security reason
if some reason one vm got hacked then another also can get hacked


VNET
restricted for particular vm none can access

size of vnet
cidr - 16 - 65536
logically splitting of ip's: subnet

logical separation - multiple subparts
on each part we can apply security

NSG: we can create this for subnet or instance


ASG enhances or increased capability of NSG

NSG+ASG

grouping app instances in ASG and can access particular NSG or CIDR


route tables
user defined routes


