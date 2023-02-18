terraform {
    
     backend "remote" {
        hostname = "app.terraform.io"
        organization = "<->"   # organization name
        workspaces {
            name = "<--+9-*.>"          # workspace name
        }
    }
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.1.3"
    }
  }
}
