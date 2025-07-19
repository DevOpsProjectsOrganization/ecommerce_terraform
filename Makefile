dev-init:
	rm -rf ./terraform/terraform.tfstate
	terraform init  -var-file=./environments/dev/state.tfvars
dev-plan:
	terraform init  -var-file=./environments/dev/state.tfvars
	terraform plan -var-file=./environments/dev/main.tfvars 
dev-apply:
	terraform init  -var-file=./environments/dev/state.tfvars
	terraform apply -auto-approve -var-file=./environments/dev/main.tfvars -var token=$(token)
dev-destroy:
	terraform init  -var-file=./environments/dev/state.tfvars
	terraform destroy -auto-approve -var-file=./environments/dev/main.tfvars -var token=$(token)

prod-init:
	rm -rf ./terraform/terraform.tfstate
	terraform init -var-file=./environments/dev/state.tfvars
prod-plan:
	terraform init -var-file=./environments/dev/state.tfvars
	terraform plan -var-file=./environments/prod/main.tfvars
prod-apply:
	terraform init -var-file=./environments/dev/state.tfvars
	terraform apply -auto-approve -var-file=./environments/prod/main.tfvars -var token=$(token)
prod-destroy:
	terraform init -var-file=./environments/dev/state.tfvars
	terraform destroy -auto-approve -var-file=./environments/prod/main.tfvars -var token=$(token)

tools-infra:
	git pull
	rm -rf ./terraform/terraform.tfstate
	cd tools ; terraform init ; terraform plan