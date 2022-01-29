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

**A:Platform64** is an automated infrastructure-as-code management platform based on Ansible for small to medium computing environments.

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
| [development](https://aplatform64.readthedocs.io/en/latest/collections/development/)       | Ansible Roles for automating development environment provisioning |
| [devops](https://aplatform64.readthedocs.io/en/latest/collections/devops/)                 | Ansible Roles for automating devops tools provisioning            |
| [hardware](https://aplatform64.readthedocs.io/en/latest/collections/hardware/)             | Ansible Roles for automating hardware drivers provisioning        |
| [hypervisor](https://aplatform64.readthedocs.io/en/latest/collections/hypervisor/)         | Ansible Roles for automating hypervisor tools provisioning        |
| [infrastructure](https://aplatform64.readthedocs.io/en/latest/collections/infrastructure/) | Ansible Roles for automating infrastructure tools provisioning    |
| [security](https://aplatform64.readthedocs.io/en/latest/collections/security/)             | Ansible Roles for automating security tools provisioning          |
| [storage](https://aplatform64.readthedocs.io/en/latest/collections/storage/)               | Ansible Roles for automating storage management                   |
| [system](https://aplatform64.readthedocs.io/en/latest/collections/system/)                 | Ansible Roles for automating operating system management          |
| [web](https://aplatform64.readthedocs.io/en/latest/collections/web/)                       | Ansible Roles for automating web tools provisioning               |

Services are implemented in the form of Ansible playbooks.
Each playbook will integrate the roles needed to implement the service along with their own set of end-state and inventory configurations:

- Playbooks location: `playbooks/<SITE>/`
- End-State configuration location: `inventories/<SITE>/group_vars/<GROUP_NAME>/`
- Inventory definition: `inventories/<SITE>/<INVENTORY>.ini`

| Playbook                                                                                                                   | Description                                                                |
| -------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------- |
| [bootstrap_ansible_managed_nodes](https://aplatform64.readthedocs.io/en/latest/playbooks/bootstrap_ansible_managed_nodes/) | Bootstrap Ansible Managed nodes                                            |
| [manage_ansible_control_nodes](https://aplatform64.readthedocs.io/en/latest/playbooks/manage_ansible_control_nodes/)       | Manage Ansible Control node                                                |
| [manage_ansible_managed_nodes](https://aplatform64.readthedocs.io/en/latest/playbooks/manage_ansible_managed_nodes/)       | Manage Ansible Managed nodes                                               |
| [manage_cloud_control_nodes](https://aplatform64.readthedocs.io/en/latest/playbooks/manage_cloud_control_nodes/)           | Provision public cloud management tools                                    |
| [manage_cloud_realm](https://aplatform64.readthedocs.io/en/latest/playbooks/manage_cloud_realm/)                           | Manage cloud provider accounts, users and organizations as a single entity |
| [manage_dev_nodes](https://aplatform64.readthedocs.io/en/latest/playbooks/manage_dev_nodes/)                               | Provision software development environments                                |
| [manage_doc_sites](https://aplatform64.readthedocs.io/en/latest/playbooks/manage_doc_sites/)                               | Provision documentation site management tools                              |
| [manage_git_server_nodes](https://aplatform64.readthedocs.io/en/latest/playbooks/manage_git_server_nodes/)                 | Manage GIT server nodes                                                    |
| [manage_hpc_nodes](https://aplatform64.readthedocs.io/en/latest/playbooks/manage_hpc_nodes/)                               | Provision high-performance computing environments                          |
| [manage_jenkins_controller_nodes](https://aplatform64.readthedocs.io/en/latest/playbooks/manage_jenkins_controller_nodes/) | Manage Jenkins Controller nodes                                            |
| [manage_jenkins_worker_nodes](https://aplatform64.readthedocs.io/en/latest/playbooks/manage_jenkins_worker_nodes/)         | Manage Jenkins Worker nodes                                                |
| [manage_linux_workstations](https://aplatform64.readthedocs.io/en/latest/playbooks/manage_linux_workstations/)             | Manage Linux Workstations                                                  |
| [manage_office_nodes](https://aplatform64.readthedocs.io/en/latest/playbooks/manage_office_nodes/)                         | Provision office productivity applications                                 |
| [manage_test_nodes](https://aplatform64.readthedocs.io/en/latest/playbooks/manage_test_nodes/)                             | Provision software testing tools                                           |

## Deployment

### OS Compatibility

**A:Platform64** is compatible with the following Linux operating systems:

- CentOS8
- OracleLinux8
- Ubuntu20
- Ubuntu21
- Fedora33
- Fedora35
- Debian10
- Debian11

Roles in the A:Platform64 collections have their own compatibility matrix. Refer to the role documentation for further details.

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

Download the installation script and resources:

- [install.sh](https://raw.githubusercontent.com/serdigital64/aplatform64/main/collections/serdigital64/automation/roles/auto_aplatform64/files/installer/install.sh)
- [install_helper.sh](https://raw.githubusercontent.com/serdigital64/aplatform64/main/collections/serdigital64/automation/roles/auto_aplatform64/files/installer/install_helper.sh)
- [install_helper.yml](https://raw.githubusercontent.com/serdigital64/aplatform64/main/collections/serdigital64/automation/roles/auto_aplatform64/files/installer/install_helper.yml)
- [bashlib64.bash](https://raw.githubusercontent.com/serdigital64/aplatform64/main/collections/serdigital64/automation/roles/auto_aplatform64/files/scripts/bashlib64.bash)

```shell
APLATFORM64_INSTALLER='https://raw.githubusercontent.com/serdigital64/aplatform64/main/collections/serdigital64/automation/roles/auto_aplatform64/files'
curl \
  -O "$APLATFORM64_INSTALLER/scripts/bashlib64.bash" \
  -O "$APLATFORM64_INSTALLER/installer/install.sh" \
  -O "$APLATFORM64_INSTALLER/installer/install_helper.sh" \
  -O "$APLATFORM64_INSTALLER/installer/install_helper.yml"
chmod 755 install.sh install_helper.sh
```

Run the installation script with the default options. See the [documentation](https://aplatform64.readthedocs.io/en/latest/bin/install/) for more options

```shell
./install.sh -x
```

Done. The **A:Platform64** platform is now installed.

## Usage

### Initialize the environment

To start using **A:Platform64** change to the Ansible Control user and set the environment:

```shell
# Switch to the Ansible Control user
sudo su - "$APLATFORM64_MANAGER"

# Set the environment for Ansible
source /opt/aplatform64/bin/site/ansible_control.env
workon aplatform64

# Go to the install location
cd /opt/aplatform64/
```

### Register managed hosts

Register the target remote host in the bootstrap process by adding it to the inventory:

- file: `inventories/site/ansible_service.ini`
- group `[bootstrap_ansible_managed_nodes_distro]`

The bootstrap process will connect to the managed node using a pre-existing user account with root privilege and then create the dedicated account for Ansible.

Register the bootstrap user details and review the dedicated user definition:

- file: `inventories/site/group_vars/bootstrap_ansible_managed_nodes/auto_ansible_node.yml`
  - variable `auto_ansible_node_bootstrap:`
  - variable `auto_ansible_node_user:`
- file: `inventories/site/group_vars/ansible_managed_nodes/auto_ansible_node.yml`
  - variable `auto_ansible_node_user:`

Execute the bootstrap process:

```shell
/opt/aplatform64/bin/ap64.sh -n -p bootstrap_ansible_managed_nodes -s "${APLATFORM64_SITE}"
```

The host is now ready for Ansible. Promote the hostname by removing it from the `[bootstrap_ansible_managed_nodes_distro]` group and adding it to:

- File: `inventories/site/ansible_service.ini`
- Host Group: `ansible_managed_nodes`

### Run automation scripts

Use any of the predefined playbooks and customize the default end-state definitions for the group or create per host definitions.

For example, to configure workstations and notebooks for office work:

1. Add the target hostname to the inventory: `inventories/site/office_nodes.ini`
2. Review default end-state configuration: `inventories/site/group_vars/office_nodes/*`
3. Run the playgook:

```shell
ansible-playbook \
  -i "inventories/${APLATFORM64_SITE}/office_nodes.ini" \
  "playbooks/${APLATFORM64_SITE}/manage_office_nodes.yml"
```

Additional playbooks and roles can be added to further customize the platform.

In addition to the standard ansible CLI commands, A:Platform64 provides the [bin/ap64.sh](https://aplatform64.readthedocs.io/en/latest/bin/ap64/) CLI that can be used for:

- List/Run playbooks
- List/Create sites
- Upgrade collections
- Update sites configurations

## Source Code

### Repositories

- Project GIT repository: [https://github.com/serdigital64/aplatform64](https://github.com/serdigital64/aplatform64)
- Project Ansible Galaxy repository: [https://galaxy.ansible.com/serdigital64](https://galaxy.ansible.com/serdigital64)
- Project Documentation: [https://aplatform64.readthedocs.io](https://aplatform64.readthedocs.io)

### Contributing

Help on implementing new features and maintaining the code base is welcomed.

Please see the [guidelines](contributing/guidelines.md) for further details and the [code of condact](contributing/cod.md).

### Author

- [SerDigital64](https://serdigital64.github.io/)

## License

[GPL-3.0-or-later](https://www.gnu.org/licenses/gpl-3.0.txt)
