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
* docker-py = 1.9.0

## Setting up Dev

Here's a brief intro about what a developer must do in order to start developing the project further:

```
git clone https://github.com/sonata-nfv/tng-devops.git
cd tng-devops/
```

## Usage

To use the playbooks, the command is composed by `ansible-playbook` + the role (sp/vnv/sdk) + `-i environments` where are the environment list + `-e target=environment` the environment to be deployed.

Here is the list of commands to deploy each environment.

* int-sp-ath
  * `ansible-playbook roles/sp.yml -i environments -e "target=int-sp"`
* int-vnv-bcn
  * `ansible-playbook roles/vnv.yml -i environments -e "target=int-vnv"`
* pre-int-sdk-ath
  * `ansible-playbook roles/sdk.yml -i environments -e "target=pre-int-sdk"`
* pre-int-sp-ath
  * `ansible-playbook roles/sp.yml -i environments -e "target=pre-int-sp"`
* pre-int-vnv-bcn
  * `ansible-playbook roles/vnv.yml -i environments -e "target=pre-int-vnv"`
* qual-sp-bcn
  * `ansible-playbook roles/sp.yml -i environments -e "target=qual-sp"`
* qual-vnv-bcn
  * `ansible-playbook roles/vnv.yml -i environments -e "target=qual-vnv"`
* sta-sdk-ath, sta-sdk-ave and sta-sdk-pad
  * `ansible-playbook roles/sdk.yml -i environments -e "target=sta-sdk"`
* sta-sp-ath, sta-sp-ave and sta-sp-pad
  * `ansible-playbook roles/sp.yml -i environments -e "target=sta-sp"`
* sta-vnv-ath, sta-vnv-ave and sta-vnv-pad
  * `ansible-playbook roles/vnv.yml -i environments -e "target=sta-vnv"`

Or it can be deployed directly deployed using the hostname of the environment like:

* `ansible-playbook roles/sp.yml -i environments -e "target=sta-sp-ath"`

## Contributing

To contribute to the development of the tango devops you have to fork the repository, commit new code and create pull requests.

## Licensing

This repository is under Apache 2.0 License

## Lead Developers

* [@felipevicens](https://github.com/felipevicens) Felipe Vicens
* [@arocha7](https://github.com/arocha7/) Alberto Arocha