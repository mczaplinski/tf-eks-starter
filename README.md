# tf-eks-starter

Starter kit for provisioning a simple hello world application on Amazon Elastic Kubernetes Services (EKS) using Terraform Cloud and Argo CD

Based on the resources at hashicorp and AWS.

## Prerequisites

* Terraform Cloud account and organization
* AWS with IAM user access key

### Required environment variables

* TF_CLOUD_ORGANIZATION

### Required Terraform Variables (e.g. in Terraform Cloud)

* AWS_ACCESS_KEY_ID

* AWS_SECRET_ACCESS_KEY

### Required Secrets for Github Actions

* DOCKER_USERNAME

* DOCKER_PASSWORD

## Usage

### 1. Provision EKS cluster

```bash
aws configure

terraform init

terraform apply
```

### 2. Save kubeconfig

```bash
aws eks --region $(terraform output -raw region) update-kubeconfig \
    --name $(terraform output -raw cluster_name)
```
