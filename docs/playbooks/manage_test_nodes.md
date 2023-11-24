# Ansible Playbook: manage_test_nodes

## Purpose

Provision software testing tools.

Supported features in the current version:

- Deploy testing tools:
  - Bats Core
  - Molecule
- Deploy code linting tools:
  - YAMLLint
  - AnsibleLint
  - ShellCheck

## Use Cases

### Deploy unit testing tools

- Verify that target nodes are registered in the inventory file: [test_nodes.ini](#inventory)
- Verify that target tools are selected in the playbook endstate file: [manage_test_nodes.yml](#end-state)
- Run the playbook. Use the `-s <SITE>` parameter to select the target site.

```shell
/opt/aplatform64/bin/ap64.sh -n -p manage_test_nodes -s <SITE>
```

## Playbook Parameters

### Inventory

Register the hosts that will consume the service in the Ansible Inventory file:

- File: `inventories/<SITE>/test_nodes.ini`
- Host Group: `test_nodes`

### End State

A dedicated group_vars directory is used to store end-state configuration settings for both the playbook and related Ansible Roles.

Set playbook specific settings in the file: `inventories/<SITE>/group_vars/test_nodes/manage_test_nodes.yml`

```yaml
manage_test_nodes_apps:
  ansiblelint:
  batscore:
  molecule:
  shellcheck:
  yamllint:
```

| Parameter                          | Required? | Type       | Default | Purpose / Value                           |
| ---------------------------------- | --------- | ---------- | ------- | ----------------------------------------- |
| manage_test_nodes_apps             | no        | dictionary |         | Define what applications will be deployed |
| manage_test_nodes_apps.ansiblelint | no        | boolean    | `false` | Deploy the application?                   |
| manage_test_nodes_apps.batscore    | no        | boolean    | `true`  | Deploy the application?                   |
| manage_test_nodes_apps.molecule    | no        | boolean    | `false` | Deploy the application?                   |
| manage_test_nodes_apps.shellcheck  | no        | boolean    | `true`  | Deploy the application?                   |
| manage_test_nodes_apps.yamllint    | no        | boolean    | `true`  | Deploy the application?                   |

Additional role specific settings are available to further customize the playbook:

| A:Platform64 role                                                                | group_vars file                                               |
| -------------------------------------------------------------------------------- | ------------------------------------------------------------- |
| [serdigital64.system.sys_repository](../roles/sys_repository.md#role-parameters) | `inventories/<SITE>/group_vars/test_nodes/sys_repository.yml` |

## Deployment

### OS Compatibility

OS compatibility is role dependant. Please refer to the respective role documentation.

### Dependencies

Dependencies in this section are automatically solved during the installation process.

- Ansible Collections:
  - serdigital64.backup
  - serdigital64.system
  - serdigital64.devops

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
