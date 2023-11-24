# Ansible Playbook: manage_office_nodes

## Purpose

Provision office productivity applications.

Supported features in the current version:

- Configure operating system for using the FlatHub package repository
- Install office productivity applications:
  - Google Chrome
  - Darktable
  - DrawIO
  - GIMP
  - InkScape
  - KeePassXC
  - Kryta
  - LibreOffice
  - MS Teams
  - OBS
  - ShotCut
  - Skype
  - Spotify
  - Zoom
- Deploy user configuration for:
  - KeePassXC

## Use Cases

### Deploy office productivity applications

- Verify that target nodes are registered in the inventory file: [office_nodes.ini](#inventory)
- Verify that target apps are selected in the playbook endstate file: [manage_office_nodes.yml](#end-state)
- Run the playbook. Use the `-s <SITE>` parameter to select the target site.

```shell
/opt/aplatform64/bin/ap64.sh -n -p manage_office_nodes -s <SITE>
```

## Playbook Parameters

### Inventory

Register the hosts that will consume the service in the Ansible Inventory file:

- File: `inventories/<SITE>/office_nodes.ini`
- Host Group: `office_nodes`

### End State

A dedicated group_vars directory is used to store end-state configuration settings for both the playbook and related Ansible Roles.

Set playbook specific settings in the file: `inventories/<SITE>/group_vars/office_nodes/manage_office_nodes.yml`

```yaml
office_nodes_apps:
  chrome:
  darktable:
  drawio:
  gimp:
  inkscape:
  keepassxc:
  kryta:
  libreoffice:
  msteams:
  obs:
  shotcut:
  skype:
  spotify:
  zoom:
```

| Parameter                     | Required? | Type       | Default | Purpose / Value                           |
| ----------------------------- | --------- | ---------- | ------- | ----------------------------------------- |
| office_nodes_apps             | yes       | dictionary |         | Define what applications will be deployed |
| office_nodes_apps.chrome      | no        | boolean    | `false` | Deploy the application?                   |
| office_nodes_apps.darktable   | no        | boolean    | `false` | Deploy the application?                   |
| office_nodes_apps.drawio      | no        | boolean    | `false` | Deploy the application?                   |
| office_nodes_apps.gimp        | no        | boolean    | `false` | Deploy the application?                   |
| office_nodes_apps.inkscape    | no        | boolean    | `false` | Deploy the application?                   |
| office_nodes_apps.keepassxc   | no        | boolean    | `false` | Deploy the application?                   |
| office_nodes_apps.kryta       | no        | boolean    | `false` | Deploy the application?                   |
| office_nodes_apps.libreoffice | no        | boolean    | `false` | Deploy the application?                   |
| office_nodes_apps.msteams     | no        | boolean    | `false` | Deploy the application?                   |
| office_nodes_apps.obs         | no        | boolean    | `false` | Deploy the application?                   |
| office_nodes_apps.shotcut     | no        | boolean    | `false` | Deploy the application?                   |
| office_nodes_apps.skype       | no        | boolean    | `false` | Deploy the application?                   |
| office_nodes_apps.spotify     | no        | boolean    | `false` | Deploy the application?                   |
| office_nodes_apps.zoom        | no        | boolean    | `false` | Deploy the application?                   |

Additional role specific settings are available to further customize the playbook:

| A:Platform64 role                                                                   | group_vars file                                                 |
| ----------------------------------------------------------------------------------- | --------------------------------------------------------------- |
| [serdigital64.application.app_keepassxc](../roles/app_keepassxc.md#role-parameters) | `inventories/<SITE>/group_vars/office_nodes/app_keepassxc.yml`  |
| [serdigital64.system.sys_repository](../roles/sys_repository.md#role-parameters)    | `inventories/<SITE>/group_vars/office_nodes/sys_repository.yml` |

## Deployment

### OS Compatibility

OS compatibility is role dependant. Please refer to the respective role documentation.

### Dependencies

Dependencies in this section are automatically solved during the installation of A:Platform64.

- Ansible Collections:
  - serdigital64.backup
  - serdigital64.system
  - serdigital64.application

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

- [SerDigital64](https://serdigital64.github.io/)

## License

[GPL-3.0-or-later](https://www.gnu.org/licenses/gpl-3.0.txt)
