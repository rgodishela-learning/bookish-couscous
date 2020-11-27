### Steps to follow below commands to execute the terraform configurations

#### Initialize the directory.
```
terraform init
```

#### format the configuration
```
terraform fmt
```

#### validate the configuration/syntax
```
terraform validate
```

#### create the infrastructure
```
terraform plan -out helloworld.tfplan
terraform apply "helloworld.tfplan"
```

#### inspect the state
```
terraform show
```

#### List the resources in state
```
terraform state list
```

#### destroy the infrastructure
```
terraform destroy
```
