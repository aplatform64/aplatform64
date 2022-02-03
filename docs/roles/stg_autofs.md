---
title: "Ansible Role: serdigital64.storage.stg_autofs"
description: "Manage the AutoFS service"
authors:
  - SerDigital64
tags:
  - ansible
  - storage
  - linux
  - automation
---

# Ansible Role: serdigital64.storage.stg_autofs

## Purpose

Manage the AutoFS service

Supported features in the current version:

- Prepare environment for application deployment:
  - Create shared root path for mount points
- Deploy service. Packages are defined in the variable `stg_autofs_profiles`.
- Control service subsystem services. Services are defined in the variable `stg_autofs_subsystems`.
- Configure service subsystem server.
- Provision service components.
  - Add autofs maps

The **stg_autofs** Ansible-Role is part of the [A:Platform64](https://github.com/serdigital64/aplatform64) project and is available in the [storage](../collections/storage.md) Ansible-Collection.

## Usage

The following example is an **Ansible Playbook** that includes all the supported features:

[use this link if viewing the doc on github](../../collections/serdigital64/storage/playbooks/stg_autofs.yml)

```yaml
{% include "../../collections/serdigital64/storage/playbooks/stg_autofs.yml" %}
```

The playbook can be run by executing:

```shell
# Set ANSIBLE_COLLECTIONS_PATHS to the default location. Change as needed.
ANSIBLE_COLLECTIONS_PATHS="${HOME}/.ansible/collections"
ansible-playbook "${ANSIBLE_COLLECTIONS_PATHS}/ansible_collections/serdigital64/storage/playbooks/stg_autofs.yml"
```

## Role Parameters

### Actions

- Use **action-parameters** to control what tasks are enabled for the role to execute.
- Parameters should be declared as task level vars as they are intented to be dynamic.

```yaml
stg_autofs:
  resolve_prereq:
  prepare:
  deploy:
  setup:
  control:
  provision:
```

| Parameter                 | Required? | Type    | Default | Purpose / Value                            |
| ------------------------- | --------- | ------- | ------- | ------------------------------------------ |
| stg_autofs.resolve_prereq | no        | boolean | `false` | Enable automatic resolution of prequisites |
| stg_autofs.prepare        | no        | boolean | `false` | Enable environment preparation             |
| stg_autofs.deploy         | no        | boolean | `false` | Enable installation of service packages    |
| stg_autofs.setup          | no        | boolean | `false` | Enable service configuration               |
| stg_autofs.control        | no        | boolean | `false` | Enable service subsystem service control   |
| stg_autofs.provision      | no        | boolean | `false` | Enable provisioning of service components  |

### End State

- Use **end-state** parameters to define the target state after role execution.
- Parameters should be declared in **host_vars** or **group_vars** as they are intended to be permanent.

```yaml
stg_autofs_service:
  name:
  type:
  version:
  installed:
stg_autofs_subsystem:
  enabled:
  status:
stg_autofs_server_options:
  root:
  timeout:
  logging:
stg_autofs_maps:
  - name:
    mount:
    shares:
      - source:
        target:
        options:
```

| Parameter                          | Required?      | Type       | Default     | Purpose / Value                                                                   |
| ---------------------------------- | -------------- | ---------- | ----------- | --------------------------------------------------------------------------------- |
| stg_autofs_service                 | yes(deploy)    | dictionary |             | Set service package end state                                                     |
| stg_autofs_service.name            | yes(deploy)    | string     | `"autofs"`  | Select service package name                                                       |
| stg_autofs_service.type            | yes(deploy)    | string     | `"distro"`  | Select service package type                                                       |
| stg_autofs_service.version         | yes(deploy)    | string     | `"latest"`  | Select service package version                                                    |
| stg_autofs_service.installed       | yes(deploy)    | boolean    | `true`      | Set service package end state                                                     |
| stg_autofs_subsystem               | yes(control)   | dictionary |             | Set service subsystem end state                                                   |
| stg_autofs_subsystem.enabled       | yes(control)   | boolean    | `false`     | Enable the subsystem?                                                             |
| stg_autofs_subsystem.status        | yes(control)   | string     | `"stopped"` | Set the service state                                                             |
| stg_autofs_server_options          | no             | dictionary |             | Set subsystem server options                                                      |
| stg_autofs_server_options.root     | no             | string     | `"/autofs"` | Base paths where map mount points will be created                                 |
| stg_autofs_server_options.logging  | no             | string     | `"none"`    | Logging level. Valid values defined in the variable `stg_autofs_logging`          |
| stg_autofs_server_options.timeout  | no             | string     | `"100"`     | Set autofs.timeout                                                                |
| stg_autofs_maps                    | yes(provision) | list       |             | Provision autofs maps                                                             |
| stg_autofs_maps.0.name             | yes(provision) | string     |             | Map name                                                                          |
| stg_autofs_maps.0.mount            | yes(provision) | string     |             | Directory where shares will be created. Relative tostg_autofs_server_options.root |
| stg_autofs_maps.0.shares           | yes(provision) | list       |             | List of shares to be added to the map                                             |
| stg_autofs_maps.0.shares.0.source  | yes(provision) | string     |             | Source share to mount                                                             |
| stg_autofs_maps.0.shares.0.target  | yes(provision) | string     |             | Target directory to monitor                                                       |
| stg_autofs_maps.0.shares.0.options | yes(provision) | string     |             | Share specific mount options                                                      |

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

- Package manager for the target service is installed and enabled.

### Installation Procedure

Manually install Ansible Collections from the Ansible Galaxy repository:

```shell
ansible-galaxy collection install serdigital64.storage
```

Automatic installation is also available by deploying [A:Platform64](https://aplatform64.readthedocs.io/en/latest/#deployment)

## Contributing

Help on implementing new features and maintaining the code base is welcomed.

Please see the [guidelines](../contributing/guidelines.md) for further details.

## Author

- [SerDigital64](https://serdigital64.github.io/)

## License

[GPL-3.0-or-later](https://www.gnu.org/licenses/gpl-3.0.txt)
