az provider register --namespace Microsoft.KeyVault

az keyvault create \
    --resource-group rg-money-hub \
    --name kv-moneyhub-rm563112 \
    --location eastus2 \
    --sku standard \
    --enable-rbac-authorization true \
    --output table

az role assignment create \
  --assignee $(az account show --query user.name -o tsv) \
  --role "Key Vault Administrator" \
  --scope /subscriptions/$(az account show --query id -o tsv)/resourceGroups/rg-money-hub/providers/Microsoft.KeyVault/vaults/kv-moneyhub-rm563112