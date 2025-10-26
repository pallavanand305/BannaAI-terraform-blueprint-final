# Loom Video Script - BannaAI Terraform Blueprint

## 🎯 **Introduction (15 seconds)**
"Hi! I'm presenting the BannaAI Terraform blueprint - a minimal, modular infrastructure solution demonstrating multi-environment deployment, automated testing, and CI/CD integration."

## 🏗️ **Repository Structure (30 seconds)**
"Let me show you the folder structure:
- `/modules/vpc` - Reusable VPC module with multi-cloud support
- `/envs/prod` and `/envs/stage` - Separate environment configurations
- `/tests` - Terratest automation with Go
- `/.github/workflows` - Complete CI/CD pipeline"

## 🔧 **Key Features Demo (45 seconds)**

### **Multi-Environment Setup**
"Each environment calls the same base module but with unique variables:
- Production: 10.0.0.0/16 CIDR, 2 NAT gateways
- Staging: 10.1.0.0/16 CIDR, 1 NAT gateway
- Separate S3 backend states for isolation"

### **Multi-Cloud Provider Abstraction**
"The module supports AWS, Azure, and GCP through the `cloud_provider` variable:
- AWS creates VPC resources
- Azure creates VNet + Resource Group
- GCP creates VPC Network"

### **Automated Testing**
"Terratest integration runs `terraform.InitAndPlan` on staging environment, ensuring code quality before deployment."

### **CI/CD Pipeline**
"GitHub Actions workflow with 4 stages:
1. Validate - Format and syntax checks
2. Test - Terratest execution
3. Plan - Terraform plan on staging
4. Release - Triggered on main branch merge"

## 🚀 **Quick Demo (15 seconds)**
"The setup is ready to deploy:
```bash
cd envs/stage
terraform init
terraform plan
terraform apply
```"

## 📋 **Summary (15 seconds)**
"This blueprint demonstrates proper Terraform modularization, environment separation, automated testing, and complete CI/CD integration - addressing all infrastructure management gaps with minimal code complexity."

---
**Total Duration: ~2 minutes**
**Email to: contact@bannaai.com**