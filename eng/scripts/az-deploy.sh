#!/bin/bash

SUFFIX=$1

cd ../../src/api
rm -rf publish

dotnet publish -c Release -o publish

cd publish
zip -r package.zip .

az webapp deployment source config-zip -g "rg-$SUFFIX" -n "web-$SUFFIX" --src ./package.zip
