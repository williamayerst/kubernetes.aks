#Terraform for AKS

Terraform is a streamlined deployment tool for multiple platforms. It is utilised here to stand up an AKS cluster in Azure. Please refer to the `var.tf` file for specific configuration changes. 

## Deploying
There are two secret variables for this deployment, which can be supplied via command line or a var-file. They are as follows:

* cluster_clientid - the cluster's SPN in AzureAD
* cluster_clientsecret - a valid key for the application SPN in AzureAD

These are required in order that the cluster can provision resources dynamically on behalf of kubectl commands. For example, setting 'Loadbalancer' as a service type will spawn a new FrontEnd IP Configuration and Public IP address on the loadbalancer.

The resource group and cluster will be named with a concatenated name of `environment-prefix + service-prefix` + `random_pet`, the latter because there is no good reason to name an ARM object after it's object-type and it provides some individuation.

### Gotchas

The Terraform example deployment uses Standard_A0 VMs, but they do not have time to be fully provisioned before an Az CLI session times out due to inactivity during the deployment process. The Azure standard recommendation is D2_v2, and that works in around 8 minutes.

## Using

After this has been deployed you can manually add the client-certificate-data, client-key-data and token to your kube config, or run `az aks get-credentials -g GROUP -n CLUSTER`.

Use `kubectx` to select your context and/or delete unused contexts.