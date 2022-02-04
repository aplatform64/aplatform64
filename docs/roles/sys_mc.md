---
title: "Ansible Role: serdigital64.system.sys_mc"
description: "Manage provisioning of the Midnight Commander tool"
authors:
  - SerDigital64
tags:
  - ansible
  - system
  - linux
  - automation
---

# Ansible Role: serdigital64.system.sys_mc

## Purpose

Manage provisioning of the Midnight Commander tool

Supported features in the current version:

- Deploy application. Packages are defined in the variable `sys_mc_profiles`.
- Setup application:
  - Create default configuration

The **sys_mc** Ansible-Role is part of the [A:Platform64](https://github.com/serdigital64/aplatform64) project and is available in the [system](../collections/system.md) Ansible-Collection.

## Usage

The following example is an **Ansible Playbook** that includes all the supported features:

[use this link if viewing the doc on github](../../collections/serdigital64/system/playbooks/sys_mc.yml)

```yaml
{% include "../../collections/serdigital64/system/playbooks/sys_mc.yml" %}
```

The playbook can be run by executing:

```shell
# Set ANSIBLE_COLLECTIONS_PATHS to the default location. Change as needed.
ANSIBLE_COLLECTIONS_PATHS="${HOME}/.ansible/collections"
ansible-playbook "${ANSIBLE_COLLECTIONS_PATHS}/ansible_collections/serdigital64/system/playbooks/sys_mc.yml"
```

## Role Parameters

### Actions

- Use **action-parameters** to control what tasks are enabled for the role to execute.
- Parameters should be declared as task level vars as they are intented to be dynamic.

```yaml
sys_mc:
  resolve_prereq:
  deploy:
  setup:
```

| Parameter             | Required? | Type    | Default | Purpose / Value                             |
| --------------------- | --------- | ------- | ------- | ------------------------------------------- |
| sys_mc.resolve_prereq | no        | boolean | `false` | Enable automatic resolution of prequisites  |
| sys_mc.deploy         | no        | boolean | `false` | Enable installation of application packages |
| sys_mc.setup          | no        | boolean | `false` | Enable application configuration            |

### End State

- Use **end-state** parameters to define the target state after role execution.
- Parameters should be declared in **host_vars** or **group_vars** as they are intended to be permanent.

```yaml
sys_mc_application:
  name:
  type:
  version:
  installed:
sys_mc_users:
  - name:
    group:
    home:
```

| Parameter                    | Required?   | Type       | Default    | Purpose / Value                    |
| ---------------------------- | ----------- | ---------- | ---------- | ---------------------------------- |
| sys_mc_application           | yes(deploy) | dictionary |            | Set application package end state  |
| sys_mc_application.name      | yes(deploy) | string     | `"mc"`     | Select application package name    |
| sys_mc_application.type      | yes(deploy) | string     | `"distro"` | Select application package type    |
| sys_mc_application.version   | yes(deploy) | string     | `"latest"` | Select application package version |
| sys_mc_application.installed | yes(deploy) | boolean    | `true`     | Set application package end state  |
| sys_mc_users                 | yes(setup)  | list       |            | List of users that will use MC     |
| sys_mc_users.0.name          | yes(setup)  | string     |            | User login name                    |
| sys_mc_users.0.group         | yes(setup)  | string     |            | User primary group                 |
| sys_mc_users.0.home          | yes(setup)  | string     |            | Home directory                     |

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

### Prerequisites

The Ansible engine must be already installed and configured for privileged access and remote execution.

In addition the following prerequisites can be automatically solved when running the playbook by setting the role action: `resolve_prereq: true`

- Package manager for the target application is installed and enabled.

### Installation Procedure

Manually install Ansible Collections from the Ansible Galaxy repository:

```shell
ansible-galaxy collection install serdigital64.system
```

Automatic installation is also available by deploying [A:Platform64](https://aplatform64.readthedocs.io/en/latest/#deployment)

## Contributing

Help on implementing new features and maintaining the code base is welcomed.

Please see the [guidelines](../contributing/guidelines.md) for further details.

## Author

- [SerDigital64](https://serdigital64.github.io/)

## License

[GPL-3.0-or-later](https://www.gnu.org/licenses/gpl-3.0.txt)
