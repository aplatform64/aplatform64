# Ansible Playbook: manage_hpc_nodes

## Purpose

Provision high-performance computing environments.

Supported features in the current version:

- Deploy OpenCL environment
- Deploy AMD GPU drivers

## Use Cases

### Deploy high-performance computing environment

- Verify that target nodes are registered in the inventory file: [hpc_nodes.ini](#inventory)
- Verify that target endstate is set: [manage_hpc_nodes.yml](#end-state)
- Run the playbook. Use the `-s <SITE>` parameter to select the target site.

```shell
/opt/aplatform64/bin/ap64.sh -n -p manage_hpc_nodes -s <SITE>
```

## Playbook Parameters

### Inventory

Register the hosts that will consume the service in the Ansible Inventory file:

- File: `inventories/<SITE>/hpc_nodes.ini`
- Host Group: `hpc_nodes`

### End State

A dedicated group_vars directory is used to store end-state configuration settings for both the playbook and related Ansible Roles.

Set playbook specific settings in the file: `inventories/<SITE>/group_vars/hpc_nodes/manage_hpc_nodes.yml`

```yaml
manage_hpc_nodes_apps:
  opencl:
  gpu_amd:
```

| Parameter                     | Required? | Type       | Default | Purpose / Value                           |
| ----------------------------- | --------- | ---------- | ------- | ----------------------------------------- |
| manage_hpc_nodes_apps         | yes       | dictionary |         | Define what applications will be deployed |
| manage_hpc_nodes_apps.opencl  | no        | boolean    | `false` | Deploy the application?                   |
| manage_hpc_nodes_apps.gpu_amd | no        | boolean    | `false` | Deploy the application?                   |

Additional role specific settings are available to further customize the playbook:

| A:Platform64 role                                                                | group_vars file                                              |
| -------------------------------------------------------------------------------- | ------------------------------------------------------------ |
| [serdigital64.system.sys_repository](../roles/sys_repository.md#role-parameters) | `inventories/<SITE>/group_vars/hpc_nodes/sys_repository.yml` |

## Deployment

### OS Compatibility

OS compatibility is role dependant. Please refer to the respective role documentation.

### Dependencies

Dependencies in this section are automatically solved during the installation of A:Platform64.

- Ansible Collections:
  - serdigital64.backup
  - serdigital64.system
  - serdigital64.development
  - serdigital64.hardware

### Prerequisites

- Ansible:
  - Control Node: A:Platform64 installed and configured.
  - Managed Nodes: target hosts prepared for A:Platform64 control.

### Installation Procedure

The playbook is automatically deployed during the [A:Platform64 installation](../index.md#installation) process.

## Contributing

Help on implementing new features and maintaining the code base is welcomed.

Please see the [guidelines](https://aplatform64.readthedocs.io/en/latest/CONTRIBUTING) for further details.

## Author

- [SerDigital64](https://serdigital64.github.io/)

## License

[GPL-3.0-or-later](https://www.gnu.org/licenses/gpl-3.0.txt)
