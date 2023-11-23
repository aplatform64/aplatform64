# Ansible Playbook: manage_file_servers

## Purpose

Manage file servers.

Supported features in the current version:

- Create file repository structure
- Install NFS server
- Export NFS shares

## Use Cases

### Deploy file server

- Verify that target nodes are registered in the inventory file: [file_service.ini](#inventory)
- Verify that target tools are selected in the playbook endstate file: [manage_file_servers.yml](#end-state)
- Run the playbook. Use the `-s <SITE>` parameter to select the target site.

```shell
/opt/aplatform64/bin/ap64.sh -n -p manage_file_servers -s <SITE>
```

## Playbook Parameters

### Inventory

Register the hosts that will consume the service in the Ansible Inventory file:

- File: `inventories/<SITE>/file_service.ini`
- Host Group: `file_servers`

### End State

A dedicated group_vars directory is used to store end-state configuration settings for both the playbook and related Ansible Roles.

Set playbook specific settings in the file: `inventories/<SITE>/group_vars/file_servers/manage_file_servers.yml`

```yaml
manage_file_servers_apps:
  repository:
  nfs:
```

| Parameter                           | Required? | Type       | Default | Purpose / Value                           |
| ----------------------------------- | --------- | ---------- | ------- | ----------------------------------------- |
| manage_file_servers_apps            | no        | dictionary |         | Define what applications will be deployed |
| manage_file_servers_apps.repository | no        | boolean    | `true`  | Deploy the application?                   |
| manage_file_servers_apps.nfs        | no        | boolean    | `true`  | Deploy the application?                   |

Additional role specific settings are available to further customize the playbook:

| A:Platform64 role                                                                 | group_vars file                                                 |
| --------------------------------------------------------------------------------- | --------------------------------------------------------------- |
| [serdigital64.storage.stg_repository](../roles/stg_repository.md#role-parameters) | `inventories/<SITE>/group_vars/file_servers/stg_repository.yml` |
| [serdigital64.storage.stg_nfs_server](../roles/stg_nfs_server.md#role-parameters) | `inventories/<SITE>/group_vars/file_servers/stg_nfs_server.yml` |

## Deployment

### OS Compatibility

OS compatibility is role dependant. Please refer to the respective role documentation.
- Ubuntu20
- Ubuntu21
- Fedora33
- Debian10
- Debian11

### Dependencies

Dependencies in this section are automatically solved during the installation process.

- Ansible Collections:
  - serdigital64.backup
  - serdigital64.storage
  - serdigital64.system

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
