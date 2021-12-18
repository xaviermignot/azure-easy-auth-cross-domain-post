# Demo of cross domain POST request issue with Azure App Service and Easy Auth

That's a long title, right ? 🤯  
This repository contains a demo to illustrate a bug hunting story written in a blog post... that still needs to be written.  
Running this demo will create an App Service protected by Azure AD authentication, deploy a simple API code to it and let you experiment with POST request either from VS Code or from a simple blazor app.


## Prerequisites

Before going further you will need the following requirements:
- An Azure subscription associated to a tenant you are global administrator
- Terraform CLI version 1.1.0
- Azure CLI (make sure you're connected to your subscription)
- .NET SDK 6.0
- A Linux shell (I'm using Zsh in WSL but any Bash shell should be fine)


## Getting started

After cloning the repo you need to make the scripts executable:
```bash
chmod +x eng/scripts/*.sh
```
Then run the following script:
```bash
eng/scripts/tf-apply.sh
```
It will initialize Terraform using the local backend, create the resources in you Azure subscription, build and deploy the code to your new web app.  
If you want to use Terraform Cloud instead of the local backend, add a `tf-backend.tf` file in the `eng/tf` directory with the following content:
```hcl
terraform {
  backend "remote" {
    organization = "<YOUR ORGANIZATION NAME>"

    workspaces {
      name = "<YOUR WORKSPACE NAME>"
    }
  }
}
```