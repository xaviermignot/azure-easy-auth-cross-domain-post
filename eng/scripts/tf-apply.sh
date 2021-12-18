#!/bin/bash

cd $(dirname $0)

echo "Initializing Terraform..."
terraform -chdir=../tf init

echo "Applying changes to infrastructure..."
terraform -chdir=../tf apply -auto-approve

echo "Getting Terraform outputs..."
APP_ID=$(terraform -chdir=../tf output -raw aad_app_id)
SUFFIX=$(terraform -chdir=../tf output -raw random_suffix)

echo "Granting admin consent to Azure AD app..."
az ad app permission admin-consent --id $APP_ID

echo "Using deployment script to deploy API code..."
./az-deploy.sh $SUFFIX
