---
title: "Ansible Playbook: manage_file_servers"
description: "Manage file servers"
authors:
  - SerDigital64
tags:
  - ansible
  - devops
  - linux
  - automation
---

# Ansible Playbook: manage_file_servers

## Purpose

Manage file servers.

Supported features in the current version:

-

## Use Cases

### X_USE_CASE_X

- Verify that target nodes are registered in the inventory file: [X_INVENTORY_NAME_X.ini](#inventory)
- Verify that target tools are selected in the playbook endstate file: [manage_file_servers.yml](#end-state)
- Run the playbook. Use the `-s <SITE>` parameter to select the target site.

```shell
/opt/aplatform64/bin/ap64.sh -n -p manage_file_servers -s <SITE>
```

## Playbook Parameters

### Inventory

Register the hosts that will consume the service in the Ansible Inventory file:

- File: `inventories/<SITE>/X_INVENTORY_NAME_X.ini`
- Host Group: `X_GROUP_NAME_X`

### End State

A dedicated group_vars directory is used to store end-state configuration settings for both the playbook and related Ansible Roles.

Set playbook specific settings in the file: `inventories/<SITE>/group_vars/X_GROUP_NAME_X/manage_file_servers.yml`

```yaml
manage_file_servers_apps:
  X_APP_NAME_X:
```

| Parameter                           | Required? | Type       | Default | Purpose / Value                           |
| ----------------------------------- | --------- | ---------- | ------- | ----------------------------------------- |
| manage_file_servers_apps              | no        | dictionary |         | Define what applications will be deployed |
| manage_file_servers_apps.X_APP_NAME_X | no        | boolean    | true    | Deploy the application?                   |

Additional role specific settings are available to further customize the playbook:

| A:Platform64 role                                                                | group_vars file                                                  |
| -------------------------------------------------------------------------------- | ---------------------------------------------------------------- |
| [serdigital64.core.core_repository](../roles/core_repository.md#role-parameters) | `inventories/<SITE>/group_vars/X_GROUP_NAME_X/core_repository.yml` |

## Deployment

### OS Compatibility

- CentOS8
- OracleLinux8
- Ubuntu20
- Ubuntu21
- Fedora33
- Debian10
- Debian11

### Dependencies

Dependencies in this section are automatically solved during the installation process.

- Ansible Collections:
  - serdigital64.backup
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
