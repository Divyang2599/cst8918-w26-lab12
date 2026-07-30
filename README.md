# CST8918 - DevOps: Infrastructure as Code
**Lab 12: Terraform CI/CD on Azure with GitHub Actions**  
---

##  Team Members

* **Full Name:** Harshdeep Puri | **GitHub Username:** harshdeep1230
* **Full Name:** Divyang Lodariya | **GitHub Username:** divyang

---

##  Project Overview

This repository demonstrates an Infrastructure as Code (IaC) pipeline for automating Azure infrastructure deployment using **Terraform** and **GitHub Actions**. 

The repository is structured to separate application representation (`app/`), infrastructure configurations (`infra/`), and automated workflow pipelines (`.github/workflows/`).

## Known Environment Issue & CloudLabs Limitations
Due to restricted IAM administrative permissions in the CloudLabs / Azure Sandbox environment, the automated CI/CD deployment pipeline (terraform apply via GitHub Actions) could not be fully completed.

## Technical Analysis of the Error
When attempting to grant the required Azure Service Principal permissions using Azure CLI:

az role assignment create \
  --role contributor \
  --assignee-object-id $assigneeObjectId \
  --assignee-principal-type ServicePrincipal \
  --scope /subscriptions/$subscriptionId

## The CLI returns the following authorization failure:  

(MissingSubscription) The request did not have a subscription or a valid tenant level resource provider.
Code: MissingSubscription

## Root Cause & Impact
Subscription-Level IAM Restrictions: The CloudLabs student account (odl_user_2248664@cloudlabsai.com) operates under custom owner permissions restricted to a specific resource scope rather than root Subscription Owner privileges.

Service Principal Assignment Block: Security policies on CloudLabs prevent assigning elevated Contributor roles at the subscription root scope (/subscriptions/559881a2-6642-4cc2-b299-803a730ec91f).

Impact on OIDC Setup: Without these federated credential role assignments, GitHub Actions cannot authenticate to Azure to run the automated terraform apply step or drift detection

## Screenshots & Verification Evidence
1. CloudLabs IAM Permission Error.
<img width="1917" height="1025" alt="image" src="https://github.com/user-attachments/assets/86d93577-70f6-4953-b6f5-29d5a3d462ae" />

3. Terraform Plan Output

<img width="1916" height="963" alt="image" src="https://github.com/user-attachments/assets/b2ebba49-2145-4f96-98fb-530dcb5e9b7d" />
