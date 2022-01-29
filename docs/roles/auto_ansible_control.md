---
title: "Ansible Role: serdigital64.automation.auto_ansible_control"
description: "Automate the management of Ansible Control Node"
authors:
  - SerDigital64
tags:
  - ansible
  - devops
  - linux
  - automation
---

# Ansible Role: serdigital64.automation.auto_ansible_control

## Purpose

Automate the management of Ansible Control Node.

Supported features in the current version:

- Create directory structure.
- Setup configuration files:
  - ansible.cfg
  - ansible common options
- Create OpenSSH Public/Private key pair for Ansible Managed Nodes
- Register Ansible Managed Nodes`s OpenSSH server keys in known_hosts file.
- Create shell environment script for setting Ansible variables.

The **auto_ansible_control** Ansible-Role is part of the [A:Platform64](https://github.com/serdigital64/aplatform64) project and is available in the [application](../collections/automation.md) Ansible-Collection.

## Directory structure

The directory structure is based on the collection structure recommended by Ansible documentation and extended to hold all the assets that the Ansible Control node will require to manage the target environment.

Content is separated into two main groups:

- root: infrastructure-as-code content that can be added to a GIT repository. Path is defined in the `auto_ansible_control_paths.root` variable.
- var: temporary files, not to be added to GIT. Path is defined in the `auto_ansible_control_paths.var` variable.

Additional directories are create to further organize content. The full list is defined in `auto_ansible_control_base` variable.

| Path                | Content                                                          | Ansible Variable                                                 |
| ------------------- | ---------------------------------------------------------------- | ---------------------------------------------------------------- |
| `root/etc/cfg`      | Ansible configuration files                                      | ANSIBLE_CONFIG                                                   |
| `root/etc/keys`     | OpenSSH key pairs                                                | ANSIBLE_PRIVATE_KEY_FILE                                         |
| `root/etc/tokens`   | API tokens                                                       | ANSIBLE_GALAXY_TOKEN_PATH                                        |
| `root/bin/`         | Shell scripts                                                    |                                                                  |
| `root/inventories/` | Ansible inventory files, host_vars and group_vars                | ANSIBLE_INVENTORY                                                |
| `root/playbooks/`   | Ansible Playbooks                                                | ANSIBLE_PLAYBOOK_DIR                                             |
| `root/collections/` | Collections installed from Ansible-Galaxy                        | ANSIBLE_COLLECTIONS_PATHS                                        |
| `root/roles/`       | Custom site-specific Ansible Roles                               | ANSIBLE_ROLES_PATH                                               |
| `root/files/`       | Custom site-specific data files                                  |                                                                  |
| `root/templates/`   | Custom site-specific Ansible Templates                           |                                                                  |
| `root/vars/`        | Custom site-specific Ansible variables                           |                                                                  |
| `root/tests/`       | Ansible playbooks for testing Custom Ansible Roles and Playbooks |                                                                  |
| `root/docs/`        | Repository for storing site-specific documentation               |                                                                  |
| `var/cache`         | General purpose cache                                            | ANSIBLE_CACHE_PLUGIN_CONNECTION, ANSIBLE_GALAXY_CACHE_DIR        |
| `var/logs`          | General purpose log store                                        | ANSIBLE_LOG_PATH                                                 |
| `var/persistence`   | General purpose persistence store                                | ANSIBLE_PERSISTENT_CONTROL_PATH_DIR,ANSIBLE_SSH_CONTROL_PATH_DIR |
| `var/tmp`           | General purpose ephemeral store                                  | ANSIBLE_RETRY_FILES_SAVE_PATH                                    |

The directory structure incorporates the concept of sites:

- Sites are used to isolate group of hosts from each other. For example, create separate sites for production, development, testing environments.
- Each content directory will have additional subdirectories to hold each site. For example:
  - etc/cfg/prod
  - etc/cfg/dev
  - etc/cfg/qa
- Sites can be activated by using the corresponding environment load script. For example, to set the environment for the `prod` site: `source ansible_control-prod.sh`

## Usage

The following example is an **Ansible Playbook** that includes all the supported features:

```yaml
{% include "../../collections/serdigital64/automation/playbooks/auto_ansible_control.yml" %}
```

The playbook can be run by executing:

```shell
# Set ANSIBLE_COLLECTIONS_PATHS to the default location. Change as needed.
ANSIBLE_COLLECTIONS_PATHS="${HOME}/.ansible/collections"
ansible-playbook "${ANSIBLE_COLLECTIONS_PATHS}/ansible_collections/serdigital64/automation/playbooks/auto_ansible_control.yml"
```

## Role Parameters

### Actions

- Use **action-parameters** to control what tasks are enabled for the role to execute.
- Parameters should be declared as task level vars as they are intented to be dynamic.

```yaml
auto_ansible_control:
  resolve_prereq:
  prepare:
  setup:
  provision:
```

| Parameter                           | Required? | Type    | Default | Purpose / Value                                 |
| ----------------------------------- | --------- | ------- | ------- | ----------------------------------------------- |
| auto_ansible_control.resolve_prereq | no        | boolean | `false` | Enable automatic resolution of prequisites      |
| auto_ansible_control.prepare        | no        | boolean | `false` | Enable preparation of the runtime environment   |
| auto_ansible_control.setup          | no        | boolean | `false` | Enable configuration of the runtime environment |
| auto_ansible_control.provision      | no        | boolean | `false` | Enable processing of SSH keys                   |

### End State

- Use **end-state** parameters to define the target state after role execution.
- Parameters should be declared in **host_vars** or **group_vars** as they are intended to be permanent.

```yaml
auto_ansible_control_site:
auto_ansible_control_node:
auto_ansible_control_python:
auto_ansible_control_users:
  control:
    name:
    group:
    home:
auto_ansible_control_paths:
  root:
  var:
auto_ansible_control_key:
  type:
  size:
auto_ansible_control_managed:
```

| Parameter                                | Required? | Type       | Default                | Purpose / Value                                                                   |
| ---------------------------------------- | --------- | ---------- | ---------------------- | --------------------------------------------------------------------------------- |
| auto_ansible_control_site                | no        | string     | `"site"`               | Short name of the site that will be managed by A:Platform64                       |
| auto_ansible_control_node                | no        | string     | `"localhost"`          | Ansible Control Node\`s hostname. The hostname must resolve to a valid IP address |
| auto_ansible_control_python              | no        | string     | `"/usr/bin/python3.9"` | Set the path to the Python 3.9 interpreter                                        |
| auto_ansible_control_users               | yes       | dictionary |                        | Define what users will use the automation platform                                |
| auto_ansible_control_users.control       | yes       | dictionary |                        | Define the user that will own and run tasks on the Ansible Control Node           |
| auto_ansible_control_users.control.name  | yes       | string     | `"sitectl"`            | User's login name                                                                 |
| auto_ansible_control_users.control.group | yes       | string     | `"sitectl"`            | User's primary group name                                                         |
| auto_ansible_control_users.control.home  | yes       | string     | `"/home/sitectl"`      | User's home directory                                                             |
| auto_ansible_control_paths               | yes       | dictionary |                        | Define where will A:Platform64 be installed to                                    |
| auto_ansible_control_paths.root          | yes       | string     | `"/opt/sitectl"`       | Base directory for collections, roles, configuration                              |
| auto_ansible_control_paths.var           | yes       | string     | `"/var/opt/sitectl"`   | Base directory for logs, cache, temporary content                                 |
| auto_ansible_control_key                 | no        | dictionary |                        | Define OpenSSH key parameters                                                     |
| auto_ansible_control_key.type            | no        | string     | `"ed25519"`            | Key type. Valid values: as accepted by ssh-keygen                                 |
| auto_ansible_control_key.size            | no        | string     |                        | Key size                                                                          |
| auto_ansible_control_managed             | no        | list       |                        | List of Ansible Managed Hosts controlled by this Ansible Control node             |

## Deployment

### OS Compatibility

- CentOS8
- OracleLinux8
- Ubuntu20
- Ubuntu21
- Fedora33
- Fedora35
- Debian10
- Debian11

### Dependencies

- Ansible Collections:
  - serdigital64.backup
    - bkp_archive
  - serdigital64.system
    - sys_package
    - sys_repository
  - serdigital64.security
    - sec_openssh_client
    - sec_key_ssh

### Prerequisites

The Ansible engine must be already installed and configured for privileged access and remote execution.

### Installation Procedure

Manually install Ansible Collections from the Ansible Galaxy repository:

```shell
ansible-galaxy collection install --upgrade serdigital64.automation
```

Automatic installation is also available by deploying [A:Platform64](https://aplatform64.readthedocs.io/en/latest/#deployment)

## Contributing

Help on implementing new features and maintaining the code base is welcomed.

Please see the [guidelines](../contributing/guidelines.md) for further details.

## Author

- [SerDigital64](https://serdigital64.github.io/)

## License

[GPL-3.0-or-later](https://www.gnu.org/licenses/gpl-3.0.txt)
