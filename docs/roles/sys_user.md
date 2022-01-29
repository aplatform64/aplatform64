---
title: "Ansible Role: serdigital64.system.sys_user"
description: "Manage Unix users and groups provisioning"
authors:
  - SerDigital64
tags:
  - ansible
  - devops
  - linux
  - automation
---

# Ansible Role: serdigital64.system.sys_user

## Purpose

Manage Unix users and groups provisioning

Supported features in the current version:

- Add user
- Add group

The **sys_user** Ansible-Role is part of the [A:Platform64](https://github.com/serdigital64/aplatform64) project and is available in the [system](../collections/system.md) Ansible-Collection.

## Usage

The following example is an **Ansible Playbook** that includes all the supported features:

```yaml
{% include "../../collections/serdigital64/system/playbooks/sys_user.yml" %}
```

The playbook can be run by executing:

```shell
# Set ANSIBLE_COLLECTIONS_PATHS to the default location. Change as needed.
ANSIBLE_COLLECTIONS_PATHS="${HOME}/.ansible/collections"
ansible-playbook "${ANSIBLE_COLLECTIONS_PATHS}/ansible_collections/serdigital64/system/playbooks/sys_user.yml"
```

## Role Parameters

### Actions

- Use **action-parameters** to control what tasks are enabled for the role to execute.
- Parameters should be declared as task level vars as they are intented to be dynamic.

```yaml
sys_user:
  setup: false
```

| Parameter      | Required? | Type    | Default | Purpose / Value                |
| -------------- | --------- | ------- | ------- | ------------------------------ |
| sys_user.setup | no        | boolean | `false` | Enable user/group provisioning |

### End State

- Use **end-state** parameters to define the target state after role execution.
- Parameters should be declared in **host_vars** or **group_vars** as they are intended to be permanent.

```yaml
sys_user_accounts:
  - name:
    description:
    home:
    group:
    groups:
    shell:
    locked:
    password:
    hash:
    uid:
    expires:
    system:
    options:
      xdg:
sys_user_groups:
  - name:
    gid:
    system:
```

| Parameter                         | Required? | Type    | Default | Purpose / Value               |
| --------------------------------- | --------- | ------- | ------- | ----------------------------- |
| sys_user_accounts                 | no        | list    |         | List of user definitions      |
| sys_user_accounts.[0].name        | yes       | string  |         | Login name                    |
| sys_user_accounts.[0].description | no        | string  |         | User description              |
| sys_user_accounts.[0].home        | no        | string  |         | Home directory                |
| sys_user_accounts.[0].group       | no        | string  |         | Primary group                 |
| sys_user_accounts.[0].groups      | no        | list    |         | List of additional groups     |
| sys_user_accounts.[0].shell       | no        | string  |         | Full path to the shell        |
| sys_user_accounts.[0].locked      | no        | boolean |         | Is the account locked?        |
| sys_user_accounts.[0].password    | no        | string  |         | Initial user password (plain) |
| sys_user_accounts.[0].hash        | no        | string  |         | Initial user password (hash)  |
| sys_user_accounts.[0].uid         | no        | string  |         | Unix User ID                  |
| sys_user_accounts.[0].expires     | no        | string  |         | Expiration date               |
| sys_user_accounts.[0].system      | no        | boolean |         | Is this a system account?     |
| sys_user_accounts.[0].options.xdg | no        | boolean |         | Create XDG paths?             |
| sys_user_groups                   | no        | list    |         | List of group definitions     |
| sys_user_groups.[0].name          | yes       | string  |         | Group name                    |
| sys_user_groups.[0].gid           | no        | string  |         | Unix group ID                 |
| sys_user_groups.[0].system        | no        | string  |         | Is this a system group?       |

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

None

### Prerequisites

The Ansible engine must be already installed and configured for privileged access and remote execution.

### Installation Procedure

Manually install Ansible Collections from the Ansible Galaxy repository:

```shell
ansible-galaxy collection install --upgrade serdigital64.system
```

Automatic installation is also available by deploying [A:Platform64](https://aplatform64.readthedocs.io/en/latest/#deployment)

## Contributing

Help on implementing new features and maintaining the code base is welcomed.

Please see the [guidelines](../contributing/guidelines.md) for further details.

## Author

- [SerDigital64](https://serdigital64.github.io/)

## License

[GPL-3.0-or-later](https://www.gnu.org/licenses/gpl-3.0.txt)
...
