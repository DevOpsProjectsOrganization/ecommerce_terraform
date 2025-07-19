dev-init:
	rm -rf ./terraform/terraform.tfstate
	terraform init
dev-plan:
	terraform init
	terraform plan -var-file=./environments/dev/main.tfvars -var-file=./environments/dev/state.tfvars
dev-apply:
	terraform init
	terraform apply -auto-approve -var-file=./environments/dev/main.tfvars -var-file=./environments/dev/state.tfvars
dev-destroy:
	terraform init
	terraform destroy -auto-approve -var-file=./environments/dev/main.tfvars

prod-init:
	rm -rf ./terraform/terraform.tfstate
	terraform init
prod-plan:
	terraform init
	terraform plan -var-file=./environments/prod/main.tfvars
prod-apply:
	terraform init
	terraform apply -auto-approve -var-file=./environments/prod/main.tfvars
prod-destroy:
	terraform init
	terraform destroy -auto-approve -var-file=./environments/prod/main.tfvars

tools-infra:
	git pull
	rm -rf ./terraform/terraform.tfstate
	cd tools ; terraform init ; terraform plan