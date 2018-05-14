# Traefik

Traefik is a modern reverse proxy. Within the context of Kubernetes it is deployed as an Ingress controller.

## AKS Deployment

This document will show the process to deploy a L7 loadbalanced reverse proxy to an AKS cluster. See documentation for more information: `https://docs.traefik.io/user-guide/kubernetes/`

### Prerequisites

Helm and Tiller must be installed, if the `default` service account is not specified in `helm init` then run `.\helm\rbac-config.yml` ahead of time to ensure that the correct RBAC account, clusterrole and clusterrole binding exist.

If this is not in place, most things will still work but helm will not be able to create subsequent clusterroles, which is a prerequisite for the `rbac.enabled=true` flag, which must be set when running Traefik on Azure AKS.

### Deploying

Traefik can be deployed via helm using `helm install --name traefik-test stable/traefik --namespace kube-system --set dashboard.enabled=true --set rbac.enabled=true` 

*Ensure that the dashboard and RBAC is enabled in a values.yaml file, or via the command line deployment of the service (see above)*

### Testing

Using the default command in Deploying, you will have a dashboard set up by the helm deployment on `traefik.example.com`, update your local hostfile to point to this URL and navigate on port 80 and you should see a dashboard. The left column shows configured sites and rules, and the right column shows each server participating in that site config. If you can't see any servers in the right column, that's a red flag! 

If you can't access the dashboard at all - verify your service account (matching the name of the helm release) exists

### Example Usage

Run the files in `./cheese/` in sequence:
* `cheese-deployments.yml` - the pods
* `cheese-services.yml`- the services
* `cheese-ing.yml` - the ingress configuration. *Note: you must have already deploy an ingress controller (i.e. Traefik) for this to function - it is a configuration that is parsed by pods that act as ingress controllers, rather than a discrete process object itself. Also, note the hosts that are exposed in the ing file; this is what Traefik will be expecting in the HTTP headers to route the traffic properly. 

### Troubleshooting

You can use `kubctl port-forward <POD NAME> <PORT>:80` where <POD NAME> is the name of one of your pods, to access that pod via a tunnel from localhost. Use this to validate if the pods themselves are healthy.
