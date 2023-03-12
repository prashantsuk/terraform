terraform {
  required_version = ">= 1.3.2"
  //required_version = "<=1.3.3"
  required_providers {
    aws = {
      //version = ">= 4.34"
      version = ">= 3.37.0"
      
    }
  }
}