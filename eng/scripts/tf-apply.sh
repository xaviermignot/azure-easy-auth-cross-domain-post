#!/bin/bash

cd ../tf

echo "Applying changes to infrastructure..."
terraform apply -auto-approve

echo "Getting Terraform outputs..."
APP_ID=$(terraform output -raw aad_app_id)
SUFFIX=$(terraform output -raw random_suffix)

echo "Granting admin consent to Azure AD app..."
az ad app permission admin-consent --id $APP_ID

echo "Using deployment script to deploy API code..."
cd ../scripts
./az-deploy.sh $SUFFIX
