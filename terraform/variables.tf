# we are taking its value from the tfvars. In variables.tf we have declared the variables and the value of these variables are
# stored in terraform.tfvars. we can create here but good practice is to put it in the git vault and refer it from there.

variable "environment" {
    type = string
}

variable "region" {
    type = string
}

variable "project" {
    type = string
}

variable "owner"{
    type = string
}