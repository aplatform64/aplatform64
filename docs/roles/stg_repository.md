---
title: "Ansible Role: serdigital64.storage.stg_repository"
description: "Manage file repositories provisioning"
authors:
  - SerDigital64
tags:
  - ansible
  - storage
  - linux
  - automation
---

# Ansible Role: serdigital64.storage.stg_repository

## Purpose

Manage file repositories provisioning.

File repositories are simple directory structures that are created as resources for other roles to consume such as NFS servers, GIT servers, Samba servers, etc.

Supported features in the current version:

- Provision repositories:
  - Create repository owners
    - Users
    - Groups
  - Create repository location
    - Create directory
    - Set ownership
    - Set access permissions

The **stg_repository** Ansible-Role is part of the [A:Platform64](https://github.com/serdigital64/aplatform64) project and is available in the [storage](https://aplatform64.readthedocs.io/en/latest/collections/storage) Ansible-Collection.

## Usage

The following example is an **Ansible Playbook** that includes all the supported features:

[use this link if viewing the doc on github](https://github.com/aplatform64/storage/blob/main/playbooks/stg_repository.yml)

```yaml
{% include "../../collections/serdigital64/storage/playbooks/stg_repository.yml" %}
```

The playbook can be run by executing:

```shell
# Set ANSIBLE_COLLECTIONS_PATHS to the default location. Change as needed.
ANSIBLE_COLLECTIONS_PATHS="${HOME}/.ansible/collections"
ansible-playbook "${ANSIBLE_COLLECTIONS_PATHS}/ansible_collections/serdigital64/storage/playbooks/stg_repository.yml"
```

## Role Parameters

### Actions

- Use **action-parameters** to control what tasks are enabled for the role to execute.
- Parameters should be declared as task level vars as they are intented to be dynamic.

```yaml
stg_repository:
  prepare:
  provision:
```

| Parameter                | Required? | Type    | Default | Purpose / Value                     |
| ------------------------ | --------- | ------- | ------- | ----------------------------------- |
| stg_repository.prepare   | no        | boolean | `false` | Enable creationg of owners          |
| stg_repository.provision | no        | boolean | `false` | Enable provisioning of repositories |

### End State

- Use **end-state** parameters to define the target state after role execution.
- Parameters should be declared in **host_vars** or **group_vars** as they are intended to be permanent.

```yaml
stg_repositories_resources:
  <SHARE>:
    path:
    user:
    group:
    mode:
stg_repositories_users:
  - name:
    uid:
    group:
    shell:
    groups:
      -
stg_repositories_groups:
  - name:
    gid:
```

| Parameter                                | Required?      | Type       | Default | Purpose / Value               |
| ---------------------------------------- | -------------- | ---------- | ------- | ----------------------------- |
| stg_repositories_resources               | yes(provision) | dictionary |         | Repositories catalog          |
| stg_repositories_resources.<SHARE>       | yes            | dictionary |         | Repository definition         |
| stg_repositories_resources.<SHARE>.path  | yes            | string     |         | Full path                     |
| stg_repositories_resources.<SHARE>.user  | yes            | string     |         | Owning user                   |
| stg_repositories_resources.<SHARE>.group | yes            | string     |         | Owning group                  |
| stg_repositories_resources.<SHARE>.mode  | yes            | string     |         | Directory permissions (octal) |
| stg_repositories_users                   | no             | list       |         | Owning users catalog          |
| stg_repositories_users.0                 | no             | list       |         | Owning user definition        |
| stg_repositories_users.0.name            | yes            | string     |         | Login name                    |
| stg_repositories_users.0.uid             | no             | string     |         | User ID                       |
| stg_repositories_users.0.group           | no             | string     |         | Primary group name            |
| stg_repositories_users.0.shell           | no             | string     |         | Full path to the shell        |
| stg_repositories_users.0.groups          | no             | list       |         | List of secondary groups      |
| stg_repositories_users.0.groups.0.name   | no             | string     |         | Group name                    |
| stg_repositories_groups                  | no             | list       |         | Owning groups catalog         |
| stg_repositories_groups.0                | no             | list       |         | Group definition              |
| stg_repositories_groups.0.name           | yes            | string     |         | Name                          |
| stg_repositories_groups.0.gid            | no             | string     |         | Group ID                      |

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
  - serdigital64.system
    - sys_user

### Prerequisites

The Ansible engine must be already installed and configured for privileged access and remote execution.

In addition the following prerequisites can be automatically solved when running the playbook by setting the role action: `resolve_prereq: true`

- Package manager for the target application is installed and enabled.

### Installation Procedure

Manually install Ansible Collections from the Ansible Galaxy repository:

```shell
ansible-galaxy collection install serdigital64.storage
```

Automatic installation is also available by deploying [A:Platform64](https://aplatform64.readthedocs.io/en/latest/#deployment)

## Contributing

Help on implementing new features and maintaining the code base is welcomed.

Please see the [guidelines](https://aplatform64.readthedocs.io/en/latest/contributing/CONTRIBUTING) for further details.

## Author

- [SerDigital64](https://serdigital64.github.io/)

## License

[GPL-3.0-or-later](https://www.gnu.org/licenses/gpl-3.0.txt)
