---
title: "Ansible Role: serdigital64.hypervisor.hpv_libvirt_server"
description: "Manage provisioning of LibVirt server"
authors:
  - SerDigital64
tags:
  - ansible
  - devops
  - linux
  - automation
---

# Ansible Role: serdigital64.hypervisor.hpv_libvirt_server

## Purpose

Manage provisioning of LibVirt server

Supported features in the current version:

- Prepare environment for application deployment.
- Deploy application. Packages are defined in the variable `hpv_libvirt_server_profiles`.
- Control application subsystem services. Services are defined in the variable `hpv_libvirt_server_subsystem_profile`.
- Configure application.
- Configure application subsystem server.

The **hpv_libvirt_server** Ansible-Role is part of the [A:Platform64](https://github.com/serdigital64/aplatform64) project and is available in the [hypervisor](../collections/hypervisor.md) Ansible-Collection.

## Usage

The following example is an **Ansible Playbook** that includes all the supported features:

[use this link if viewing the doc on github](../../collections/serdigital64/hypervisor/playbooks/hpv_libvirt_server.yml)

```yaml
{% include "../../collections/serdigital64/hypervisor/playbooks/hpv_libvirt_server.yml" %}
```

The playbook can be run by executing:

```shell
# Set ANSIBLE_COLLECTIONS_PATHS to the default install location. Change as needed.
ANSIBLE_COLLECTIONS_PATHS="${HOME}/.ansible/collections"
ansible-playbook "${ANSIBLE_COLLECTIONS_PATHS}/ansible_collections/serdigital64/hypervisor/playbooks/hpv_libvirt_server.yml"
```

## Role Parameters

### Actions

- Use **action-parameters** to control what tasks are enabled for the role to execute.
- Parameters should be declared as task level vars as they are intented to be dynamic.

```yaml
hpv_libvirt_server:
  resolve_prereq:
  prepare:
  deploy:
  setup:
  control:
```

| Parameter                         | Required? | Type    | Default | Purpose / Value                              |
| --------------------------------- | --------- | ------- | ------- | -------------------------------------------- |
| hpv_libvirt_server.resolve_prereq | no        | boolean | `false` | Enable automatic resolution of prequisites   |
| hpv_libvirt_server.prepare        | no        | boolean | `false` | Enable environment preparation               |
| hpv_libvirt_server.deploy         | no        | boolean | `false` | Enable installation of application packages  |
| hpv_libvirt_server.setup          | no        | boolean | `false` | Enable application configuration             |
| hpv_libvirt_server.control        | no        | boolean | `false` | Enable application subsystem service control |

### End State

- Use **end-state** parameters to define the target state after role execution.
- Parameters should be declared in **host_vars** or **group_vars** as they are intended to be permanent.

```yaml
hpv_libvirt_server_application:
  name:
  type:
  version:
  installed:
hpv_libvirt_server_subsystem:
  enabled:
  status:
hpv_libvirt_server_server_options:
  tcp_access:
    enabled:
    port:
    listen:
    cleartext:
  qemu:
    security_driver:
```

| Parameter                                              | Required? | Type       | Default            | Purpose / Value                           |
| ------------------------------------------------------ | --------- | ---------- | ------------------ | ----------------------------------------- |
| hpv_libvirt_server_application                         | no        | dictionary |                    | Set application package end state         |
| hpv_libvirt_server_application.name                    | no        | string     | `"libvirt_server"` | Select application package name           |
| hpv_libvirt_server_application.type                    | no        | string     | `"distro"`         | Select application package type           |
| hpv_libvirt_server_application.version                 | no        | string     | `"latest"`         | Select application package version        |
| hpv_libvirt_server_application.installed               | no        | boolean    | `true`             | Set application package end state         |
| hpv_libvirt_server_subsystem                           | no        | dictionary |                    | Set application subsystem end state       |
| hpv_libvirt_server_subsystem.enabled                   | no        | boolean    | `false`            | Enable the subsystem?                     |
| hpv_libvirt_server_subsystem.status                    | no        | string     | `"stopped"`        | Set the service state                     |
| hpv_libvirt_server_server_options                      | no        | dictionary |                    | Set subsystem server options              |
| hpv_libvirt_server_server_options.tcp_access           | no        | dictionary |                    | Define remote management access           |
| hpv_libvirt_server_server_options.tcp_access.enabled   | no        | boolean    | `false`            | Enable remote access?                     |
| hpv_libvirt_server_server_options.tcp_access.port      | no        | string     | `"16509"`          | Set remote access port                    |
| hpv_libvirt_server_server_options.tcp_access.listen    | no        | string     | `"127.0.0.1"`      | Set listen IPv4 address                   |
| hpv_libvirt_server_server_options.tcp_access.cleartext | no        | boolean    | `false`            | Allow cleartext ?                         |
| hpv_libvirt_server_server_options.qemu                 | no        | dictionary |                    | Configure qemu driver                     |
| hpv_libvirt_server_server_options.qemu.security_driver | no        | boolean    | `false`            | Enable platform specific security driver? |

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
ansible-galaxy collection install --upgrade serdigital64.hypervisor
```

Automatic installation is also available by deploying [A:Platform64](https://aplatform64.readthedocs.io/en/latest/#deployment)

## Contributing

Help on implementing new features and maintaining the code base is welcomed.

Please see the [guidelines](../contributing/guidelines.md) for further details.

## Author

- [SerDigital64](https://serdigital64.github.io/)

## License

[GPL-3.0-or-later](https://www.gnu.org/licenses/gpl-3.0.txt)
