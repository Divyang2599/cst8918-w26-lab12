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

### Repository Structure

```text
cst8918-w26-lab12
├── .github
│   └── workflows
│       ├── infra-ci-cd.yml
│       ├── infra-drift-detection.yml
│       └── infra-static-tests.yml
├── app
│   └── .gitkeep
├── infra
│   ├── az-federated-credential-params
│   │   ├── branch-main.json
│   │   ├── production-deploy.json
│   │   └── pull-request.json
│   ├── tf-app
│   │   ├── .tflint.hcl
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   ├── terraform.tf
│   │   └── variables.tf
│   └── tf-backend
│       └── main.tf
├── screenshots
│   ├── cloudlabs-error.png
│   ├── pr-checks.png
│   └── pr-tf-plan.png
├── .editorconfig
├── .gitignore
└── README.md
