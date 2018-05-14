# kubernetes.aks

Kubernetes via Azure Container Service Testing and Notes

## Prerequisites

There are a number of components to a successful large scale deployment of AKS, this section will cover the prerequisites

### Local Applications

The following applications should be installed locally.

* azure-cli
* kubectl 
* kubectx
* terraform
* helm
* draft (potentially)

### Permissions

The platform engineers who are responsible for this deployment should have at least the following permissions:

* To install local apps (see above) and manage their local hostfile
* To define and configure DNS A records, SSL certs
* To create an Application SPN in Azure AD and grant that SPN permissions to the subscription (or have it done for you)


## Gotchas
AKS will have RBAC enabled by default - this means that any failures from Helm charts or deployments should be investigated first in the context of authorisation. Specifically, `helm` requires either a service account created ahead of time, or to specify the usage of `default` - and `traefik` must be deployed after one has created a `cluster-admin` role, for the deployment's `rbac.enabled=true` setting to function properly.

Additionally, `HEAPSTER` will not work properly unless the cluster role binding for the Heapster service account is configured.

`az account set -s $(az account list --query "[0].id")`
