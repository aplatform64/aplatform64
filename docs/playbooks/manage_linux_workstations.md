---
title: "Ansible Playbook: manage_linux_workstations"
description: "Manage Linux Workstations"
authors:
  - SerDigital64
tags:
  - ansible
  - devops
  - linux
  - automation
---

# Ansible Playbook: manage_linux_workstations

## Purpose

Manage Linux Workstations.

Supported features in the current version:

- Create users and groups
- Provision and configure shells
- Provision and configure AutoFS
- Install fonts
- Install native Desktop Managers
  - Cinnamon
- Install GUI-based tools
  - Tilix
- Install TUI-based tools
  - mc

## Use Cases

### Provision users to Linux Workstation

- Verify that target nodes are registered in the inventory file: [linux_workstations.ini](#inventory)
- Verify that target endstate is set: [manage_linux_workstations.yml](#end-state)
- Run the playbook. Use the `-s <SITE>` parameter to select the target site.

```shell
/opt/aplatform64/bin/ap64.sh -n -p manage_linux_workstations -s <SITE>
```

## Playbook Parameters

### Inventory

Register the hosts that will consume the service in the Ansible Inventory file:

- File: `inventories/<SITE>/linux_workstations.ini`
- Host Group: `linux_workstations`

### End State

A dedicated group_vars directory is used to store end-state configuration settings for both the playbook and related Ansible Roles.

Set playbook specific settings in the file: `inventories/<SITE>/group_vars/linux_workstations/manage_linux_workstations.yml`

```yaml
linux_workstations_component:
  autofs:
  cinnamon:
  fonts:
  mc:
  shell:
  tilix:
  users:
```

| Parameter                             | Required? | Type       | Default | Purpose / Value                           |
| ------------------------------------- | --------- | ---------- | ------- | ----------------------------------------- |
| linux_workstations_component          | no        | dictionary |         | Define what applications will be deployed |
| linux_workstations_component.autofs   | no        | boolean    | `false` | Deploy the environment?                   |
| linux_workstations_component.cinnamon | no        | boolean    | `false` | Deploy the environment?                   |
| linux_workstations_component.fonts    | no        | boolean    | `false` | Provision fonts?                          |
| linux_workstations_component.mc       | no        | boolean    | `false` | Deploy the tool?                          |
| linux_workstations_component.shell    | no        | boolean    | `true`  | Deploy and configure shells?              |
| linux_workstations_component.tilix    | no        | boolean    | `false` | Deploy the tool?                          |
| linux_workstations_component.users    | no        | boolean    | `true`  | Provision users and groups?               |

Additional role specific settings are available to further customize the playbook:

| A:Platform64 role                                                                | group_vars file                                                        |
| -------------------------------------------------------------------------------- | ---------------------------------------------------------------------- |
| [serdigital64.system.sys_repository](../roles/sys_repository.md#role-parameters) | `inventories/<SITE>/group_vars/linux_workstations/sys_repository.yml` |
| [serdigital64.system.sys_shell](../roles/sys_shell.md#role-parameters)           | `inventories/<SITE>/group_vars/linux_workstations/sys_shell.yml`      |
| [serdigital64.system.sys_user](../roles/sys_user.md#role-parameters)             | `inventories/<SITE>/group_vars/linux_workstations/sys_user.yml`       |
| [serdigital64.storage.stg_autofs](../roles/stg_autofs.md#role-parameters)        | `inventories/<SITE>/group_vars/linux_workstations/stg_autofs.yml`      |

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

Dependencies in this section are automatically solved during the installation process.

- Ansible Collections:
  - serdigital64.backup
  - serdigital64.system
  - serdigital64.system

### Prerequisites

- Ansible:
  - Control Node: A:Platform64 installed and configured
  - Managed Nodes: target hosts prepared for A:Platform64 control

### Installation Procedure

The playbook is automatically deployed during the [A:Platform64 installation](/#installation) process

## Contributing

Help on implementing new features and maintaining the code base is welcomed.

Please see the [guidelines](../contributing/guidelines.md) for further details.

## Author

- [SerDigital64](https://serdigital64.github.io/)

## License

[GPL-3.0-or-later](https://www.gnu.org/licenses/gpl-3.0.txt)
