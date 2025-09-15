# Azure Resume Website

A static personal resume website deployed on Azure using **Terraform** and automated **GitHub Actions CI/CD**.

---

## 🚀 Project Overview

This project automates the deployment of a static resume website to **Azure Storage** and optionally a **CDN**, following modern DevOps best practices.  

Key highlights:

- Infrastructure as Code with **Terraform**.
- Continuous deployment via **GitHub Actions** with **OIDC authentication** (no static Azure credentials required).
- Security and compliance checks using **Trivy IaC scan**.
- Optional CDN integration for global content delivery.

---

## 📦 Repository Structure

azure-cdn-resume-website/
├── .github/
│ └── workflows/
│ └── deploy.yml # GitHub Actions workflow
├── terraform/
│ ├── main.tf # Terraform resources 
│ ├── variables.tf # Terraform input variables
│ └── outputs.tf # Terraform outputs (static website endpoint)
└── website/
├── index.html
└── style.css


## 🛠 Technologies Used

- **Frontend**: HTML, CSS  
- **Infrastructure as Code**: Terraform  
- **CI/CD**: GitHub Actions  
- **Cloud Services**: Azure Storage (Static Website), optional Azure CDN, optional Azure DNS  
- **Security/Compliance**: Trivy (IaC scanning)  

## ⚙️ Prerequisites

- Azure account (Pay-As-You-Go or supported tier)  
- Terraform installed locally  
- GitHub repository secrets configured:
  - `AZURE_CREDENTIALS` → Azure service principal for OIDC login  
  - `AZURE_STORAGE_ACCOUNT` → Storage account name  
  - `AZURE_STORAGE_KEY` → Storage account key 

  ## 🔧 Deployment Instructions

1. Clone the repository:
```bash
git clone https://github.com/KokBoakye/azure-cdn-resume-website.git
cd azure-cdn-resume-website


2. Navigate to Terraform directory:
cd terraform
terraform init


3. Validate and deploy infrastructure:
terraform fmt -check
terraform validate
terraform plan
terraform apply -auto-approve


4. Push changes to main branch to trigger GitHub Actions workflow:
Deploys website to Azure Storage $web container.
Runs Trivy IaC scan to detect Terraform misconfigurations.
Optionally purges Azure CDN cache (if configured).


🌐 Accessing the Website
The static website is hosted at the Azure Storage primary web endpoint:
https://<storage-account>.z13.web.core.windows.net/


If a CDN is configured, your website will also be available via the CDN endpoint for faster global delivery.
Custom domain users must configure DNS CNAME/A records pointing to the CDN or storage endpoint.


🔐 Security Considerations
OIDC Authentication ensures no static secrets are exposed in GitHub Actions.
Trivy IaC scans identify potential misconfigurations in Terraform resources.
Optional CDN origin restrictions can secure content delivery.
HTTPS enabled for secure communication.


⚡ Optional Enhancements
Add Azure Front Door or Azure CDN (Verizon) for advanced caching and routing.
Integrate Azure WAF for additional security rules.
Monitor usage with Azure Monitor or Application Insights.