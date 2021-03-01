# New Relic POC Environment

Please have the latest versions of following tools installed on your local workstation:
- [Packer](https://www.packer.io/downloads) 
- [Terraform](https://www.terraform.io/downloads.html)


## 1. Build AMI with Packer and Ansible

If you wish to use a different New Relic account, change the license key (*line 40*) in `000-base.yml` within the ansible-playbooks directory with another license.

Ansible-playbook (`000-base.yml`) will be executed as part of the AMI creation.

**Execute the following:**

a. Change into the packer directory
```
cd packer
``` 
b. Execute packer command
```
packer build -var-file vars.json ami.json
```

## 2. Provision Resources with Terraform
This environment will create the following:
- EC2 Launch Template
- 3 Autoscaling groups
   - Two t2.micro instances in each ASG

**Execute the following:**

a. Initialize terraform
```
terraform init -backend-config "bucket=tfstates-cis-central" -backend-config "region=us-east-2" -backend-config "key=newrelic-poc/terraform.state" -backend-config "encrypt=true"
```

b. Build terraform plan

*NOTE: vars.tfvars is encrypted. Use ansible-vault to decrypt it*
```
terraform plan -var-file vars.tfvars -out plan
```
c. Apply the plan
```
terraform apply plan
```