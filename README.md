# 🐳 Kubernetes labs with Kind

> Work in progress

[kind](https://kind.sigs.k8s.io) is a tool for running local Kubernetes clusters using Docker container “nodes”.   
The app used to deploy is https://github.com/paulbouwer/hello-kubernetes.

## Requirements
* golang 1.15+
* kubectl (to install check https://kubernetes.io/docs/tasks/tools/#kubectl)
* docker 20+
* kind (to install use https://kind.sigs.k8s.io/docs/user/quick-start/#installation)

## How to use - with Metal LB ¹

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

Before deploy the app, it's necessary wait while the ingress is ready:
```
kubectl wait --namespace ingress-nginx \
  --for=condition=ready pod \
  --selector=app.kubernetes.io/component=controller \
  --timeout=90s
```

To deploy the app:   
`make deploy-app-lb`

To access the app go to the browser and access `http://localhost/`

 ## Interacting with the cluster
 A complete list with `kubectl` commands that you can use to interact with the cluster, you can see https://kubernetes.io/docs/reference/kubectl/cheatsheet/

## 🔥 Destroying the clusters
To destroy the cluster:
`make delete-cluster`

## Getting help

To see all available commands, use `make help`

## TODO
 - [ ] Add the option to install kind and requirements using make
 - [ ] Add the option to create a cluster with HA (now it's just a control plane acting as a worker)
 
 
## References
* https://kind.sigs.k8s.io/docs/user/quick-start/
* https://kind.sigs.k8s.io/docs/user/loadbalancer/
* https://kind.sigs.k8s.io/docs/user/ingress/

 ¹: Untested at this moment because doesn't work with Docker for Mac :(
