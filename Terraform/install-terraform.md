#### Login to Console
Console link will be provided at the time of the training

#### Install terraform
```
sudo wget https://releases.hashicorp.com/terraform/0.13.3/terraform_0.13.3_linux_amd64.zip
sudo unzip terraform_0.13.3_linux_amd64.zip
sudo mv terraform /usr/local/bin/
```
#### check the version
```
terraform version
```
#### Verify that the installation worked by opening a new terminal session and listing Terraform's available subcommands
```
terraform -help
terraform -help plan
```
#### Enable tab completion
```
terraform -install-autocomplete
```



#### Install AWS CLI 
```
sudo curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
sudo unzip awscliv2.zip
sudo ./aws/install
```
```
#accesskey/secureaccess key will be provided by trainer
export AWS_ACCESS_KEY_ID=(your access key id)
export AWS_SECRET_ACCESS_KEY=(your secret access key)

or

aws configure
```

#### Install git
```
sudo yum install git -y
```
#### If you are using your own aws acount for lab purposes then please add the below iam policies for the relevant user.
```
AmazonEC2FullAccess
AmazonS3FullAccess
AmazonDynamoDBFullAccess
AmazonRDSFullAccess
CloudWatchFullAccess
IAMFullAccess
```
NOTE: The above commands have been tested successfully in Amazon Linux machine
