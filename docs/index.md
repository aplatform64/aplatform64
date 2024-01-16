# Project: A:Platform64

```text
 █████╗    ██████╗ ██╗      █████╗ ████████╗███████╗ ██████╗ ██████╗ ███╗   ███╗ ██████╗ ██╗  ██╗
██╔══██╗██╗██╔══██╗██║     ██╔══██╗╚══██╔══╝██╔════╝██╔═══██╗██╔══██╗████╗ ████║██╔════╝ ██║  ██║
███████║╚═╝██████╔╝██║     ███████║   ██║   █████╗  ██║   ██║██████╔╝██╔████╔██║███████╗ ███████║
██╔══██║██╗██╔═══╝ ██║     ██╔══██║   ██║   ██╔══╝  ██║   ██║██╔══██╗██║╚██╔╝██║██╔═══██╗╚════██║
██║  ██║╚═╝██║     ███████╗██║  ██║   ██║   ██║     ╚██████╔╝██║  ██║██║ ╚═╝ ██║╚██████╔╝     ██║
╚═╝  ╚═╝   ╚═╝     ╚══════╝╚═╝  ╚═╝   ╚═╝   ╚═╝      ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝ ╚═════╝      ╚═╝
```

- [Project: A:Platform64](#project-aplatform64)
  - [Overview](#overview)
    - [Design Principles](#design-principles)
    - [Architecture](#architecture)
    - [Automation Scripts](#automation-scripts)
    - [Role Structure](#role-structure)
      - [Defaults](#defaults)
      - [Actions](#actions)
        - [Action: Prepare](#action-prepare)
        - [Action: Deploy](#action-deploy)
        - [Action: Setup](#action-setup)
        - [Action: Control](#action-control)
        - [Action: Provision](#action-provision)
    - [Operating System Compatibility](#operating-system-compatibility)
  - [Naming Convention](#naming-convention)
  - [Deployment](#deployment)
    - [Compatibility](#compatibility)
    - [Prerequisites](#prerequisites)
    - [Installation](#installation)
  - [Usage](#usage)
    - [Command Line Interface (CLI)](#command-line-interface-cli)
    - [Common Use Cases](#common-use-cases)
      - [Register managed node](#register-managed-node)
      - [Create Site](#create-site)
      - [Run A:Platform64 Playbook](#run-aplatform64-playbook)
      - [Upgrade A:Platform64 Collections](#upgrade-aplatform64-collections)
  - [Contributing](#contributing)
  - [Author](#author)
  - [License](#license)

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

### Role Structure

#### Defaults

- Used as an interface to expose role end-state attributes and action parameters

  | Path                                   | Purpose                                                                                           |
  | -------------------------------------- | ------------------------------------------------------------------------------------------------- |
  | defaults/                              | Root directory where Ansible will look for defaults                                               |
  | defaults/main/                         | Allow Ansible to use individual default definition files instead of a single main.yml entry point |
  | defaults/main/end_state_definition.yml | Declare what are the end-state attributes that the role will set.                                 |
  | defaults/main/action_parameters.yml    | Declare what parameters are available to define how role actions will behave.                     |

- All role attributes and parameters must be declared. If the variable doesn't have a default value then it must be initialized to the empty value associated to the variable type (number, string, dictionary, list)
- Complex variables (dictionaries, lists) must be further documented in the vars/dictionary.yml file
- State definition attributes are permanent and are intended to represent the desired state. Non-default values must be defined as `host_variables` or `group_variables` and are the main component for implementing the _infrastructure-as-code_ strategy
- Action parameter variables are dynamic and are reset every time the role is executed. This allows common roles to be executed several times without inheriting default settings from previous iterations.

#### Actions

##### Action: Prepare

- Purpose: prepare the role runtime environment.
- Common tasks:
  - Create users.
  - Create directory structures.

##### Action: Deploy

- Purpose: install application packages used by the role.
- Common tasks:
  - Install native operating system application packages.
  - Install application packages distributed as single archives.
  - Install application packages from GIT.
  - Install application packages from Snap.
  - Install application packages from FlatHub.

##### Action: Setup

- Purpose: setup configuration files used by the role.
- Common tasks:
  - Create configuration files
  - Update configuration files

##### Action: Control

- Purpose: control the execution of services managed by the role.
- Common tasks:
  - Star/Stop the service.
  - Refresh/Reload the service.

##### Action: Provision

- Purpose: perform provisioning tasks for content managed by the role.
- Common tasks: tasks are dependant on the role.

### Operating System Compatibility

- Roles that are tied to the underlying operating system version must add version compatibility check.
- Code must be prepared to minimize OS specific dependencies.
- OS specific dependencies must be encapsulated by either using OS ID keys in yaml dictionary or in stand-alone files.
- Variables for defining OS compatibility:
  - `<COLLECTION>_<ROLE>_platforms`: OS and version list
  - `<COLLECTION>_<ROLE>_os_family`: OS family list
- Typical places where OS compatibility is found:
  - `ROLEID/tasks/ROLEID_initialize.yml`
    - `- name: "ROLEID / Initialize / Check Platform compatibility"`
    - `- name: "ROLEID / Initialize / Set Platform specific variables"`
  - `ROLEID/var/main.yml`
    - `ROLEID_platforms:`
    - `ROLEID_os_family`
  - `ROLEID/var/platform-OSNAME.yml`
  - `auto_aplatform64/templates/roles/*`
- Core roles that must be updated to support new OS versions:
  - `auto_aplatform64`
  - `auto_ansible_control`
  - `auto_ansible_node`

## Naming Convention

- Collections
  - definition: represents a technology or service
  - lowercase
  - single word
- Roles
  - definition: represents a component of the technology managed by the collection
  - lowercase
  - words separate by \_
  - combined word: collection name + role name
  - template: collection_role
- Tasks
  - definition: represents a set of actions
  - lowercase
  - words separate by \_
  - combined word: collection name + role name + task name + subtask name
  - templates
    - collection_role_task.yml
    - collection_role_task_subtask.yml
- Defaults
  - main/state_definition.yml
  - main/action_parameters.yml
- Variables
  - lowercase
  - words separate by \_
  - combined word: collection name + role name + variable name
  - templates
    - collection_role_variable
    - collection_role\_\_\_temporary_variable

## Deployment

### Compatibility

**A:Platform64** CLI and core components are tested against a set of Linux OS versions and Ansible versions to determine compatibility:

- Ansible
  - Mininum: 2.11
  - Maximum: 2.13
- Linux OS
  - AlmaLinux8
  - CentOS8
  - Debian10, Debian11
  - Fedora33, Fedora35
  - MacOSX12
  - OracleLinux8, OracleLinux9
  - RedHat8
  - RockyLinux8
  - Ubuntu20, Ubuntu21, Ubuntu22

Remaining collections and roles are also tested but may have a different OS compatibility list.

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
curl -O https://raw.githubusercontent.com/aplatform64/aplatform64/main/ap64
chmod 0755 ap64
```

- Run installation script with the default options. Curent user must have root privilege with sudo.

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
Usage: ap64 <-i|-j|-c|-o|-r|-u|-l|-n|-t|-k> [-s Site] [-x Host] [-p Playbook] [-e Collection|-f Package] [-b Root] [-d Var] [-v Version] [-g User] [-V Verbose] [-D Debug] [-h]

A:Platform64 command line interface

Commands

  -i           : Install A:Platform64
  -j           : Bootstrap A:Platform64 (internal use only)
  -c           : Create a A:Platform64 site
  -o           : Remove a A:Platform64 site
  -r           : Refresh A:Platform64 site configuration by rerunning the setup process
  -u           : Upgrade A:Platform64 Ansible collections to the latest version in Ansible Galaxy
  -l           : List available playbooks
  -n           : Run playbook
  -t           : List sites
  -k           : Add managed node

Flags

  -h           : Show usage info

Parameters

  -b Root      : APlatform64 root path. Default: /opt/ap64
  -d Var       : APlatform64 var path. Default: /var/opt/ap64
  -g User      : APlatform64 user name. Default: ap64
  -v Version   : Ansible Core version for the controller node. Default: 2.13. Format: Major.Minor
  -s Site      : Target Site. Defaul: site
  -x Host      : Target host for playbook run. Default: all
  -p Playbook  : Name of the playbook to run
  -e Collection: Collection name for the upgrade option (-u). Default: all
  -f Package   : Collection package file (-u). Default: none
  -V Verbose   : Set verbosity level. Format: one of BL64_MSG_VERBOSE_*
  -D Debug     : Enable debugging mode. Format: one of BL64_DBG_TARGET_*
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

- [Contributing](https://aplatform64.readthedocs.io/en/latest/CONTRIBUTING)
- [Contributor Covenant Code of Conduct](https://aplatform64.readthedocs.io/en/latest/CODE_OF_CONDUCT)

## Author

- [SerDigital64](https://serdigital64.github.io)

## License

[Apache-2.0](https://www.apache.org/licenses/LICENSE-2.0.txt)
