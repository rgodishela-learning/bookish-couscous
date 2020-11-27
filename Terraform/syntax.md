#### resource syntax
```
resource "<PROVIDER>_<TYPE>" "<NAME>" {  
    [CONFIG ...]
}
```
Please refer to [Terraform AWS Docs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs) for more information 

#### variable syntax
```
variable "NAME" {
  [CONFIG ...]
}
```
Please refer to [variables.md](s1/helloworld_vars/variables.md) for more information 

#### Attribute reference
```
<PROVIDER>_<TYPE>.<NAME>.<ATTRIBUTE>
```

#### Datasource syntax
```
data "<PROVIDER>_<TYPE>" "<NAME>" {
  [CONFIG ...]
}
```