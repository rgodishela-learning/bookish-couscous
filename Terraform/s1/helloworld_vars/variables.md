#### string variable
```
variable "image_id" {
  type        = string
  description = "The id of the machine image (AMI) to use for the server."
}
```

#### number variable
```
variable "list_example" {
  description = "An example of a list in Terraform"
  type        = list
  default     = ["a", "b", "c"]
}
```
#### list variable
```
variable "list_example" {
  description = "An example of a list in Terraform"
  type        = list
  default     = ["a", "b", "c"]
}
```
#### Declare implicitly by using brackets []
```
variable "cidrs" { 
    default = [] 
}
```
#### Declare explicitly with 'list'
variable "cidrs" { 
    type = list 
}

#### maps variable
```
variable "amis" {
  type = "map"
  default = {
    "ap-south-1" = "ami-0cda377a1b884a1bc"
    "ap-southeast-1" = "ami-093da183b859d5a4b"
  }
}
```
#### Variable Definition Precedence
1. Environment variables
2. The terraform.tfvars file, if present.
3. The terraform.tfvars.json file, if present.
4. Any *.auto.tfvars or *.auto.tfvars.json files, processed in lexical order of their filenames.
5. Any -var and -var-file options on the command line, in the order they are provided. (This includes variables set by a Terraform Cloud workspace.)