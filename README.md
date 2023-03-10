# tf-eks-starter

Starter kit for provisioning a simple hello world application on Amazon Elastic Kubernetes Services (EKS) using Terraform Cloud and Argo CD

Based on the learning resources from hashicorp and AWS.

## Prerequisites

### Required environment variables for local development (optional)

* TF_CLOUD_ORGANIZATION

### Required Terraform Variables (e.g. in Terraform Cloud)

* AWS_ACCESS_KEY_ID

* AWS_SECRET_ACCESS_KEY

### Required Secrets for Github Actions

* DOCKER_USERNAME

* DOCKER_PASSWORD

* TF_API_TOKEN

## Getting Started

1. Fork this repository
2. Setup a Terraform Cloud and AWS account
3. Generate API and access tokens (see Prerequisites above) and save them as Github Secrets in your forked repository
4. (optional) Open up a Github Codespace for this repository (if you don't want to install the required tools locally)
5. (optional) `aws configure` and `terraform login`
6. Edit files to match your environment and configuration
7. Create pull request to merge your changes into the main branch and let the CI do the rest
