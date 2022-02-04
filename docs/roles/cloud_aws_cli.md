---
title: "Ansible Role: serdigital64.cloud.cloud_aws_cli"
description: "Manage provisioning of AWS CLI"
authors:
  - SerDigital64
tags:
  - ansible
  - devops
  - linux
  - automation
---

# Ansible Role: serdigital64.cloud.cloud_aws_cli

## Purpose

Manage provisioning of AWS CLI

Supported features in the current version:

- Resolve prerequisites:
  - Install OS tools
- Deploy application. Packages are defined in the variable `cloud_aws_cli_profiles`.
- Create directory structure for configuration files

The **cloud_aws_cli** Ansible-Role is part of the [A:Platform64](https://github.com/serdigital64/aplatform64) project and is available in the [cloud](../collections/cloud.md) Ansible-Collection.

## Usage

The following example is an **Ansible Playbook** that includes all the supported features:

[use this link if viewing the doc on github](../../collections/serdigital64/cloud/playbooks/cloud_aws_cli.yml)

```yaml
{% include "../../collections/serdigital64/cloud/playbooks/cloud_aws_cli.yml" %}
```

The playbook can be run by executing:

```shell
# Set ANSIBLE_COLLECTIONS_PATHS to the default location. Change as needed.
ANSIBLE_COLLECTIONS_PATHS="${HOME}/.ansible/collections"
ansible-playbook "${ANSIBLE_COLLECTIONS_PATHS}/ansible_collections/serdigital64/cloud/playbooks/cloud_aws_cli.yml"
```

## Role Parameters

### Actions

- Use **action-parameters** to control what tasks are enabled for the role to execute.
- Parameters should be declared as task level vars as they are intented to be dynamic.

```yaml
cloud_aws_cli:
  resolve_prereq:
  prepare:
  deploy:
```

| Parameter                    | Required? | Type    | Default | Purpose / Value                             |
| ---------------------------- | --------- | ------- | ------- | ------------------------------------------- |
| cloud_aws_cli.resolve_prereq | no        | boolean | `false` | Enable automatic resolution of prequisites  |
| cloud_aws_cli.prepare        | no        | boolean | `false` | Enable environment preparation              |
| cloud_aws_cli.deploy         | no        | boolean | `false` | Enable installation of application packages |

### End State

- Use **end-state** parameters to define the target state after role execution.
- Parameters should be declared in **host_vars** or **group_vars** as they are intended to be permanent.

```yaml
cloud_aws_cli_application:
  name:
  type:
  version:
  installed:
cloud_aws_cli_paths:
  etc:
cloud_aws_cli_users:
  cloudadm:
    name:
    group:
    home:
```

| Parameter                           | Required?   | Type       | Default    | Purpose / Value                    |
| ----------------------------------- | ----------- | ---------- | ---------- | ---------------------------------- |
| cloud_aws_cli_application           | yes(deploy) | dictionary |            | Set application package end state  |
| cloud_aws_cli_application.name      | yes(deploy) | string     | `"awscli"` | Select application package name    |
| cloud_aws_cli_application.type      | yes(deploy) | string     | `"binary"` | Select application package type    |
| cloud_aws_cli_application.version   | yes(deploy) | string     | `"latest"` | Select application package version |
| cloud_aws_cli_application.installed | yes(deploy) | boolean    | `true`     | Set application package end state  |
| cloud_aws_cli_paths                 | no          | dictionary |            | Set paths                          |
| cloud_aws_cli_paths.etc             | no          | string     |            | Set configuration repository       |
| cloud_aws_cli_users                 | no          | dictionary |            | Define users                       |
| cloud_aws_cli_users.cloudadm        | no          | dictionary |            | Define configuration owner         |
| cloud_aws_cli_users.cloudadm.name   | no          | string     |            | Set login name                     |
| cloud_aws_cli_users.cloudadm.group  | no          | string     |            | Set group name                     |
| cloud_aws_cli_users.cloudadm.home   | no          | string     |            | Set home directory                 |

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
  - serdigital64.backup
    - bkp_archive
  - serdigital64.system
    - sys_package
    - sys_repository

### Prerequisites

The Ansible engine must be already installed and configured for privileged access and remote execution.

In addition the following prerequisites can be automatically solved when running the playbook by setting the role action: `resolve_prereq: true`

- Package manager for the target application is installed and enabled.
- OS tools:
  - groff
  - less

### Installation Procedure

Manually install Ansible Collections from the Ansible Galaxy repository:

```shell
ansible-galaxy collection install --upgrade serdigital64.cloud
```

Automatic installation is also available by deploying [A:Platform64](https://aplatform64.readthedocs.io/en/latest/#deployment)

## Contributing

Help on implementing new features and maintaining the code base is welcomed.

Please see the [guidelines](../contributing/guidelines.md) for further details.

## Author

- [SerDigital64](https://serdigital64.github.io/)

## License

[GPL-3.0-or-later](https://www.gnu.org/licenses/gpl-3.0.txt)
