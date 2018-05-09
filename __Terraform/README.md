#Terraform for AKS

I have found that using the default minimum (Standard_A0) agent size, the AKS agents will just never install - after an hour I terminated the job. To remedy this I have gone with the Azure standard recommendation for agent size, and will work backwards from that.

After this has been deployed you can manually add the client-certificate-data, client-key-data and token to your kube config, or run `az aks get-credentials -g GROUP -n CLUSTER`
