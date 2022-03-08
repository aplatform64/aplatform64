---
title: "Ansible Role: serdigital64.automation.auto_ansible_node"
description: "Automate the management of Ansible Managed Nodes"
authors:
  - SerDigital64
tags:
  - ansible
  - devops
  - linux
  - automation
---

# Ansible Role: serdigital64.automation.auto_ansible_node

## Purpose

Automate the management of Ansible Managed Nodes.

Supported features in the current version:

- Create managed node user.
- Grant root privilege to managed node user.
- Provision Ansible Control Node OpenSSH Key for password-less remote access.
- Deploy latest os provided version of python (bootstrap mode)os tools used by common Ansible modules. Package list is defined in the variables `auto_ansible_node_python3`.
- Deploy os tools used by common Ansible modules. Package list is defined in the variables `auto_ansible_node_tools`.
  - su
  - runuser
  - which

The **auto_ansible_node** Ansible-Role is part of the [A:Platform64](https://github.com/serdigital64/aplatform64) project and is available in the [automation](https://aplatform64.readthedocs.io/en/latest/collections/automation) Ansible-Collection.

## Usage

The following example is an **Ansible Playbook** that includes all the supported features:

[use this link if viewing the doc on github](https://github.com/aplatform64/automation/blob/main/playbooks/auto_ansible_node.yml)

```yaml
{% include "../../collections/serdigital64/automation/playbooks/auto_ansible_node.yml" %}
```

The playbook can be run by executing:

```shell
# Set ANSIBLE_COLLECTIONS_PATHS to the default location. Change as needed.
ANSIBLE_COLLECTIONS_PATHS="${HOME}/.ansible/collections"
ansible-playbook "${ANSIBLE_COLLECTIONS_PATHS}/ansible_collections/serdigital64/automation/playbooks/auto_ansible_node.yml"
```

## Role Parameters

### Actions

- Use **action-parameters** to control what tasks are enabled for the role to execute.
- Parameters should be declared as task level vars as they are intented to be dynamic.

```yaml
auto_ansible_node:
  prepare:
  deploy:
  provision:
  bootstrap:
```

| Parameter | Required? | Type    | Default | Purpose / Value           |
| --------- | --------- | ------- | ------- | ------------------------- |
| prepare   | no        | boolean | false   | Enable preparation tasks  |
| depploy   | no        | boolean | false   | Enable deployment tasks   |
| provision | no        | boolean | false   | Enable provisioning tasks |
| bootstrap | no        | boolean | false   | Enable bootstrap mode     |

### End State

- Use **end-state** parameters to define the target state after role execution.
- Parameters should be declared in **host_vars** or **group_vars** as they are intended to be permanent.

```yaml
auto_ansible_node_user:
  name:
  group:
  home:
  description:
  control_key:
  become_method:
auto_ansible_node_bootstrap:
  user:
  password:
  become_method:
  become_password:
```

| Parameter                                   | Required? | Type       | Default                  | Purpose / Value                   |
| ------------------------------------------- | --------- | ---------- | ------------------------ | --------------------------------- |
| auto_ansible_node_user                      | yes       | dictionary |                          | Define managed node user details  |
| auto_ansible_node_user.name                 | yes       | string     | `"amnode"`               | User name                         |
| auto_ansible_node_user.group                | yes       | string     | `"amnode"`               | User's primary group              |
| auto_ansible_node_user.home                 | yes       | string     | `"/home/amnode"`         | User's home directory             |
| auto_ansible_node_user.description          | yes       | string     | `"Ansible managed node"` | User description                  |
| auto_ansible_node_user.control_key          | yes       | string     |                          | Full path to the SSH public Key   |
| auto_ansible_node_user.become_method        | yes       | string     | `"sudo"`                 | Ansible become method             |
| auto_ansible_node_bootstrap                 | no        | dictionary |                          | Define bootstrap details          |
| auto_ansible_node_bootstrap.user            | yes       | string     | `"sysadmin"`             | User name                         |
| auto_ansible_node_bootstrap.password        | yes       | string     |                          | User's password (plain or vault)  |
| auto_ansible_node_bootstrap.become_method   | yes       | string     | `"sudo"`                 | Become method                     |
| auto_ansible_node_bootstrap.become_password | yes       | string     |                          | Become password (plain or vault)  |

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
  - ansible.posix
    - authorized_key

### Prerequisites

The Ansible engine must be already installed and configured for privileged access and remote execution.

In addition the following prerequisites must be met:

- Managed node:
  - Bootstrap user with sudo privilege
  - OS Packages:
    - OpenSSH server
    - Sudo
    - Python3

### Installation Procedure

Manually install Ansible Collections from the Ansible Galaxy repository:

```shell
ansible-galaxy collection install --upgrade serdigital64.automation
```

Automatic installation is also available by deploying [A:Platform64](https://aplatform64.readthedocs.io/en/latest/#deployment)

## Contributing

Help on implementing new features and maintaining the code base is welcomed.

Please see the [guidelines](https://aplatform64.readthedocs.io/en/latest/contributing/CONTRIBUTING) for further details.

## Author

- [SerDigital64](https://serdigital64.github.io/)

## License

[GPL-3.0-or-later](https://www.gnu.org/licenses/gpl-3.0.txt)
