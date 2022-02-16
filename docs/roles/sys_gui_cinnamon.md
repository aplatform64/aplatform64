---
title: "Ansible Role: serdigital64.system.sys_gui_cinnamon"
description: "Manage provisioning of the Cinnamon desktop environment"
authors:
  - SerDigital64
tags:
  - ansible
  - system
  - linux
  - automation
---

# Ansible Role: serdigital64.system.sys_gui_cinnamon

## Purpose

Manage provisioning of the Cinnamon desktop environment

Supported features in the current version:

- Prepare environment for application deployment.
- Deploy application. Packages are defined in the variable `sys_gui_cinnamon_profiles`.
- Provision application components:
  - Create user default configuration. Available sets are defined in the variable `sys_gui_cinnamon_catalog_user`:
    - desktop (theme, panel)
    - nemo
  - Deploy to system-wide DConf as local db

The **sys_gui_cinnamon** Ansible-Role is part of the [A:Platform64](https://github.com/serdigital64/aplatform64) project and is available in the [system](../collections/system.md) Ansible-Collection.

## Usage

The following example is an **Ansible Playbook** that includes all the supported features:

[use this link if viewing the doc on github](../../collections/serdigital64/system/playbooks/sys_gui_cinnamon.yml)

```yaml
{% include "../../collections/serdigital64/system/playbooks/sys_gui_cinnamon.yml" %}
```

The playbook can be run by executing:

```shell
# Set ANSIBLE_COLLECTIONS_PATHS to the default location. Change as needed.
ANSIBLE_COLLECTIONS_PATHS="${HOME}/.ansible/collections"
ansible-playbook "${ANSIBLE_COLLECTIONS_PATHS}/ansible_collections/serdigital64/system/playbooks/sys_gui_cinnamon.yml"
```

## Role Parameters

### Actions

- Use **action-parameters** to control what tasks are enabled for the role to execute.
- Parameters should be declared as task level vars as they are intented to be dynamic.

```yaml
sys_gui_cinnamon:
  resolve_prereq:
  prepare:
  deploy:
  provision:
```

| Parameter                       | Required? | Type    | Default | Purpose / Value                               |
| ------------------------------- | --------- | ------- | ------- | --------------------------------------------- |
| sys_gui_cinnamon.resolve_prereq | no        | boolean | `false` | Enable automatic resolution of prequisites    |
| sys_gui_cinnamon.prepare        | no        | boolean | `false` | Enable environment preparation                |
| sys_gui_cinnamon.deploy         | no        | boolean | `false` | Enable installation of application packages   |
| sys_gui_cinnamon.provision      | no        | boolean | `false` | Enable provisioning of application components |

### End State

- Use **end-state** parameters to define the target state after role execution.
- Parameters should be declared in **host_vars** or **group_vars** as they are intended to be permanent.

```yaml
sys_gui_cinnamon_users:
  desktop:
  nemo:
```

| Parameter                      | Required?      | Type       | Default                     | Purpose / Value             |
| ------------------------------ | -------------- | ---------- | --------------------------- | --------------------------- |
| sys_gui_cinnamon_users         | yes(provision) | dictionary |                             | Define user options         |
| sys_gui_cinnamon_users.desktop | yes            | string     | `"desktop_adapta_nokto_v1"` | Desktop configuration set   |
| sys_gui_cinnamon_users.nemo    | yes            | string     | `"nemo_v1"`                 | Nemo configuration set name |

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
    - sys_dconf

### Prerequisites

The Ansible engine must be already installed and configured for privileged access and remote execution.

In addition the following prerequisites can be automatically solved when running the playbook by setting the role action: `resolve_prereq: true`

- Package manager for the target application is installed and enabled.

### Installation Procedure

Manually install Ansible Collections from the Ansible Galaxy repository:

```shell
ansible-galaxy collection install serdigital64.system
```

Automatic installation is also available by deploying [A:Platform64](https://aplatform64.readthedocs.io/en/latest/#deployment)

## Contributing

Help on implementing new features and maintaining the code base is welcomed.

Please see the [guidelines](../contributing/guidelines.md) for further details.

## Author

- [SerDigital64](https://serdigital64.github.io/)

## License

[GPL-3.0-or-later](https://www.gnu.org/licenses/gpl-3.0.txt)
