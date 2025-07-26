First copy github repo url add in Azure devops repo

https://github.com/sumatinikam1999/example-voting-app.git

1. Adding repo to azure devops
- Repos -> File -> Import
- set default branch to main in azure devops

---

2. Create Container Registry
- go to azure console
- search container registry
- create resource group
- create registry

---

3. Create Pipeline
- go to azure devops
- pipelines 
- create pipeline 
- azure repo
- docker build and push
- now it will try to establish connection between azure devops and azure console
- now select container registry
- validate configure

----

4. Modify yaml 
- triggers
- when should pipeline trigger automatically
- (path based triggers: ci-cd pipeline has to trigger when code changes are done to particular path)
```
triggers:
  path: 
    include: 
       - result/*
```
- dockerRegistryServiceConnection: connection between azure devops and azure container registry on azure platform
- change imageregistry name to resultapp

- Stages
- stages like build test push 

- Job
- these are part of stages

- Steps

- variables
- when we want to pass somethings
----

- Agent where entire CI run(no agent for free tier account)

```
pool:
  name: 'azureagent'
```
- separate build and push stage
- remove pool

- select task and click on settings
- command build
- command push

- change docker file path : result/Dockerfile

- save and run you will see name error, because you haven't created agent

5. Create VM
- we can go to azure portal and create vm named azureagent
- this vm acts as agent for CI pipeline
- create virtual machine with name azureagent

6. Integrate VM and pipelin
- how to integrate vm and pipeline
- azure devops pipelines docs
- search for agents and pools
- self hosted linux agents
- go to azure devops
- organizational settings
- project settings
- agent pools
- add pool
- self hosted
- azure agent
- create
- click on the created agent
- agents
- new agent
#### Copy commands and run on Virtual Machine
- copy commands based on your system and run on vm which you created on azure portal
- after runnning config.sh
- enter server url : https://dev/azure.com/organization
- create and enter personal access token
- go to azure devops
- user settings 
- personal access token
- create new access token
- azure agent
- copy token and paste on vm
- enter agent pool name(go to azure devops - project settings - agent pools): azureagent
- enter agent name(go to azure devops - project settings - agent pools - azureagent - agentname): azureagent
- ./config.sh

7. Install docker on VM
- install docker
- sudo apt-get install docker.io -y
- grant azureuser permission to docker
- sudo usermod -aG docker azureuser
- sudo systemctl restart docker
- ./run.sh
- now you can see agent is online
- docker pull hello-world

8. Run pipeline
- go back to azure devops and run pipeline


## try to make changes to pipeline then it will only trigger when you have made changes to specified path in pipeline

