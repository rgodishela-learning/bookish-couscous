### RedHat Distribution
 Download the epel-release using rpm
```
rpm -ivh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
```
 Download ansible
```
sudo yum install ansible -y
```
 Check the version
```
ansible --version
```
 Run an Ad-Hoc command “ping” to test locally
```
ansible localhost -m ping -c local
```
### Debian Distribution
 Download the Ubuntu packages registry
```
sudo apt-get install software-properties-common
```
 Add the Ansible Packages repository
```
sudo apt-add-repository ppa:ansible/ansible
```
 Update the Ubuntu packages
```
sudo apt-get update
```
 Install Ansible
```
sudo apt-get install ansible -y
```
 Check the version
```
ansible --version
```
 Run an Ad-Hoc command “ping” to test locally
```
ansible localhost -m ping -c local
```
