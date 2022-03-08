---
title: "Ansible Role: serdigital64.system.sys_repository"
description: "Manage application package repositories"
authors:
  - SerDigital64
tags:
  - ansible
  - devops
  - linux
  - automation
---

# Ansible Role: serdigital64.system.sys_repository

## Purpose

Manage application package repositories.

Features available in the current version:

- Install repository management tools. Package list is defined in the variable `sys_repository_packages`.
- Add remote repositories.
- Manage availability of installed repositories. Predefined optional repositories are declared in the variable `sys_repository_sources`.

Supported repositories types as defined in the variable `sys_repository_flavours`:

| Type    | Description                                                              |
| ------- | ------------------------------------------------------------------------ |
| distro  | Linux native package manager. Depending on the distro, can be yum or apt |
| yum     | Redhat based package manager. Used for optional repositories.            |
| apt     | Debian based package manager. Used for optional repositories.            |
| snap    | [SnapCraft](https://snapcraft.io/) package manager                       |
| flatpak | [FlatHub](https://flathub.org) package manager                           |
| git     | Git based repository                                                     |
| pip     | Repository for Python modules                                            |

The **sys_repository** Ansible-Role is part of the [A:Platform64](https://github.com/serdigital64/aplatform64) project and is available in the [system](https://aplatform64.readthedocs.io/en/latest/collections/system) Ansible-Collection.

## Usage

The following example is an **Ansible Playbook** that includes all the supported features:

[use this link if viewing the doc on github](https://github.com/aplatform64/system/blob/main/playbooks/sys_repository.yml)

```yaml
{% include "../../collections/serdigital64/system/playbooks/sys_repository.yml" %}
```

The playbook can be run by executing:

```shell
# Set ANSIBLE_COLLECTIONS_PATHS to the default location. Change as needed.
ANSIBLE_COLLECTIONS_PATHS="${HOME}/.ansible/collections"
ansible-playbook "${ANSIBLE_COLLECTIONS_PATHS}/ansible_collections/serdigital64/system/playbooks/sys_repository.yml"
```

## Role Parameters

### Actions

- Use **action-parameters** to control what tasks are enabled for the role to execute.
- Parameters should be declared as task level vars as they are intented to be dynamic.

```yaml
sys_repository:
  prepare:
  deploy:
  setup:
  provision:
```

| Parameter                | Required? | Type    | Default | Purpose / Value                                                |
| ------------------------ | --------- | ------- | ------- | -------------------------------------------------------------- |
| sys_repository.prepare   | no        | boolean | `false` | Enable preparation of the runtime environment                  |
| sys_repository.deploy    | no        | boolean | `false` | Enable installation of application packages used by the role   |
| sys_repository.setup     | no        | boolean | `false` | Enable repository availability control. YUM based distros only |
| sys_repository.provision | no        | boolean | `false` | Enable installation of new repositories                        |

### End State

- Use **end-state** parameters to define the target state after role execution.
- Parameters should be declared in **host_vars** or **group_vars** as they are intended to be permanent.

```yaml
sys_repository_managers:
  flatpak:
  snap:
  git:
  pip:
sys_repository_catalog_distro:
  NAME:
sys_repository_catalog_flatpak:
  NAME:
sys_repository_catalog_apt:
  NAME:
sys_repository_catalog_yum:
  NAME:
sys_repository_custom_distro:
  - name:
    package:
sys_repository_custom_flatpak:
  - name:
    url:
sys_repository_custom_yum:
  - name:
    description:
    url:
    gpgkey:
    sslcacert:
sys_repository_custom_apt:
  - name:
    suite:
    component:
    url:
    gpgkey:
    pgpkey:
```

| Parameter                               | Required? | Type       | Default | Purpose / Value                                                   |
| --------------------------------------- | --------- | ---------- | ------- | ----------------------------------------------------------------- |
| sys_repository_managers.flatpak         | no        | boolean    | `false` | Enable/Disable support for FlatHub repositories                   |
| sys_repository_managers.snap            | no        | boolean    | `false` | Enable/Disable support for Snap repositories                      |
| sys_repository_managers.git             | no        | boolean    | `false` | Enable/Disable support for packages stored in GIT repositories    |
| sys_repository_managers.pip             | no        | boolean    | `false` | Enable/Disable support for packages stored in Python repositories |
| sys_repository_catalog_distro           | no        | dictionary |         | Define installed distro native repositories state.                |
| sys_repository_catalog_distro.NAME      | no        | boolean    |         | Is the repository enabled?. Replace NAME with the repository name |
| sys_repository_catalog_flatpak          | no        | dictionary |         | Define installed flatpak repositories state.                      |
| sys_repository_catalog_flatpak.NAME     | no        | boolean    |         | Is the repository enabled?. Replace NAME with the repository name |
| sys_repository_catalog_apt              | no        | dictionary |         | Define installed apt repositories state.                          |
| sys_repository_catalog_apt.NAME         | no        | boolean    |         | Is the repository enabled?. Replace NAME with the repository name |
| sys_repository_catalog_yum              | no        | dictionary |         | Define installed yum repositories state.                          |
| sys_repository_catalog_yum.NAME         | no        | boolean    |         | Is the repository enabled?. Replace NAME with the repository name |
| sys_repository_custom_distro            | no        | list       |         | Define optional distro native repositories                        |
| sys_repository_custom_distro.0.name     | yes       | string     |         | Define repository name                                            |
| sys_repository_custom_distro.0.package  | yes       | string     |         | Define package name                                               |
| sys_repository_custom_flatpak           | yes       | list       |         | Define optional flatpak repositories                              |
| sys_repository_custom_flatpak.0.name    | yes       | string     |         | Define repository name                                            |
| sys_repository_custom_flatpak.0.url     | yes       | string     |         | Define repository location                                        |
| sys_repository_custom_yum               | no        | list       |         | Define optional yum repositories                                  |
| sys_repository_custom_yum.0.name        | yes       | string     |         | Set repository short name                                         |
| sys_repository_custom_yum.0.description | yes       | string     |         | Describe content                                                  |
| sys_repository_custom_yum.0.url         | yes       | string     |         | Define repository source                                          |
| sys_repository_custom_yum.0.gpgkey      | no        | string     |         | Define gpgkey source                                              |
| sys_repository_custom_yum.0.sslcacert   | no        | string     |         | Define sslcert source                                             |
| sys_repository_custom_apt               | no        | list       |         | Define optional apt repositories                                  |
| sys_repository_custom_apt.0.name        | yes       | string     |         | Set repository short name                                         |
| sys_repository_custom_apt.0.suite       | yes       | string     |         | Set suite attribute                                               |
| sys_repository_custom_apt.0.component   | no        | string     |         | Set component attribute                                           |
| sys_repository_custom_apt.0.url         | yes       | string     |         | Define repository source                                          |
| sys_repository_custom_apt.0.gpgkey      | no        | string     |         | Define gpgkey source                                              |
| sys_repository_custom_apt.0.pgpkey      | no        | string     |         | Define pgpkey source                                              |

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

None

### Prerequisites

The Ansible engine must be already installed and configured for privileged access and remote execution.

### Installation Procedure

Manually install Ansible Collections from the Ansible Galaxy repository:

```shell
ansible-galaxy collection install --upgrade serdigital64.system
```

Automatic installation is also available by deploying [A:Platform64](https://aplatform64.readthedocs.io/en/latest/#deployment)

## Contributing

Help on implementing new features and maintaining the code base is welcomed.

Please see the [guidelines](https://aplatform64.readthedocs.io/en/latest/contributing/CONTRIBUTING) for further details.

## Author

- [SerDigital64](https://serdigital64.github.io/)

## License

[GPL-3.0-or-later](https://www.gnu.org/licenses/gpl-3.0.txt)
