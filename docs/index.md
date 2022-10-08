# Project: A:Platform64

```text
 █████╗    ██████╗ ██╗      █████╗ ████████╗███████╗ ██████╗ ██████╗ ███╗   ███╗ ██████╗ ██╗  ██╗
██╔══██╗██╗██╔══██╗██║     ██╔══██╗╚══██╔══╝██╔════╝██╔═══██╗██╔══██╗████╗ ████║██╔════╝ ██║  ██║
███████║╚═╝██████╔╝██║     ███████║   ██║   █████╗  ██║   ██║██████╔╝██╔████╔██║███████╗ ███████║
██╔══██║██╗██╔═══╝ ██║     ██╔══██║   ██║   ██╔══╝  ██║   ██║██╔══██╗██║╚██╔╝██║██╔═══██╗╚════██║
██║  ██║╚═╝██║     ███████╗██║  ██║   ██║   ██║     ╚██████╔╝██║  ██║██║ ╚═╝ ██║╚██████╔╝     ██║
╚═╝  ╚═╝   ╚═╝     ╚══════╝╚═╝  ╚═╝   ╚═╝   ╚═╝      ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝ ╚═════╝      ╚═╝
```

## Overview

**A:Platform64** is an automated infrastructure-as-code management platform based on Ansible.

### Design Principles

The platform is designed to take full control of the target infrastructure under the following principles:

- **Automate everything**: all management tasks should be automated. Exceptions should be carefully evaluated and only used when no automation is possible.
- **Separate code from end-state configuration**: automation scripts must be developed to define a clear and well-documented parameter interface for setting end-state and behaviour data.
- **Ansible Roles must be specialized**: roles will be used to manage single components or services. Dependencies must be clearly documented for cases where the role relies on features provided by other roles.
- **Infrastructure data model**: the infrastructure will use a data model to represent the target end-state and run-time behaviour. The model includes the following elements:
  - _Site_: Represents a group of Nodes that are managed by the same Control Node.
  - _Node_: Compute node that is capable of hosting software components and that is fully managed by the Control Node.
  - _Component_: Individual software product that is installed in a Node.
  - _Service_: Group of Components configured in one or more Nodes to serve a particular function.
- **Multi-platform friendly**: roles must be prepared to separate platform-specific code into individual files that can be loaded on-demand. Roles should not be allowed to execute on platforms that are not supported.
- **Test everything**: roles must include testing code to check platform compatibility, code sanity, standardization, integration and functionality.

### Architecture

The platform defines the following components:

- **Control Node**: compute node that will host the Ansible engine and the **A:Platform64** platform.
- **Management Node**: compute nodes that will me managed by **A:Platform64**
- **Site**: group of hosts that shares a set of configuration files. Sites can be used to isolated environments (e.g.: prod, dev, test, etc.)

Communication between the **Control Node** and the **Management Nodes** will be done using OpenSSH and regular Linux user accounts with public/private key pairs.
Root privilege will be provided by Sudo.

The **Control Node** will have the following directory structure to store **A:Platform64** components:

| Path         | Content                                                          |
| ------------ | ---------------------------------------------------------------- |
| etc/         | Configuration files and keys                                     |
| inventories/ | Ansible inventory files, host_vars and group_vars                |
| collections/ | Ansible Collections installed from Ansible-Galaxy                |
| roles/       | Custom Ansible Roles                                             |
| playbooks/   | Custom Ansible Playbooks                                         |
| files/       | Ansible data files for custom playbooks and roles                |
| templates/   | Custom Ansible templates                                         |
| tests/       | Ansible playbooks for testing Custom Ansible Roles and Playbooks |
| vars/        | Ansible variables for custom playbooks and roles                 |
| logs/        | Execution logs                                                   |
| var/         | Variable and temporal data store                                 |
| bin/         | Shell scripts                                                    |
| docs/        | Repository for storing site-specific documentation               |

The directory structure and configuration are automatically created during the [Deployment Procedure](#deployment)

### Automation Scripts

The platform uses Ansible Roles to implement automation scripts. Roles are grouped into Ansible Collections based on the managed component type:

| Collection                                                                                 | Description                                                       |
| ------------------------------------------------------------------------------------------ | ----------------------------------------------------------------- |
| [application](https://aplatform64.readthedocs.io/en/latest/collections/application/)       | Ansible Roles for automating office applications provisioning     |
| [automation](https://aplatform64.readthedocs.io/en/latest/collections/automation/)         | Ansible Roles for managing automation tools provisioning          |
| [backup](https://aplatform64.readthedocs.io/en/latest/collections/backup/)                 | Ansible Roles for automating backup tools provisioning            |
| [cloud](https://aplatform64.readthedocs.io/en/latest/collections/cloud/)                   | Ansible Roles for automating cloud tools provisioning             |
| [container](https://aplatform64.readthedocs.io/en/latest/collections/container/)           | Ansible Roles for automating container tools provisioning         |
| [database](https://aplatform64.readthedocs.io/en/latest/collections/database/)             | Ansible Roles for automating database tools provisioning          |
| [development](https://aplatform64.readthedocs.io/en/latest/collections/development/)       | Ansible Roles for automating development environment provisioning |
| [devops](https://aplatform64.readthedocs.io/en/latest/collections/devops/)                 | Ansible Roles for automating devops tools provisioning            |
| [hardware](https://aplatform64.readthedocs.io/en/latest/collections/hardware/)             | Ansible Roles for automating hardware drivers provisioning        |
| [hypervisor](https://aplatform64.readthedocs.io/en/latest/collections/hypervisor/)         | Ansible Roles for automating hypervisor tools provisioning        |
| [infrastructure](https://aplatform64.readthedocs.io/en/latest/collections/infrastructure/) | Ansible Roles for automating infrastructure tools provisioning    |
| [monitor](https://aplatform64.readthedocs.io/en/latest/collections/monitor/)               | Ansible Roles for automating monitoring tools provisioning        |
| [network](https://aplatform64.readthedocs.io/en/latest/collections/network/)               | Ansible Roles for automating network tools provisioning           |
| [security](https://aplatform64.readthedocs.io/en/latest/collections/security/)             | Ansible Roles for automating security tools provisioning          |
| [storage](https://aplatform64.readthedocs.io/en/latest/collections/storage/)               | Ansible Roles for automating storage management                   |
| [system](https://aplatform64.readthedocs.io/en/latest/collections/system/)                 | Ansible Roles for automating operating system management          |
| [web](https://aplatform64.readthedocs.io/en/latest/collections/web/)                       | Ansible Roles for automating web tools provisioning               |

Services are implemented in the form of Ansible playbooks.
Each playbook will integrate the roles needed to implement the service along with their own set of end-state and inventory configurations:

- Playbooks location: `playbooks/<SITE>/`
- End-State configuration location: `inventories/<SITE>/group_vars/<GROUP_NAME>/`
- Inventory definition: `inventories/<SITE>/<INVENTORY>.ini`

| Playbook                                                                                                         | Description                                       |
| ---------------------------------------------------------------------------------------------------------------- | ------------------------------------------------- |
| [manage_aplatform64_servers](https://aplatform64.readthedocs.io/en/latest/playbooks/manage_aplatform64_servers/) | Manage A:Platform64 Control node                  |
| [manage_aplatform64_nodes](https://aplatform64.readthedocs.io/en/latest/playbooks/manage_aplatform64_nodes/)     | Manage A:Platform64 Managed nodes                 |
| [manage_cloud_control_nodes](https://aplatform64.readthedocs.io/en/latest/playbooks/manage_cloud_control_nodes/) | Provision public cloud management tools           |
| [manage_dev_nodes](https://aplatform64.readthedocs.io/en/latest/playbooks/manage_dev_nodes/)                     | Provision software development environments       |
| [manage_doc_sites](https://aplatform64.readthedocs.io/en/latest/playbooks/manage_doc_sites/)                     | Provision documentation site management tools     |
| [manage_file_servers](https://aplatform64.readthedocs.io/en/latest/playbooks/manage_file_servers/)               | Manage file servers                               |
| [manage_git_servers](https://aplatform64.readthedocs.io/en/latest/playbooks/manage_git_servers/)                 | Manage GIT servers                                |
| [manage_hpc_nodes](https://aplatform64.readthedocs.io/en/latest/playbooks/manage_hpc_nodes/)                     | Provision high-performance computing environments |
| [manage_jenkins_controllers](https://aplatform64.readthedocs.io/en/latest/playbooks/manage_jenkins_controllers/) | Manage Jenkins controllers                        |
| [manage_jenkins_workers](https://aplatform64.readthedocs.io/en/latest/playbooks/manage_jenkins_workers/)         | Manage Jenkins workers                            |
| [manage_linux_servers](https://aplatform64.readthedocs.io/en/latest/playbooks/manage_linux_servers/)             | Manage Linux Servers                              |
| [manage_linux_workstations](https://aplatform64.readthedocs.io/en/latest/playbooks/manage_linux_workstations/)   | Manage Linux Workstations                         |
| [manage_macos_workstations](https://aplatform64.readthedocs.io/en/latest/playbooks/manage_macos_workstations/)   | Manage MacOS Workstations                         |
| [manage_office_nodes](https://aplatform64.readthedocs.io/en/latest/playbooks/manage_office_nodes/)               | Provision office productivity applications        |
| [manage_test_nodes](https://aplatform64.readthedocs.io/en/latest/playbooks/manage_test_nodes/)                   | Provision software testing tools                  |

## Deployment

### OS Compatibility

**A:Platform64** is compatible with the following Linux operating systems:

- AlmaLinux8
- CentOS8
- Debian10
- Debian11
- Fedora33
- Fedora35
- MacOSX12
- OracleLinux8
- OracleLinux9
- RedHat8
- RockyLinux8
- Ubuntu20
- Ubuntu21
- Ubuntu22

Notice that roles have their own compatibility matrix. Refer to the respective documentation for further details.

### Prerequisites

- Control Node:
  - Python 3
  - OpenSSH
  - Sudo
  - Regular user account with sudo privilege for running the installer
- Managed Nodes:
  - Python 3
  - OpenSSH
  - Sudo
  - Regular user account with sudo privilege for the bootstrap process

### Installation

- Download the installation script:

```shell
curl -O https://raw.githubusercontent.com/serdigital64/aplatform64/main/ap64
chmod 0755 ap64
```

- Run installation script with the default options. Curent user must have sudo privileges.

```shell
./ap64 -i
```

- Done, **A:Platform64** is now installed and ready to use:
  - installation location: `/opt/ap64`
  - installation user: `ap64`
  - CLI: `/opt/ap64/ap64`

## Usage

### Command Line Interface (CLI)

```shell
Usage: ap64 <-i|-j|-c|-o|-r|-u|-l|-n|-t|-k> [-s Site] [-x Host] [-p Playbook] [-e Collection|-f Package] [-b Root] [-d Var] [-g User] [-h]

A:Platform64 command line interface

Commands

  -i           : Install A:Platform64
  -j           : Bootstrap A:Platform64
  -c           : Create a A:Platform64 site
  -o           : Remove a A:Platform64 site
  -r           : Refresh A:Platform64 site configuration by rerunning the setup process
  -u           : Upgrade A:Platform64 Ansible collections to the latest version in Ansible Galaxy
  -l           : List available playbooks
  -n           : Run playbook
  -t           : List sites
  -k           : Add node

Flags

  -h           : Show usage info

Parameters

  -b Root      : APlatform64 root path. Default: /opt/ap64
  -d Var       : APlatform64 var path. Default: /var/opt/ap64
  -g User      : APlatform64 user name. Default: ap64
  -s Site      : Target Site. Defaul: site
  -x Host      : Target host for playbook run. Default: all
  -p Playbook  : Name of the playbook to run
  -e Collection: Collection name for the upgrade option (-u). Default: all
  -f Package   : Collection package file (-u). Default: none
```

### Common Use Cases

#### Register managed node

Use to register managed nodes.

The target node must be prepared for running Ansible (i.e.: have a compatible Linux distro, python3, sudo and openssh)

```shell
# Set bootstrap connection credentials. This is required for the initial connection only
export AP64_NODE_USER='sysadmin'
export AP64_NODE_PASSWORD='**change_me**'
# Register the host
/opt/ap64/ap64 -k -x 'host1.domain1'
```

#### Create Site

Use to create new environments. Each environment is an isolated set of inventories, playbooks and configurations

```shell
# Example: create site 'prod'
/opt/ap64/ap64 -c -s 'prod'

# List available sites
/opt/ap64/ap64 -t
```

#### Run A:Platform64 Playbook

```shell
# List available playbooks
/opt/ap64/ap64 -l

# Run example playbook on localhost
/opt/ap64/ap64 -n -p 'hello_world'
```

#### Upgrade A:Platform64 Collections

Use to upgrade collections from Ansible Galaxy

```shell
# Download and upgrade latest collections
/opt/ap64/ap64 -u

# Update site configuration
/opt/ap64/ap64 -r
```

## Contributing

Help on implementing new features and maintaining the code base is welcomed.

- [Contributing](https://aplatform64.readthedocs.io/en/latest/contributing/CONTRIBUTING/)
- [Contributor Covenant Code of Conduct](https://aplatform64.readthedocs.io/en/latest/contributing/CODE_OF_CONDUCT/)

## Author

- [SerDigital64](https://serdigital64.github.io/)

## License

[Apache-2.0](https://www.apache.org/licenses/LICENSE-2.0.txt)
