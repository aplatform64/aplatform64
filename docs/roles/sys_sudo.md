---
title: "Ansible Role: serdigital64.system.sys_sudo"
description: "Manage provisioning of the SuDo tool"
authors:
  - SerDigital64
tags:
  - ansible
  - devops
  - linux
  - automation
---

# Ansible Role: serdigital64.system.sys_sudo

## Purpose

Manage provisioning of the SuDo tool.

Supported features in the current version:

- Deploy application. Packages are defined in the variable `sys_sudo_profiles`.
- Configure system wide sudoers
  - Add/Remove user rules

The **sys_sudo** Ansible-Role is part of the [A:Platform64](https://github.com/serdigital64/aplatform64) project and is available in the [system](../collections/system.md) Ansible-Collection.

## Usage

The following example is an **Ansible Playbook** that includes all the supported features:

```yaml
{% include "../../collections/serdigital64/system/playbooks/sys_sudo.yml" %}
```

The playbook can be run by executing:

```shell
# Set ANSIBLE_COLLECTIONS_PATHS to the default install location. Change as needed.
ANSIBLE_COLLECTIONS_PATHS="${HOME}/.ansible/collections"
ansible-playbook "${ANSIBLE_COLLECTIONS_PATHS}/ansible_collections/serdigital64/system/playbooks/sys_sudo.yml"
```

## Role Parameters

### Actions

- Use **action-parameters** to control what tasks are enabled for the role to execute.
- Parameters should be declared as task level vars as they are intented to be dynamic.

```yaml
sys_sudo:
  resolve_prereq:
  deploy:
sys_sudo_rules:
  user:
    - name:
      rule:
      present:
```

| Parameter                     | Required? | Type    | Default | Purpose / Value                                                     |
| ----------------------------- | --------- | ------- | ------- | ------------------------------------------------------------------- |
| sys_sudo.resolve_prereq       | no        | boolean | `false` | Enable automatic resolution of prequisites                          |
| sys_sudo.deploy               | no        | boolean | `false` | Enable installation of application packages                         |
| sys_sudo_rules                | yes       | list    |         | Required when `setup == true`. Define what sudoers rules to process |
| sys_sudo_rules.user           | yes       | list    |         | Define user rules                                                   |
| sys_sudo_rules.user.0.name    | yes       | string  |         | Define user name                                                    |
| sys_sudo_rules.user.0.rule    | yes       | string  |         | Define sudoers rule                                                 |
| sys_sudo_rules.user.0.present | no        | boolean | `true`  | Set the rule end state                                              |

### End State

- Use **end-state** parameters to define the target state after role execution.
- Parameters should be declared in **host_vars** or **group_vars** as they are intended to be permanent.

```yaml
sys_sudo_application:
  name:
  type:
  version:
  installed:
```

| Parameter                      | Required? | Type       | Default    | Purpose / Value                    |
| ------------------------------ | --------- | ---------- | ---------- | ---------------------------------- |
| sys_sudo_application           | no        | dictionary |            | Set application package end state  |
| sys_sudo_application.name      | no        | string     | `"sudo"`   | Select application package name    |
| sys_sudo_application.type      | no        | string     | `"distro"` | Select application package type    |
| sys_sudo_application.version   | no        | string     | `"latest"` | Select application package version |
| sys_sudo_application.installed | no        | boolean    | `true`     | Set application package end state  |

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

### Installation Procedure

Manually install Ansible Collections from the Ansible Galaxy repository:

```shell
ansible-galaxy collection install --upgrade serdigital64.system
```

Automatic installation is also available by deploying [A:Platform64](https://aplatform64.readthedocs.io/en/latest/#deployment)

## Contributing

Help on implementing new features and maintaining the code base is welcomed.

Please see the [guidelines](../contributing/guidelines.md) for further details.

## Author

- [SerDigital64](https://serdigital64.github.io/)

## License

[GPL-3.0-or-later](https://www.gnu.org/licenses/gpl-3.0.txt)
