#!/bin/bash

#Comment out if provided in Pipeline Vars
export TF_TFSTATE_RESOURCE_GROUP_NAME=azure_landing_zone_spoke_tfstate
export TF_TFSTATE_STORAGE_ACCOUNT_NAME=azure_landing_zone_spoke_tfstate$RANDOM
export TF_TFSTATE_CONTAINER_NAME=azure_landing_zone_spoke_tfstate

# Create resource group
az group create --name $TF_TFSTATE_RESOURCE_GROUP_NAME --location eastus

# Create storage account
az storage account create --resource-group $TF_TFSTATE_RESOURCE_GROUP_NAME --name $TF_TFSTATE_STORAGE_ACCOUNT_NAME --sku Standard_LRS --encryption-services blob

# Get storage account key
export TF_TFSTATE_ACCOUNT_KEY=$(az storage account keys list --resource-group $TF_TFSTATE_RESOURCE_GROUP_NAME --account-name $TF_TFSTATE_STORAGE_ACCOUNT_NAME --query [0].value -o tsv)

# Create blob container
az storage container create --name $TF_TFSTATE_CONTAINER_NAME --account-name $TF_TFSTATE_STORAGE_ACCOUNT_NAME --account-key $TF_TFSTATE_ACCOUNT_KEY

echo "storage_account_name: $TF_TFSTATE_STORAGE_ACCOUNT_NAME"
echo "container_name: $TF_TFSTATE_CONTAINER_NAME"
echo "access_key: $TF_TFSTATE_ACCOUNT_KEY"