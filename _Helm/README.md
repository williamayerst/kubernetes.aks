# Helm in AKS

Helm needs permissions created before it is initialised on the cluster. Run `kubectl apply -f .\rbac-config.yml` to create the clusterrole and the service acccount.

Once this has been created, initialise Helm with `helm init --service-account=tiller`

# WARNING!

if you don't do this, it will require much further troubleshooting - simply running `helm reset` or `helm init --upgrade --service-account=tiller` does not appear to work, neither does `kubectl edit deploy tiller-deploy --namespace=kube-system` to manually specify the service account under `spec.template.spec`.

There are more specific permissioning rules here: `https://github.com/Azure/draft/blob/master/docs/install-cloud.md`
