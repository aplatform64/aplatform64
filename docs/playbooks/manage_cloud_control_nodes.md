# Ansible Playbook: manage_cloud_control_nodes

## Purpose

Provision public cloud management tools.

Supported features in the current version:

- Install cloud management tools for:
  - Amazon AWS
  - Microsoft Azure
  - Google Cloud
  - IBM Cloud
  - Cloud Foundry
- Install infrastructure provisioners:
  - Terraform

## Use Cases

### Deploy public cloud management tools

- Verify that target nodes are registered in the inventory file: [cloud_control_nodes.ini](#inventory)
- Verify that target tools are selected in the playbook endstate file: [manage_cloud_control_nodes.yml](#end-state)
- Run the playbook. Use the `-s <SITE>` parameter to select the target site.

```shell
/opt/aplatform64/bin/ap64.sh -n -p manage_cloud_control_nodes -s <SITE>
```

## Playbook Parameters

### Inventory

Register the hosts that will consume the service in the Ansible Inventory file:

- File: `inventories/<SITE>/cloud_control_nodes.ini`
- Host Group: `cloud_control_nodes`

### End State

A dedicated group_vars directory is used to store end-state configuration settings for both the playbook and related Ansible Roles.

Set playbook specific settings in the file: `inventories/<SITE>/group_vars/cloud_control_nodes/manage_cloud_control_nodes.yml`

```yaml
cloud_control_nodes_apps:
  aws:
  azure:
  foundry:
  google:
  ibm:
  terraform:
```

| Parameter                          | Required? | Type       | Default | Purpose / Value                           |
| ---------------------------------- | --------- | ---------- | ------- | ----------------------------------------- |
| cloud_control_nodes_apps           | yes       | dictionary |         | Define what applications will be deployed |
| cloud_control_nodes_apps.aws       | no        | boolean    | `true`  | Deploy the application?                   |
| cloud_control_nodes_apps.azure     | no        | boolean    | `true`  | Deploy the application?                   |
| cloud_control_nodes_apps.foundry   | no        | boolean    | `true`  | Deploy the application?                   |
| cloud_control_nodes_apps.google    | no        | boolean    | `true`  | Deploy the application?                   |
| cloud_control_nodes_apps.ibm       | no        | boolean    | `true`  | Deploy the application?                   |
| cloud_control_nodes_apps.terraform | no        | boolean    | `true`  | Deploy the application?                   |

Additional role specific settings are available to further customize the playbook:

| A:Platform64 role                                                                | group_vars file                                                        |
| -------------------------------------------------------------------------------- | ---------------------------------------------------------------------- |
| [serdigital64.cloud.cloud_aws_cli](../roles/cloud_aws_cli.md#role-parameters)    | `inventories/<SITE>/group_vars/cloud_control_nodes/cloud_aws_cli.yml`  |
| [serdigital64.system.sys_repository](../roles/sys_repository.md#role-parameters) | `inventories/<SITE>/group_vars/cloud_control_nodes/sys_repository.yml` |

## Deployment

### OS Compatibility

OS compatibility is role dependant. Please refer to the respective role documentation.

### Dependencies

Dependencies in this section are automatically solved during the installation of A:Platform64.

- Ansible Collections:
  - serdigital64.backup
  - serdigital64.system
  - serdigital64.cloud

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
