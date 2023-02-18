variable "group_name" {
    type = string
# I have define the default value for this. If we will not define the variable in 
#  terraform.tfvars then it will take this default value.    
    default = "test-d"
  
}

variable "location" {
    type = string

  
}