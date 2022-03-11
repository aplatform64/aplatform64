# Ansible Playbook: manage_cloud_realm

## Purpose

Manage cloud provider accounts, users, and organizations as a single entity.

The purpose is to simplify the setup of small public provider sites by defining a management structure following public provider best practicies.

Supported cloud providers:

- Amazon AWS: implemented by the role [serdigital64.cloud.cloud_aws_realm](../roles/cloud_aws_realm.md)

## Use Cases

### Implement realm structure in AWS account

- Generate in `AWS IAM` the API secret and key for the `root` AWS Account.
- Update the API credentials for the root account in the end-state file [cloud_aws_realm.yml](#end-state)

```yaml
cloud_aws_realm_api:
  root:
    key: "**root account key**"
    secret: "**root account secret**"
```

- Run the playbook. Use the `-s <SITE>` parameter to select the target site.
  > `/opt/aplatform64/bin/ap64.sh -n -p manage_cloud_realm -s <SITE>`
- Verify that the new users and groups were created.
- Generate in `AWS IAM` the API secret and key for the IAM user `iam_manager_auto`.
- Update credentias in the end-state file [cloud_aws_realm.yml](#end-state)
  - Remove `root` credentials
  - Add `iam_manager_auto` credentials

```yaml
cloud_aws_realm_api:
  iam_manager_auto:
    key: "**iam_manager_auto user key**"
    secret: "**iam_manager_auto user secret**"
```

## Playbook Parameters

### Inventory

The playbook is run locally in the Ansible Control node and uses AWS API calls to execute remote tasks. Do not modify the inventory definition.

- File: `inventories/<SITE>/cloud_realm.ini`
- Host Group: `cloud_realm`

### End State

A dedicated group_vars directory is used to store end-state configuration settings for both the playbook and related Ansible Roles.

Set playbook specific settings in the file: `inventories/<SITE>/group_vars/cloud_realm/manage_cloud_realm.yml`

```yaml
cloud_realm_provider:
  aws:
```

| Parameter                | Required? | Type       | Default | Purpose / Value                                   |
| ------------------------ | --------- | ---------- | ------- | ------------------------------------------------- |
| cloud_realm_provider     | no        | dictionary |         | Define what public cloud provides will be managed |
| cloud_realm_provider.aws | no        | boolean    | `true`  | Enable AWS support                                |

Additional role specific settings are available to further customize the playbook:

| A:Platform64 role                                                                 | group_vars file                                                 |
| --------------------------------------------------------------------------------- | --------------------------------------------------------------- |
| [serdigital64.cloud.cloud_aws_realm](../roles/cloud_aws_realm.md#role-parameters) | `inventories/<SITE>/group_vars/cloud_realm/cloud_aws_realm.yml` |

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
  - serdigital64.cloud

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
