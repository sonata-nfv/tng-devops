# tng-devops

<p align="center"><img src="https://github.com/sonata-nfv/tng-devops/wiki/images/sonata-5gtango-logo-500px.png" /></p>

This repository is used to handle the multiple environments for 5GTANGO and the deployment of the SDK, Service Platform and the VnV. The strategy of deployment is developed in Ansible. The playbooks will be executed by Jenkins.

## Organization of the repository

* environments: This file contains the list of IP servers to deploy the platforms grouped by 5GTANGO environments
* host_vars: This folder contains a file per server with the specific variables to deploy the platform
* utils: This folder contains some utilities to handle the servers
* roles: Being a Ansible role based structure we have a folder (roles) with roles to deploy each platform (sdk, sp and vnv). Inside the roles folder we have the tasks that contains the playbooks to deploy each platform component.

This is the tree structure of the repository:

```
.
├── environments
├── host_vars
│   ├── int-sp-ath
│   ├── int-vnv-bcn
│   ├── pre-int-sdk-ath
│   ├── pre-int-sp-ath
│   ├── pre-int-vnv-bcn
│   ├── qual-sp-bcn
│   ├── qual-vnv-bcn
│   ├── sta-sdk-ath
│   ├── sta-sdk-ave
│   ├── sta-sdk-pad
│   ├── sta-sp-ath
│   ├── sta-sp-ave
│   ├── sta-sp-pad
│   ├── sta-vnv-ath
│   ├── sta-vnv-ave
│   ├── sta-vnv-pad
│   └── localhost
├── roles
│   ├── sp
│   │   └── tasks
│   │       ├── components.yml
│   │       └── main.yml
│   ├── sdk
│   │   └── tasks
│   │       ├── components.yml
│   │       └── main.yml
│   ├── vnv
│   │   └── tasks
│   │       ├── components.yml
│   │       └── main.yml
│   ├── sp.yml
│   ├── sdk.yml
│   └── vnv.yml
├── LICENSE
├── README.md
└── utils
    ├── destroy.yml
    └── install-pip.yml
```

## Developing

These scripts were built with ansible > 2.4

### Prerequisites

* ansible > 2.4
* docker > 17.12.0-ce

## Setting up Dev

Here's a brief intro about what a developer must do in order to start developing the project further:

```
git clone https://github.com/sonata-nfv/tng-devops.git
cd tng-devops/
```

## Pre-configuration
This repo was made to work with already built machines. So you have to insert the managed hosts into the Inventory file.
If you are using authentication with private key, just add it to the 'ansible.cfg' file.

### Inventory

Add the host (or group of hosts) you want to manage to the Inventory file like:
```
; $ vi ./inventory/hosts
[dem_avr_sp]
sp ansible_host=172.31.6.46
[dem_ath_sp]
sp ansible_host=10.100.16.46
```

To avoid passing the static Inventory file to the command line, just add the following entry to 'ansible.cfg'
```
; $ vi ./ansible.cfg
inventory=inventory/
```

### Authentication mode
You can use Private key or Username/Password to authenticate against your target machines. Just add the following entries to 'ansible.cfg' according to your preferences.

```
; $ vi ./ansible.cfg
private_key_file = ~/.ssh/MYKEY.pem
```
Also provide the path to your Key file here:
```
; $ vi ./inventory/host_vars/all
ansible_ssh_private_key_file: "{{ lookup('env','HOME') }}/.ssh/MYKEY.pem"

```

```
; $ vi ./inventory/host_vars/all
ansible_user=tango
ansible_pass=*****
```

### Vault passwords
To avoid sending your secrets to your source code versioning system, just insert the password file out of the repo's directory and pass this path to the 'vault_password_file' parameter of 'ansible.cfg'. 
```
; $ vi ./ansible.cfg
vault_password_file = ~/.ssh/.tng_vault_pass
```

## Usage

To use the playbooks, the command is composed by Ansible playbook name (sp/vnv/sdk) and its `target`, ie, the environment to be deployed.

```
$ ansible-playbook sp.yml -e "target=dem_ath_sp env=dem pop=ath plat=sp" [-vvvv]
```

## Contributing

To contribute to the development of the tango devops you have to fork the repository, commit new code and create pull requests.

## Licensing

This repository is under Apache 2.0 License

## Lead Developers

* [@felipevicens](https://github.com/felipevicens) Felipe Vicens
* [@arocha7](https://github.com/arocha7/) Alberto Arocha
