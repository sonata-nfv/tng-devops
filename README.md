# tng-devops

[![Join the chat at https://gitter.im/sonata-nfv/Lobby](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/sonata-nfv/Lobby) 

<p align="center"><img src="https://github.com/sonata-nfv/tng-devops/wiki/images/sonata-5gtango-logo-500px.png" /></p>

This repository is used to handle the multiple environments for 5GTANGO and the deployment of the SDK, Service Platform and the VnV. The strategy of deployment is developed in Ansible. The playbooks will be executed by Jenkins.

## Organization of the repository

* environments: This file contains the list of IP servers to deploy the platforms grouped by 5GTANGO environments
* host_vars: This folder contains a file per server with the specific variables to deploy the platform
* utils: This folder contains some utilities to handle the servers
* roles: Being a Ansible role based structure we have a folder (roles) with roles to deploy each platform (sdk, sp and vnv). Inside the roles folder we have the tasks that contains the playbooks to deploy each platform component.

This is the tree structure of the repository:

```
├── environments
├── host_vars
│   ├── demo-comm-sp.5gtango.eu
│   ├── files.txt
│   ├── int-sp-ath.5gtango.eu
│   ├── int-vnv.5gtango.eu
│   ├── int-vnv-ave-5gtango.eu
│   ├── localhost
│   ├── pre-int-sp-ath.5gtango.eu
│   ├── pre-int-vnv-ave.5gtango.eu
│   ├── pre-int-vnv-bcn.5gtango.eu
│   ├── qual-sp-ave.5gtango.eu
│   ├── qual-sp-bcn.5gtango.eu
│   ├── sta-sp-ath.5gtango.eu
│   ├── sta-sp-ath-v4-0.5gtango.eu
│   ├── sta-sp-ave.5gtango.eu
│   ├── sta-sp-ave-v4-0.5gtango.eu
│   ├── sta-vnv-ath-v4-0.5gtango.eu
│   └── sta-vnv-ave-v4-0.5gtango.eu
├── Jenkinsfile
├── LICENSE
├── README.md
├── roles
│   ├── prepare-env
│   │   ├── files
│   │   │   └── docker.service
│   │   └── tasks
│   │       ├── docker.yml
│   │       ├── main.yml
│   │       └── python.yml
│   ├── prepare-env.yml
│   ├── sdk
│   │   └── tasks
│   │       └── main.yml
│   ├── sdk.yml
│   ├── sp
│   │   └── tasks
│   │       ├── add-athens-pop1-vim-wim-1.yml
│   │       ├── add-athens-pop1-vim-wim-2.yml
│   │       ├── add-athens-pop1-vim-wim-3.yml
│   │       ├── add-athens-pop1-vim-wim.yml
│   │       ├── add-aveiro-pop2-vim-wim.yml
│   │       ├── add-barcelona-pop1-vim-wim.yml
│   │       ├── add-bcn-pop1-vim-wim.yml
│   │       ├── add-mock-vim-wim.yml
│   │       ├── alertmanager.yml
│   │       ├── api-gtw.yml
│   │       ├── bss.yml
│   │       ├── cat.yml
│   │       ├── clean_db.yml
│   │       ├── flm.yml
│   │       ├── fnct.yml
│   │       ├── grafana.yml
│   │       ├── gtkapi.yml
│   │       ├── gtk-common.yml
│   │       ├── gtkrec.yml
│   │       ├── gtk-sp.yml
│   │       ├── gtk-usr.yml
│   │       ├── gui.yml
│   │       ├── ia-nbi.yml
│   │       ├── influxdb.yml
│   │       ├── k8s-wrapper.yml
│   │       ├── keycloak.yml
│   │       ├── kpi.yml
│   │       ├── lic.yml
│   │       ├── main.yml
│   │       ├── mongo-express.yml
│   │       ├── mongo.yml
│   │       ├── monitmgr.yml
│   │       ├── pgsql-monitoring.yml
│   │       ├── pgsql.yml
│   │       ├── pkg.yml
│   │       ├── placementplugin.yml
│   │       ├── placement.yml
│   │       ├── pluginmgr.yml
│   │       ├── portal.yml
│   │       ├── probe.yml
│   │       ├── prometheus.yml
│   │       ├── pushgw.yml
│   │       ├── rabbitmq-enable-plugins.yaml
│   │       ├── rabbitmq.yml
│   │       ├── redis.yml
│   │       ├── rep.yml
│   │       ├── rlt.yml
│   │       ├── sec-gtw.yml
│   │       ├── sla-mgmt.yml
│   │       ├── slice-mngr.yml
│   │       ├── slm.yml
│   │       ├── smr.yml
│   │       ├── snmpmng.yml
│   │       ├── srv.yml
│   │       ├── tng-policy-mngr.yml
│   │       ├── tng-sdk-pkg.yml
│   │       ├── usr.yml
│   │       ├── val.yml
│   │       ├── vim-adaptor.yml
│   │       ├── vim-wrapper-heat.yml
│   │       ├── vim-wrapper-mock.yml
│   │       ├── vim-wrapper-ovs.yml
│   │       ├── vim.yml
│   │       ├── vmprobe.yml
│   │       ├── wim-adaptor.yml
│   │       ├── wim-wrapper-mock.yml
│   │       ├── wim-wrapper-tapi.yml
│   │       └── wim-wrapper-vtn.yml
│   ├── sp.yml
│   ├── vnv
│   │   └── tasks
│   │       ├── add-osm-ath.yml
│   │       ├── add-qual-sp-bcn.yml
│   │       ├── api-gtw.yml
│   │       ├── cat.yml
│   │       ├── grafana.yml
│   │       ├── gtk-common.yml
│   │       ├── gtk-vnv.yml
│   │       ├── main.yml
│   │       ├── mongo.yml
│   │       ├── monitmgr.yml
│   │       ├── pgsql-monitoring.yml
│   │       ├── pgsql.yml
│   │       ├── portal.yml
│   │       ├── prometheus.yml
│   │       ├── pushgw.yml
│   │       ├── redis.yml
│   │       ├── rep.yml
│   │       ├── sec-gtw.yml
│   │       ├── tee.yml
│   │       ├── tng-sdk-analyze-weight.yml
│   │       ├── tng-sdk-pkg.yml
│   │       ├── tng-vnv-curator.yml
│   │       ├── tng-vnv-dsm.yml
│   │       ├── tng-vnv-executor.yml
│   │       ├── tng-vnv-planner.yml
│   │       └── tng-vnv-platform-adapter.yml
│   └── vnv.yml
└── utils
    ├── docker-network.yml
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

* int-sp-ath.5gtango.eu
  * `ansible-playbook roles/sp.yml -i environments -e "target=int-sp"`
* int-vnv-bcn.5gtango.eu
  * `ansible-playbook roles/vnv.yml -i environments -e "target=int-vnv"`
* pre-int-sdk-ath.5gtango.eu
  * `ansible-playbook roles/sdk.yml -i environments -e "target=pre-int-sdk"`
* pre-int-sp-ath.5gtango.eu
  * `ansible-playbook roles/sp.yml -i environments -e "target=pre-int-sp"`
* pre-int-vnv-bcn.5gtango.eu
  * `ansible-playbook roles/vnv.yml -i environments -e "target=pre-int-vnv"`
* qual-sp-bcn.5gtango.eu
  * `ansible-playbook roles/sp.yml -i environments -e "target=qual-sp"`
* qual-vnv-bcn.5gtango.eu
  * `ansible-playbook roles/vnv.yml -i environments -e "target=qual-vnv"`
* sta-sdk-ath.5gtango.eu, sta-sdk-ave.5gtango.eu and sta-sdk-pad.5gtango.eu
  * `ansible-playbook roles/sdk.yml -i environments -e "target=sta-sdk"`
* sta-sp-ath.5gtango.eu, sta-sp-ave.5gtango.eu and sta-sp-pad.5gtango.eu
  * `ansible-playbook roles/sp.yml -i environments -e "target=sta-sp"`
* sta-vnv-ath.5gtango.eu, sta-vnv-ave.5gtango.eu and sta-vnv-pad.5gtango.eu
  * `ansible-playbook roles/vnv.yml -i environments -e "target=sta-vnv"`

Or it can be deployed directly deployed using the hostname of the environment like:

* `ansible-playbook roles/sp.yml -i environments -e "target=sta-sp-ath.5gtango.eu"`

## Contributing

To contribute to the development of the tango devops you have to fork the repository, commit new code and create pull requests.

## Licensing

This repository is under Apache 2.0 License

## Lead Developers

* [@felipevicens](https://github.com/felipevicens) Felipe Vicens
* [@arocha7](https://github.com/arocha7/) Alberto Arocha
