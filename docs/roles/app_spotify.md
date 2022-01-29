---
title: "Ansible Role: serdigital64.application.app_spotify"
description: "Manage provisioning of the Spotify application"
authors:
  - SerDigital64
tags:
  - ansible
  - devops
  - linux
  - automation
---

# Ansible Role: serdigital64.application.app_spotify

## Purpose

Manage provisioning of the Spotify application.

Supported features in the current version:

- Deploy application. Packages are defined in the variable `app_spotify_profiles`.

The **app_spotify** Ansible-Role is part of the [A:Platform64](https://github.com/serdigital64/aplatform64) project and is available in the [application](../collections/applicaspotify Ansible-Collection.

## Usage

The following example is an **Ansible Playbook** that includes all the supported features:

```yaml
{% include "../../collections/serdigital64/application/playbooks/app_spotify.yml" %}
```

The playbook can be run by executing:

```shell
# Set ANSIBLE_COLLECTIONS_PATHS to the default location. Change as needed.
ANSIBLE_COLLECTIONS_PATHS="${HOME}/.ansible/collections"
ansible-playbook "${ANSIBLE_COLLECTIONS_PATHS}/ansible_collections/serdigital64/application/playbooks/app_spotify.yml"
```

## Role Parameters

### Actions

- Use **action-parameters** to control what tasks are enabled for the role to execute.
- Parameters should be declared as task level vars as they are intented to be dynamic.

```yaml
app_spotify:
  resolve_prereq:
  deploy:
```

| Parameter                  | Required? | Type    | Default | Purpose / Value                             |
| -------------------------- | --------- | ------- | ------- | ------------------------------------------- |
| app_spotify.resolve_prereq | no        | boolean | `false` | Enable automatic resolution of prequspotify |
| app_spotify.deploy         | no        | boolean | `false` | Enable installation of application pspotify |

### End State

- Use **end-state** parameters to define the target state after role execution.
- Parameters should be declared in **host_vars** or **group_vars** as they are intended to be permanent.

```yaml
app_spotify_application:
  name:
  type:
  version:
  installed:
```

| Parameter                         | Required? | Type       | Default     | Purpose / Value                    |
| --------------------------------- | --------- | ---------- | ----------- | ---------------------------------- |
| app_spotify_application           | no        | dictionary |             | Set application package end state  |
| app_spotify_application.name      | no        | string     | `"spotify"` | Select application package name    |
| app_spotify_application.type      | no        | string     | `"flatpak"` | Select application package type    |
| app_spotify_application.version   | no        | string     | `"latest"`  | Select application package version |
| app_spotify_application.installed | no        | boolean    | `true`      | Set application package end state  |

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
ansible-galaxy collection install --upgrade serdigital64.application
```

Automatic installation is also available by deploying [A:Platform64](https://aplatform64.readthedocs.io/en/latest/#deployment)

## Contributing

Help on implementing new features and maintaining the code base is welcomed.

Please see the [guidelines](../contributing/guidelines.md) for further details.

## Author

- [SerDigital64](https://serdigital64.github.io/)

## License

[GPL-3.0-or-later](https://www.gnu.org/licenses/gpl-3.0.txt)
