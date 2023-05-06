

```bash
terraform init
# Create dev env
terraform plan -var 'environment=dev' -out=tfplan -no-color  > tfplan.txt
terraform apply "tfplan"
# Create uat env
terraform plan -var 'environment=uat' -out=tfplan -no-color  > tfplan.txt
terraform apply "tfplan"

```bash
# Create Service Principal
az ad sp create-for-rbac --name "vscode-thai-2023" --role contributor --scopes [RESOURCE_ID]
```