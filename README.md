# Kubernetes practice with Kind

## Requirements
* golang 1.15+
* kubectl
* docker 20+

## Configuring the Cluster

### With Metal LB
To setup the cluster using metal load balance:   
`make setup-cluster-metalb`

### With Nginx Ingress
To setup the cluster using Nginx Ingress:   
`make setup-cluster-ingress`

## Deploying the app

### With cluster using Nginx Ingress
To deploy the app using nginx ingress:   
`make deploy-app-ingress`

### With cluster using Metal LB
To deploy the app using metal load balance:   
`make deploy-app-lb`

To see all the available commands, use `make help`
