#!/bin/bash

SUFFIX=$1

# Step 1: Publish and deploy API
cd ../../src/api
rm -rf publish

dotnet publish -c Release -o publish

cd publish
zip -r package.zip .

az webapp deployment source config-zip -g "rg-$SUFFIX" -n "web-$SUFFIX" --src ./package.zip

# Step 2: Publish and deploy Blazor App
cd ../../app

# Replace API name in appsettings.json
sed -i -E "s/web-cross-post-(..*)\.azurewebsites\.net/web-$SUFFIX.azurewebsites.net/g" wwwroot/appsettings.json

rm -rf publish

dotnet publish -c Release -o publish
az storage blob delete-batch --account-name "stor${SUFFIX//-/}" --source \$web
az storage blob upload-batch --account-name "stor${SUFFIX//-/}" -s publish/wwwroot -d \$web
