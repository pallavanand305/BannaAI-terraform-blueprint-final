# BannaAI-terraform-blueprint

Minimal Terraform blueprint for multi-environment VPC deployment with automated testing and CI/CD.

## Folder Structure
```
├── modules/vpc/          # Reusable VPC module
│   ├── main.tf          # AWS VPC resources
│   ├── variables.tf     # Input variables
│   └── outputs.tf       # Output values
├── envs/                # Environment configurations
│   ├── prod/main.tf     # Production (10.0.0.0/16, 2 NATs)
│   └── stage/main.tf    # Staging (10.1.0.0/16, 1 NAT)
├── tests/               # Terratest automation
│   ├── vpc_test.go      # Go test file
│   └── go.mod           # Go dependencies
└── .github/workflows/   # CI/CD pipeline
    └── terraform.yml    # Validate→Test→Plan→Release
```

## Environment Setup

### Production
- CIDR: `10.0.0.0/16`
- NAT Gateways: 2
- Backend: `s3://bannai-terraform-state/prod/`

### Staging
- CIDR: `10.1.0.0/16`
- NAT Gateways: 1
- Backend: `s3://bannai-terraform-state/stage/`

## Provider Abstraction (Optional Bonus)

Set `cloud_provider` variable:
- `aws` (default) - Creates VPC
- `azure` - Creates VNet + Resource Group  
- `gcp` - Creates VPC Network

## Testing Instructions

```bash
# Run Terratest
cd tests
go mod tidy
go test -v

# Manual validation
cd envs/stage
terraform init -backend=false
terraform plan
```

## CI/CD Pipeline

Triggered on pull requests:
1. **Validate** - Format check and validation
2. **Test** - Terratest execution
3. **Plan** - Terraform plan on staging
4. **Release** - Triggered on main branch merge

## Quick Start

```bash
# Deploy staging
cd envs/stage
terraform init
terraform plan
terraform apply

# Deploy production
cd ../prod
terraform init
terraform plan
terraform apply
```