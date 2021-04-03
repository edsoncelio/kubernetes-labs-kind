# Kubernetes practice with Kind

> Work in progress

[kind](https://kind.sigs.k8s.io) is a tool for running local Kubernetes clusters using Docker container “nodes”.   
The app used to deploy is https://github.com/paulbouwer/hello-kubernetes.

## Requirements
* golang 1.15+
* kubectl (to install check https://kubernetes.io/docs/tasks/tools/#kubectl)
* docker 20+

## How to use - with Metal LB

[MetalLB](https://metallb.universe.tf) is a load-balancer implementation for bare metal Kubernetes clusters.

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

To access the app go to the browser and access `http://localhost`

## Getting help

To see all the available commands, use `make help`
