#!/bin/bash
terraform init -backend-config="storage_account_name=${TF_TFSTATE_STORAGE_ACCOUNT_NAME}" -backend-config="container_name=${TF_TFSTATE_CONTAINER_NAME}" -backend-config="key=terraform.tfstate" -backend-config="resource_group_name=${TF_TFSTATE_RESOURCE_GROUP_NAME}" -backend-config="access_key=${TF_TFSTATE_ACCOUNT_KEY}"
terraform workspace select "${ENV}" || (terraform workspace new "${ENV}" && terraform workspace select "${ENV}")