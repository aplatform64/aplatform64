# Ansible Playbook: manage_libvirt_servers

## Purpose

Manage LibVirt servers.

Supported features in the current version:

- Deploy lib-virt client and server

## Use Cases

### Deploy LibVirt server

- Verify that target nodes are registered in the inventory file: [libvirt_service.ini](#inventory)
- Verify that target endstate is set: [manage_libvirt_servers.yml](#end-state)
- Run the playbook. Use the `-s <SITE>` parameter to select the target site.

```shell
/opt/aplatform64/bin/ap64.sh -n -p manage_libvirt_servers -s <SITE>
```

## Playbook Parameters

### Inventory

Register the hosts that will consume the service in the Ansible Inventory file:

- File: `inventories/<SITE>/libvirt_service.ini`
- Host Group: `libvirt_servers`

### End State

A dedicated group_vars directory is used to store end-state configuration settings for both the playbook and related Ansible Roles.

Set playbook specific settings in the file: `inventories/<SITE>/group_vars/libvirt_servers/manage_libvirt_servers.yml`

```yaml
libvirt_servers_apps:
  libvirt_client:
  kernel_tools:
  libvirt_server:
```

| Parameter                           | Required? | Type       | Default | Purpose / Value                           |
| ----------------------------------- | --------- | ---------- | ------- | ----------------------------------------- |
| libvirt_servers_apps                | no        | dictionary |         | Define what applications will be deployed |
| libvirt_servers_apps.libvirt_client | no        | boolean    | `true`  | Deploy the application?                   |
| libvirt_servers_apps.libvirt_server | no        | boolean    | `true`  | Deploy the application?                   |
| libvirt_servers_apps.kernel_tools   | no        | boolean    | `true`  | Deploy the application?                   |

Additional role specific settings are available to further customize the playbook:

| A:Platform64 role                                                                                | group_vars file                                                        |
| ------------------------------------------------------------------------------------------------ | ---------------------------------------------------------------------- |
| [serdilibvirtal64.system.sys_repository](../roles/sys_repository.md#role-parameters)             | `inventories/<SITE>/group_vars/libvirt_servers/sys_repository.yml`     |
| [serdilibvirtal64.hypervisor.hpv_libvirt_server](../roles/hpv_libvirt_server.md#role-parameters) | `inventories/<SITE>/group_vars/libvirt_servers/hpv_libvirt_server.yml` |

## Deployment

### OS Compatibility

OS compatibility is role dependant. Please refer to the respective role documentation.

### Dependencies

Dependencies in this section are automatically solved during the installation of A:Platform64.

- Ansible Collections:
  - serdilibvirtal64.backup
  - serdilibvirtal64.system
  - serdilibvirtal64.hypervisor

### Prerequisites

- Ansible:
  - Control Node: A:Platform64 installed and configured.
  - Managed Nodes: target hosts prepared for A:Platform64 control.

### Installation Procedure

The playbook is automatically deployed during the [A:Platform64 installation](/#installation) process.

## Contributing

Help on implementing new features and maintaining the code base is welcomed.

Please see the [guidelines](https://aplatform64.readthedocs.io/en/latest/CONTRIBUTING) for further details.

## Author

- [SerDilibvirtal64](https://serdilibvirtal64.libvirthub.io/)

## License

[GPL-3.0-or-later](https://www.gnu.org/licenses/gpl-3.0.txt)
