# tfvars should not be pushed to git repositories. that is why we add them in gitignore
# But terraform plan/apply will fail if executing from terraform cloud. 
# so we need to add them to git repository
# best practice is to add tfvars to git but their values needs to come from the vault.

environment = "sbx"
region = "ap-south-1"
owner = "data-engineering"
project = "ecommerce"