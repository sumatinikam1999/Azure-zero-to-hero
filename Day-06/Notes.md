VNET

The request has to go to instance 1 or 2 those path were system routes and where the system routes paths are stored that is route tables

extra subnet - app-gateway in that load balancer is placed - LB decides where the request has to go - L7 LB


app gateway used for L7 traffic
forward traffic to http  sumati.com/login frontend

load balancer used for L4 traffic - it will forward request to backend login app it won't look for path url http because you arelady entered from it through L7 - app LB or azure LB