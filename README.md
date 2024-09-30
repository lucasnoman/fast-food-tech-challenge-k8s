# fast-food-tech-challenge-k8s

Repository containing the K8S manifests (yml) used to build the PostgreSQL database and Node.js backend for the FIAP Fast Food Tech Challenge.

## Getting Started

Set up some project environment variables.

1. Fork the project
2. Go to Settings > Secrets and variables > Actions
3. New repository secret

Create the follow:

- AZURE_CREDENTIALS
- AZURE_SUBSCRIPTION_ID
- POSTGRES_PASSWORD
- POSTGRES_USER

The POSTGRES_PASSWORD and POSTGRES_USER should be created by the owner, but the azure AZURE_SUBSCRIPTION_ID is your subscription of choice to run the AKS. And AZURE_CREDENTIALS should be created using this command:

```zsh
az ad sp create-for-rbac --name "myApp" --role contributor \
                         --scopes /subscriptions/{subscription-id}/resourceGroups/{resource-group} \
                         --sdk-auth
```

With the results for the command above, that's how AZURE_CREDENTIALS should be:

```json
{
  "clientSecret": "******",
  "subscriptionId": "******",
  "tenantId": "******",
  "clientId": "******"
}
```

### To run the Kubernetes locally

1. Pull the image.

   ```bash
   sudo docker pull lucasnoman/fast-food-tech-challenge:<coloque a última versão aqui>
   ```

2. Create the database and application via K8S.

   ```bash
   kubectl apply -f /K8S/db && kubectl apply -f /K8S/app
   ```
