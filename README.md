

```
terraform plan -out=tfplan -no-color  > tfplan.txt
terraform apply "tfplan"
```