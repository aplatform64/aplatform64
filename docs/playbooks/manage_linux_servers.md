# Ansible Playbook: manage_linux_servers

## Purpose

Manage Linux Servers.

Supported features in the current version:

- Configure IAM
  - Create users
  - Create groups
  - Create sudoers rules
- Provision and configure shells
- Provision and configure AutoFS
- Install fonts
- Install and configure TUI-based tools
  - mc
- Provision container engines
  - docker
  - podman
- Configure OpenSSH
  - client
  - server

## Use Cases

### Provision users to Linux Workstation

- Verify that target nodes are registered in the inventory file: [linux_servers.ini](#inventory)
- Verify that target endstate is set: [manage_linux_servers.yml](#end-state)
- Run the playbook. Use the `-s <SITE>` parameter to select the target site.

```shell
/opt/aplatform64/bin/ap64.sh -n -p manage_linux_servers -s <SITE>
```

## Playbook Parameters

### Inventory

Register the hosts that will consume the service in the Ansible Inventory file:

- File: `inventories/<SITE>/linux_servers.ini`
- Host Group: `linux_servers`

### End State

A dedicated group_vars directory is used to store end-state configuration settings for both the playbook and related Ansible Roles.

Set playbook specific settings in the file: `inventories/<SITE>/group_vars/linux_servers/manage_linux_servers.yml`

```yaml
linux_servers_component:
  autofs:
  docker:
  fonts:
  mc:
  openssh_client:
  openssh_server:
  podman:
  shell:
  sudo:
  users:
```

| Parameter                              | Required? | Type       | Default | Purpose / Value                           |
| -------------------------------------- | --------- | ---------- | ------- | ----------------------------------------- |
| linux_servers_component                | no        | dictionary |         | Define what applications will be deployed |
| linux_servers_component.autofs         | no        | boolean    | `false` | Enable components?                        |
| linux_servers_component.docker         | no        | boolean    | `false` | Enable components?                        |
| linux_servers_component.fonts          | no        | boolean    | `true`  | Enable components?                        |
| linux_servers_component.mc             | no        | boolean    | `true`  | Enable components?                        |
| linux_servers_component.openssh_client | no        | boolean    | `true`  | Enable components?                        |
| linux_servers_component.openssh_server | no        | boolean    | `true`  | Enable components?                        |
| linux_servers_component.podman         | no        | boolean    | `false` | Enable components?                        |
| linux_servers_component.sudo           | no        | boolean    | `true`  | Enable components?                        |
| linux_servers_component.shell          | no        | boolean    | `true`  | Enable components?                        |
| linux_servers_component.users          | no        | boolean    | `true`  | Enable components?                        |

Additional role specific settings are available to further customize the playbook:

| A:Platform64 role                                                                | group_vars file                                                  |
| -------------------------------------------------------------------------------- | ---------------------------------------------------------------- |
| [serdigital64.system.sys_mc](../roles/sys_mc.md#role-parameters)                 | `inventories/<SITE>/group_vars/linux_servers/sys_mc.yml`         |
| [serdigital64.system.sys_repository](../roles/sys_repository.md#role-parameters) | `inventories/<SITE>/group_vars/linux_servers/sys_repository.yml` |
| [serdigital64.system.sys_sudo](../roles/sys_sudo.md#role-parameters)             | `inventories/<SITE>/group_vars/linux_servers/sys_sudo.yml`       |
| [serdigital64.system.sys_shell](../roles/sys_shell.md#role-parameters)           | `inventories/<SITE>/group_vars/linux_servers/sys_shell.yml`      |
| [serdigital64.system.sys_user](../roles/sys_user.md#role-parameters)             | `inventories/<SITE>/group_vars/linux_servers/sys_user.yml`       |
| [serdigital64.storage.stg_autofs](../roles/stg_autofs.md#role-parameters)        | `inventories/<SITE>/group_vars/linux_servers/stg_autofs.yml`     |

## Deployment

### OS Compatibility

OS compatibility is role dependant. Please refer to the respective role documentation.

### Dependencies

Dependencies in this section are automatically solved during the installation process.

- Ansible Collections:
  - serdigital64.backup
  - serdigital64.container
  - serdigital64.security
  - serdigital64.system
  - serdigital64.storage

### Prerequisites

- Ansible:
  - Control Node: A:Platform64 installed and configured
  - Managed Nodes: target hosts prepared for A:Platform64 control

### Installation Procedure

The playbook is automatically deployed during the [A:Platform64 installation](/#installation) process

## Contributing

Help on implementing new features and maintaining the code base is welcomed.

Please see the [guidelines](https://aplatform64.readthedocs.io/en/latest/CONTRIBUTING) for further details.

## Author

- [SerDigital64](https://serdigital64.github.io/)

## License

[GPL-3.0-or-later](https://www.gnu.org/licenses/gpl-3.0.txt)
