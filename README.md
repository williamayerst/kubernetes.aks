# kubernetes.aks

Kubernetes via Azure Container Service Testing and Notes

## Gotchas
AKS will have RBAC enabled by default - this means that any failures from Helm charts or deployments should be investigated first in the context of authorisation. Specifically, `helm` requires either a service account created ahead of time, or to specify the usage of `default` - and `traefik` must be deployed after one has created a `cluster-admin` role, for the deployment's `rbac.enabled=true` setting to function properly.


`az account set -s $(az account list --query "[0].id")`