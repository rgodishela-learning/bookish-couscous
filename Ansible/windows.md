#### prepare the host
1. Execute configure remote host powershell script
```
https://github.com/ansible/ansible/blob/devel/examples/scripts/ConfigureRemotingForAnsible.ps1
```

#### prepare the ansible control machine
1. install pywinrm package 
2. Prepare group_vars/all.yml file ( credentials file )
```
ansible_user=Administrator
ansible_connection=winrm
ansible_port=5985
ansible_winrm_transport=basic
ansible_winrm_server_cert_validation=ignore
```
3. use win_ping command to test
```
ansible windowshost -m win_ping
```

Documentation: https://docs.ansible.com/ansible/latest/user_guide/windows.html
