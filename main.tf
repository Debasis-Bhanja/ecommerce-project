# terraform code doesn't start with main.tf. it only needs the correct extension .tf.
# terraform will read all the files at the same time and it will refer to the variables at the same time.
# bucket names or all the values will go into locals.tf and the declaration of the variables will go into variables.tf

# gitignore file will have the filename like *.tfstate (state file) *.tfvars (variables and its values) - that we want to ignore
# while we add or commit. because if they are not ignored its values will be shown while deploying (terraform apply)