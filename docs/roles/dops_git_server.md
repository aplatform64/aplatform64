---
title: "Ansible Role: serdigital64.devops.dops_git_server"
description: "Manage GIT server"
authors:
  - SerDigital64
tags:
  - ansible
  - devops
  - linux
  - automation
---

# Ansible Role: serdigital64.devops.dops_git_server

## Purpose

Manage GIT server

Supported features in the current version:

- Prepare application environment.
- Deploy application. Packages are defined in the variable `dops_git_server_profiles`.
- Provision GIT remote repositories

Supported remote access methods:

- SSH using client's public keys

The **dops_git_server** Ansible-Role is part of the [A:Platform64](https://github.com/serdigital64/aplatform64) project and is available in the [devops](https://aplatform64.readthedocs.io/en/latest/collections/devops) Ansible-Collection.

## Usage

The following example is an **Ansible Playbook** that includes all the supported features:

[use this link if viewing the doc on github](https://github.com/aplatform64/devops/blob/main/playbooks/dops_git_server.yml)

```yaml
{% include "../../collections/serdigital64/devops/playbooks/dops_git_server.yml" %}
```

The playbook can be run by executing:

```shell
# Set ANSIBLE_COLLECTIONS_PATHS to the default install location. Change as needed.
ANSIBLE_COLLECTIONS_PATHS="${HOME}/.ansible/collections"
ansible-playbook "${ANSIBLE_COLLECTIONS_PATHS}/ansible_collections/serdigital64/devops/playbooks/dops_git_server.yml"
```

## Role Parameters

### Actions

- Use **action-parameters** to control what tasks are enabled for the role to execute.
- Parameters should be declared as task level vars as they are intented to be dynamic.

```yaml
dops_git_server:
  resolve_prereq:
  prepare:
  deploy:
  provision:
```

| Parameter                      | Required? | Type    | Default | Purpose / Value                             |
| ------------------------------ | --------- | ------- | ------- | ------------------------------------------- |
| dops_git_server.resolve_prereq | no        | boolean | `false` | Enable automatic resolution of prequisites  |
| dops_git_server.prepare        | no        | boolean | `false` | Enable environment preparation              |
| dops_git_server.deploy         | no        | boolean | `false` | Enable installation of application packages |
| dops_git_server.provision      | no        | boolean | `false` | Enable repositories provisioning            |

### End State

- Use **end-state** parameters to define the target state after role execution.
- Parameters should be declared in **host_vars** or **group_vars** as they are intended to be permanent.

```yaml
dops_git_server_application:
  name:
  type:
  version:
  installed:
dops_git_server_subsystem:
  enabled:
  status:
dops_git_server_paths:
  root:
dops_git_server_repositories:
  - name:
    description:
    public_keys:
      -
```

| Parameter                                    | Required?       | Type       | Default      | Purpose / Value                                |
| -------------------------------------------- | --------------- | ---------- | ------------ | ---------------------------------------------- |
| dops_git_server_application                  | no              | dictionary |              | Set application package end state              |
| dops_git_server_application.name             | no              | string     | `"git"`      | Select application package name                |
| dops_git_server_application.type             | no              | string     | `"distro"`   | Select application package type                |
| dops_git_server_application.version          | no              | string     | `"latest"`   | Select application package version             |
| dops_git_server_application.installed        | no              | boolean    | `true`       | Set application package end state              |
| dops_git_server_paths                        | yes             | dictionary |              | Set application paths                          |
| dops_git_server_paths.root                   | yes             | string     | `"/srv/git"` | Base directory for GIT repositories            |
| dops_git_server_repositories                 | yes (provision) | list       |              | Define GIT repositories                        |
| dops_git_server_repositories.0.name          | yes             | string     |              | Set repository name. Valid chars: a-zA-Z0-9\_- |
| dops_git_server_repositories.0.description   | no              | string     |              | Set repository description                     |
| dops_git_server_repositories.0.public_keys   | no              | list       |              | List of client's SSH public keys               |
| dops_git_server_repositories.0.public_keys.0 | no              | string     |              | SSH Public key content                         |

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
  - serdigital64.system

### Prerequisites

The Ansible engine must be already installed and configured for privileged access and remote execution.

In addition the following prerequisites can be automatically solved when running the playbook by setting the role action: `resolve_prereq: true`

- Package manager for the target application is installed and enabled.

### Installation Procedure

Manually install Ansible Collections from the Ansible Galaxy repository:

```shell
ansible-galaxy collection install --upgrade serdigital64.devops
```

Automatic installation is also available by deploying [A:Platform64](https://aplatform64.readthedocs.io/en/latest/#deployment)

## Contributing

Help on implementing new features and maintaining the code base is welcomed.

Please see the [guidelines](https://aplatform64.readthedocs.io/en/latest/contributing/CONTRIBUTING) for further details.

## Author

- [SerDigital64](https://serdigital64.github.io/)

## License

[GPL-3.0-or-later](https://www.gnu.org/licenses/gpl-3.0.txt)
