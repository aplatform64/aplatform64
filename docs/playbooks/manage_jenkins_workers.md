# Ansible Playbook: manage_jenkins_workers

## Purpose

Manage Jenkins workers.

Supported features in the current version:

- Deploy prerequisites:
  - OpenJDK 11
- Create dedicated remote access account for SSH agent

## Use Cases

### Deploy Jenkins worker node

- Verify that target nodes are registered in the inventory file: [jenkins_service.ini](#inventory)
- Verify that target endstate is set: [manage_jenkins_workers.yml](#end-state)
- Run the playbook. Use the `-s <SITE>` parameter to select the target site.

```shell
/opt/aplatform64/bin/ap64.sh -n -p manage_jenkins_workers -s <SITE>
```

## Playbook Parameters

### Inventory

Register the hosts that will consume the service in the Ansible Inventory file:

- File: `inventories/<SITE>/jenkins_service.ini`
- Host Group: `jenkins_workers`

### End State

A dedicated group_vars directory is used to store end-state configuration settings for both the playbook and related Ansible Roles.

Set playbook specific settings in the file: `inventories/<SITE>/group_vars/jenkins_workers/manage_jenkins_workers.yml`

```yaml
manage_jenkins_workers_apps:
  jenkins:
```

| Parameter                           | Required? | Type       | Default | Purpose / Value                           |
| ----------------------------------- | --------- | ---------- | ------- | ----------------------------------------- |
| manage_jenkins_workers_apps         | no        | dictionary |         | Define what applications will be deployed |
| manage_jenkins_workers_apps.jenkins | no        | boolean    | `true`  | Deploy the application?                   |

Additional role specific settings are available to further customize the playbook:

| A:Platform64 role                                                                | group_vars file                                                        |
| -------------------------------------------------------------------------------- | ---------------------------------------------------------------------- |
| [serdigital64.system.sys_repository](../roles/sys_repository.md#role-parameters) | `inventories/<SITE>/group_vars/jenkins_controllers/sys_repository.yml` |
| [serdigital64.system.sys_user](../roles/sys_user.md#role-parameters)             | `inventories/<SITE>/group_vars/jenkins_controllers/sys_user.yml`       |
| [serdigital64.development.dev_java](../roles/dev_java.md#role-parameters)        | `inventories/<SITE>/group_vars/jenkins_controllers/dev_java.yml`       |

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
  - serdigital64.development

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
