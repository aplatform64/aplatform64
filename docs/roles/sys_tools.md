---
title: "Ansible Role: serdigital64.system.sys_tools"
description: "Manage basic OS tools provisioning"
authors:
  - SerDigital64
tags:
  - ansible
  - devops
  - linux
  - automation
---

# Ansible Role: serdigital64.system.sys_tools

## Purpose

Manage basic OS tools provisioning.

Supported features in the current version:

- Deploy tools:
  - less
  - groff
  - file

The **sys_tools** Ansible-Role is part of the [A:Platform64](https://github.com/serdigital64/aplatform64) project and is available in the [system](../collections/system.md) Ansible-Collection.

## Usage

The following example is an **Ansible Playbook** that includes all the supported features:

```yaml
{% include "../../collections/serdigital64/system/playbooks/sys_tools.yml" %}
```

The playbook can be run by executing:

```shell
# Set ANSIBLE_COLLECTIONS_PATHS to the default install location. Change as needed.
ANSIBLE_COLLECTIONS_PATHS="${HOME}/.ansible/collections"
ansible-playbook "${ANSIBLE_COLLECTIONS_PATHS}/ansible_collections/serdigital64/system/playbooks/sys_tools.yml"
```

## Role Parameters

### Actions

- Use **action-parameters** to control what tasks are enabled for the role to execute.
- Parameters should be declared as task level vars as they are intented to be dynamic.

```yaml
sys_tools:
  resolve_prereq:
  deploy:
```

| Parameter                | Required? | Type    | Default | Purpose / Value                             |
| ------------------------ | --------- | ------- | ------- | ------------------------------------------- |
| sys_tools.resolve_prereq | no        | boolean | `false` | Enable automatic resolution of prequisites  |
| sys_tools.deploy         | no        | boolean | `false` | Enable installation of application packages |

### End State

- Use **end-state** parameters to define the target state after role execution.
- Parameters should be declared in **host_vars** or **group_vars** as they are intended to be permanent.

```yaml
sys_tools_catalog:
  file:
  groff:
  less:
```

| Parameter               | Required? | Type       | Default | Purpose / Value        |
| ----------------------- | --------- | ---------- | ------- | ---------------------- |
| sys_tools_catalog       | no        | dictionary |         | Define available tools |
| sys_tools_catalog.file  | no        | boolean    | `false` | Install the tool?      |
| sys_tools_catalog.groff | no        | boolean    | `false` | Install the tool?      |
| sys_tools_catalog.less  | no        | boolean    | `false` | Install the tool?      |

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
