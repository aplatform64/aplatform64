# Ansible Playbook: manage_ansible_control_nodes

## Purpose

Manage Ansible Control node.

Supported features in the current version:

- Update A:Platform64 structure after collection upgrade
- Create new A:Platform64 sites

## Use Cases

The playbook must be run using the [A:Platform64 CLI](https://aplatform64.readthedocs.io/en/latest/bin/ap64/):

- Create a A:Platform64 site
  > `/opt/aplatform64/bin/ap64.sh -c -s <SITE>`
- Refresh A:Platform64 site configuration by rerunning the setup process
  > `/opt/aplatform64/bin/ap64.sh -r -s <SITE>`

## Playbook Parameters

### Inventory

Register the hosts that will consume the service in the Ansible Inventory file:

- File: `inventories/<SITE>/ansible_service.ini`
- Host Group: `ansible_control_nodes`

### End State

A dedicated group_vars directory is used to store end-state configuration settings for both the playbook and related Ansible Roles.

Role specific settings are available to further customize the playbook:

| A:Platform64 role                                                                                | group_vars file                                                                |
| ------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------ |
| [serdigital64.automation.auto_ansible_control](../roles/auto_ansible_control.md#role-parameters) | `inventories/<SITE>/group_vars/ansible_control_nodes/auto_ansible_control.yml` |

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

Dependencies in this section are automatically solved during the installation of A:Platform64.

- Ansible Collections:
  - serdigital64.backup
  - serdigital64.system
  - serdigital64.automation

### Prerequisites

- Ansible:
  - Control Node: A:Platform64 installed and configured

### Installation Procedure

The playbook is automatically deployed during the [A:Platform64 installation](/#installation) process.

## Contributing

Help on implementing new features and maintaining the code base is welcomed.

Please see the [guidelines](https://aplatform64.readthedocs.io/en/latest/contributing/CONTRIBUTING) for further details.

## Author

- [SerDigital64](https://serdigital64.github.io/)

## License

[GPL-3.0-or-later](https://www.gnu.org/licenses/gpl-3.0.txt)
