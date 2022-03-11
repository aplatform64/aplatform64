# Ansible Playbook: manage_gitlab_servers

## Purpose

Manage GitLab servers.

Supported features in the current version:

- Deploy GitLab server

## Use Cases

### Deploy GIT server node

- Verify that target nodes are registered in the inventory file: [gitlab_service.ini](#inventory)
- Verify that target endstate is set: [manage_gitlab_servers.yml](#end-state)
- Run the playbook. Use the `-s <SITE>` parameter to select the target site.

```shell
/opt/aplatform64/bin/ap64.sh -n -p manage_gitlab_servers -s <SITE>
```

## Playbook Parameters

### Inventory

Register the hosts that will consume the service in the Ansible Inventory file:

- File: `inventories/<SITE>/gitlab_service.ini`
- Host Group: `gitlab_server_nodes`

### End State

A dedicated group_vars directory is used to store end-state configuration settings for both the playbook and related Ansible Roles.

Set playbook specific settings in the file: `inventories/<SITE>/group_vars/gitlab_server_nodes/manage_gitlab_servers.yml`

```yaml
manage_gitlab_servers_apps:
  gitlab:
```

| Parameter                         | Required? | Type       | Default | Purpose / Value                           |
| --------------------------------- | --------- | ---------- | ------- | ----------------------------------------- |
| manage_gitlab_servers_apps        | no        | dictionary |         | Define what applications will be deployed |
| manage_gitlab_servers_apps.gitlab | no        | boolean    | `true`  | Deploy the application?                   |

Additional role specific settings are available to further customize the playbook:

| A:Platform64 role                                                                        | group_vars file                                                            |
| ---------------------------------------------------------------------------------------- | -------------------------------------------------------------------------- |
| [serdigital64.system.sys_repository](../roles/sys_repository.md#role-parameters)         | `inventories/<SITE>/group_vars/gitlab_server_nodes/sys_repository.yml`     |

## Deployment

### OS Compatibility

- CentOS8
- OracleLinux8
- Fedora33
- Fedora35

### Dependencies

Dependencies in this section are automatically solved during the installation of A:Platform64.

- Ansible Collections:
  - serdigital64.backup
  - serdigital64.system
  - serdigital64.devops

### Prerequisites

- Ansible:
  - Control Node: A:Platform64 installed and configured.
  - Managed Nodes: target hosts prepared for A:Platform64 control.

### Installation Procedure

The playbook is automatically deployed during the [A:Platform64 installation](/#installation) process.

## Contributing

Help on implementing new features and maintaining the code base is welcomed.

Please see the [guidelines](https://aplatform64.readthedocs.io/en/latest/contributing/CONTRIBUTING) for further details.

## Author

- [SerDigital64](https://serdigital64.github.io/)

## License

[GPL-3.0-or-later](https://www.gnu.org/licenses/gpl-3.0.txt)
