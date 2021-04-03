# Kubernetes practice with Kind

> Work in progress

[kind](https://kind.sigs.k8s.io) is a tool for running local Kubernetes clusters using Docker container “nodes”.   
The app used to deploy is https://github.com/paulbouwer/hello-kubernetes.

## Requirements
* golang 1.15+
* kubectl (to install check https://kubernetes.io/docs/tasks/tools/#kubectl)
* docker 20+
* kind (to install use https://kind.sigs.k8s.io/docs/user/quick-start/#installation)

## How to use - with Metal LB

[MetalLB](https://metallb.universe.tf) is a load-balancer implementation for bare metal Kubernetes clusters.

> Before setup the cluster, it's necessary change the IP range at `config/metallb-configmap.yaml`, to do that follow this guide: https://kind.sigs.k8s.io/docs/user/loadbalancer/#setup-address-pool-used-by-loadbalancers

To setup the cluster:   
`make setup-cluster-metalb`

To deploy the app:   
`make deploy-app-lb`

## How to use - with Nginx Ingress
[Ingress Nginx](https://kubernetes.github.io/ingress-nginx/)

To setup the cluster:   
`make setup-cluster-ingress`

To deploy the app:   
`make deploy-app-lb`

To access the app go to the browser and access `http://localhost/`

## TODO
 - [ ] Add the option to install kind and requirements using make
 - [ ] Add the option to create a cluster with HA (now it's just a control plane action as a worker)
 
## Getting help

To see all available commands, use `make help`
