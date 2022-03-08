---
title: "Ansible Role: serdigital64.cloud.cloud_aws_realm"
description: "Manage AWS Accounts, IAM and Organizations"
authors:
  - SerDigital64
tags:
  - ansible
  - devops
  - linux
  - automation
---

# Ansible Role: serdigital64.cloud.cloud_aws_realm

## Purpose

Manage AWS Accounts, IAM and Organizations.

The idea is to simplify the setup of small AWS accounts by implementing a predefine structure where regular users can be assigned.

Supported features in the current version:

- Implement predefined structure for:
  - IAM Users
  - IAM Groups
  - IAM Policies
- Create regular IAM users.
- Create automation IAM user.
- Assign regular IAM users to predefined IAM groups.

The structure has the following elements:

- Predefined IAM Users (variable `cloud_aws_realm_structure_managers`)
  - `iam_manager_auto`: dedicated IAM Management user for automation scripts.
  - `cloud_manager_auto`: dedicated CLoud Management user for cloud infrastructure automation scripts.
- Predefined IAM policies (variable `cloud_aws_realm_structure_policies`)
  - `billing_full_access`: Full access to AWS Billing
  - `billing_view_access`: View only access to AWS Billing
- Predefined IAM groups (variable `cloud_aws_realm_structure_groups`)
  - `billing_managers_auto`
  - `billing_managers`
  - `billing_auditors`
  - `iam_managers_auto`
  - `iam_managers`
  - `iam_auditors`
  - `cloud_managers`
  - `cloud_auditors`

The role uses the root AWS Account for the initial setup. After the IAM administrator user is created the root credential can be removed.

The **cloud_aws_realm** Ansible-Role is part of the [A:Platform64](https://github.com/serdigital64/aplatform64) project and is available in the [cloud](https://aplatform64.readthedocs.io/en/latest/collections/cloud) Ansible-Collection.

## Usage

The following example is an **Ansible Playbook** that includes all the supported features:

[use this link if viewing the doc on github](https://github.com/aplatform64/cloud/blob/main/playbooks/cloud_aws_realm.yml)

```yaml
{% include "../examples/cloud_aws_realm.yml" %}
```

The playbook can be run by executing:

```shell
# Set ANSIBLE_COLLECTIONS_PATHS to the default location. Change as needed.
ANSIBLE_COLLECTIONS_PATHS="${HOME}/.ansible/collections"
ansible-playbook "${ANSIBLE_COLLECTIONS_PATHS}/ansible_collections/serdigital64/cloud/playbooks/cloud_aws_realm.yml"
```

## Role Parameters

### Actions

- Use **action-parameters** to control what tasks are enabled for the role to execute.
- Parameters should be declared as task level vars as they are intented to be dynamic.

```yaml
cloud_aws_realm:
  provision:
```

| Parameter                 | Required? | Type    | Default | Purpose / Value           |
| ------------------------- | --------- | ------- | ------- | ------------------------- |
| cloud_aws_realm.provision | no        | boolean | `false` | Enable realm provisioning |

### End State

- Use **end-state** parameters to define the target state after role execution.
- Parameters should be declared in **host_vars** or **group_vars** as they are intended to be permanent.

```yaml
cloud_aws_realm_users:
  - name:
cloud_aws_realm_groups:
  - name:
    users:
cloud_aws_realm_account:
  id:
  name:
cloud_aws_realm_api:
  root:
    key:
    secret:
  iam_manager_auto:
    key:
    secret:
  cloud_manager_auto:
    key:
    secret:
```

| Parameter                                      | Required?      | Type       | Default        | Purpose / Value                            |
| ---------------------------------------------- | -------------- | ---------- | -------------- | ------------------------------------------ |
| cloud_aws_realm_users                          | No             | list       |                | Define regular IAM users                   |
| cloud_aws_realm_users.name                     | No             | string     |                | User name                                  |
| cloud_aws_realm_groups                         | No             | list       |                | Assign IAM users to predefined groups      |
| cloud_aws_realm_groups.name                    | No             | string     |                | Predefined group name                      |
| cloud_aws_realm_groups.users                   | No             | list       |                | List of users to be added to the group     |
| cloud_aws_realm_groups.users.0                 | No             | string     |                | Regular IAM user name                      |
| cloud_aws_realm_account                        | Yes(Provision) | dictionary |                | Define AWS account details                 |
| cloud_aws_realm_account.id                     | Yes(Provision) | string     | `**changeme**` | Account ID                                 |
| cloud_aws_realm_account.name                   | Yes(Provision) | string     | `**changeme**` | Account login name                         |
| cloud_aws_realm_api                            | Yes(Provision) | dictionary |                | Define AWS remote access credentials       |
| cloud_aws_realm_api.root                       | No             | dictionary |                | Initial setup credential                   |
| cloud_aws_realm_api.root.key                   | No             | string     | `**changeme**` | API Key                                    |
| cloud_aws_realm_api.root.secret                | No             | string     | `**changeme**` | API Secret                                 |
| cloud_aws_realm_api.iam_manager_auto           | Yes(Provision) | dictionary |                | Permament credentials for IAM management   |
| cloud_aws_realm_api.iam_manager_auto.key       | Yes(Provision) | string     | `**changeme**` | API Key                                    |
| cloud_aws_realm_api.iam_manager_auto.secret    | Yes(Provision) | string     | `**changeme**` | API Secret                                 |
| cloud_aws_realm_api.cloud_manager_auto         | Yes(Provision) | dictionary |                | Permament credentials for Cloud management |
| cloud_aws_realm_api.cloud_manager_autoo.key    | Yes(Provision) | string     | `**changeme**` | API Key                                    |
| cloud_aws_realm_api.cloud_manager_autoo.secret | Yes(Provision) | string     | `**changeme**` | API Secret                                 |

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

- Ansible Collections:
  - community.aws

### Prerequisites

- Python modules (required by community.aws)
  - boto
  - boto3
  - botocore
  - s3transfer
  - jmespath

### Installation Procedure

The role can be provisioned by installing the Ansible-Collection from the Ansible Galaxy repository: [https://galaxy.ansible.com/serdigital64/cloud](https://galaxy.ansible.com/serdigital64/cloud)

```shell
ansible-galaxy collection install --upgrade serdigital64.cloud
```

Automatic installation is also available by deploying [A:Platform64](https://aplatform64.readthedocs.io/en/latest/#deployment)

## Contributing

Help on implementing new features and maintaining the code base is welcomed.

Please see the [guidelines](https://aplatform64.readthedocs.io/en/latest/contributing/CONTRIBUTING) for further details.

## Author

- [SerDigital64](https://serdigital64.github.io/)

## License

[GPL-3.0-or-later](https://www.gnu.org/licenses/gpl-3.0.txt)
