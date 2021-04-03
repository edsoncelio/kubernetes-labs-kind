# Kubernetes practice with Kind
Labs to setup and run a cluster and and app in kubernetes using kind with Metal LB or Nginx Ingress.   
The app used to deploy is https://github.com/paulbouwer/hello-kubernetes.

## Requirements
* golang 1.15+
* kubectl (to install check https://kubernetes.io/docs/tasks/tools/#kubectl)
* docker 20+

## How to use - with Metal LB

To setup the cluster:   
`make setup-cluster-metalb`

To deploy the app:   
`make deploy-app-lb`

## How to use - with Nginx Ingress

To setup the cluster:   
`make setup-cluster-ingress`

To deploy the app:   
`make deploy-app-lb`

To access the app go to the browser and access `http:/localhost`



To see all the available commands, use `make help`
