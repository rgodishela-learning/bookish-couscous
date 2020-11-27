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
#### set the environment variables
example: TF_VAR_<name_ofthe_variable>
TF_VAR_region="ap-south-1"

#### create the infrastructure
```
terrafom apply 
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
