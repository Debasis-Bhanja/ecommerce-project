# terraform code doesn't start with main.tf. it only needs the correct extension .tf.
# terraform will read all the files at the same time and it will refer to the variables at the same time.
# bucket names or all the values will go into locals.tf and the declaration of the variables will go into variables.tf

# gitignore file will have the filename like *.tfstate (state file) *.tfvars (variables and its values) - that we want to ignore
# while we add or commit. because if they are not ignored its values will be shown while deploying (terraform apply)


# at first all the .tf files were locally, but then when i was using app.terrform to migrate the code it was asking for directory
# to start with. so i moved all my .tf files to terraform folder.
# mk dir terraform --> mv *.tf terraform/
# NOTE --- .terraform is different from terraform folder. .tf gets created when we are using terraform plan, commit and statefile
# are hosted in that.