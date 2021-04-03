# Makefile based on https://github.com/globocom/gitlab-ci-monitor/blob/master/Makefile
.SILENT:
.DEFAULT_GOAL=help

COLOR_RESET = \033[0m
COLOR_GREEN = \033[32m
COLOR_YELLOW = \033[33m

PROJECT_NAME = `basename $(PWD)`
CLUSTER_NAME = "kind-cluster"
## prints this help
help:
	printf "${COLOR_YELLOW}\n${PROJECT_NAME}\n\n${COLOR_RESET}"
	awk '/^[a-zA-Z\-\_0-9\.%]+:/ { \
		helpMessage = match(lastLine, /^## (.*)/); \
		if (helpMessage) { \
			helpCommand = substr($$1, 0, index($$1, ":")); \
			helpMessage = substr(lastLine, RSTART + 3, RLENGTH); \
			printf "${COLOR_GREEN}$$ make %s${COLOR_RESET} %s\n", helpCommand, helpMessage; \
		} \
	} \
	{ lastLine = $$0 }' $(MAKEFILE_LIST)
	printf "\n"

# Cluster configs

## Create and configure kind cluster with MetalLB
setup-cluster-metalb:
	kind create cluster --name ${CLUSTER_NAME}
	kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/master/manifests/namespace.yaml
	kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)" 
	kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/master/manifests/metallb.yaml
	kubectl apply -f config/metalb/metallb-configmap.yaml

## Create and configure kind cluster with Nginx Ingress
setup-cluster-ingress:
	kind create cluster --name ${CLUSTER_NAME} --config=config/kind-ingress-config.yaml
	kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/static/provider/kind/deploy.yaml

## Delete the kind cluster
delete-cluster:
	kind delete cluster --name kind-cluster
	
# Apps config

## Deploy sample app Hello Kubernetes using Metal LB
deploy-app-lb:
	kubectl apply -f ./manifests/hello-kubernetes-lb/

## Deploy sample app Hello Kubernetes using Nginx Ingress
deploy-app-ingress:
	kubectl create namespace hello-kubernetes
	kubectl apply -f ./manifests/hello-kubernetes-ingress/

## Show all the resources created to the app
check-app:
	kubectl get all -n hello-kubernetes

## Delete the namespace with all resources created
delete-app:
	kubectl delete namespace hello-kubernetes
