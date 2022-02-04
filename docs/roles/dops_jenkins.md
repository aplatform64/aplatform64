---
title: "Ansible Role: serdigital64.devops.dops_jenkins"
description: "Manage Jenkins server"
authors:
  - SerDigital64
tags:
  - ansible
  - devops
  - linux
  - automation
---

# Ansible Role: serdigital64.devops.dops_jenkins

## Purpose

Manage Jenkins server

Supported features in the current version:

- Deploy application. Packages are defined in the variable `dops_jenkins_profiles`.
- Control application subsystem services. Services are defined in the variable `dops_jenkins_subsystems`.
- Configure application. Options are defined in the end-state: `dops_jenkins_server_options`
- Resolve dependencies
  - Install OpenJDK
  - Install daemonize tool
- Add OS level firewall rules

The **dops_jenkins** Ansible-Role is part of the [A:Platform64](https://github.com/serdigital64/aplatform64) project and is available in the [devops](../collections/devops.md) Ansible-Collection.

## Usage

The following example is an **Ansible Playbook** that includes all the supported features:

[use this link if viewing the doc on github](../../collections/serdigital64/devops/playbooks/dops_jenkins.yml)

```yaml
{% include "../../collections/serdigital64/devops/playbooks/dops_jenkins.yml" %}
```

The playbook can be run by executing:

```shell
# Set ANSIBLE_COLLECTIONS_PATHS to the default install location. Change as needed.
ANSIBLE_COLLECTIONS_PATHS="${HOME}/.ansible/collections"
ansible-playbook "${ANSIBLE_COLLECTIONS_PATHS}/ansible_collections/serdigital64/devops/playbooks/dops_jenkins.yml"
```

## Role Parameters

### Actions

- Use **action-parameters** to control what tasks are enabled for the role to execute.
- Parameters should be declared as task level vars as they are intented to be dynamic.

```yaml
dops_jenkins:
  resolve_prereq:
  deploy:
  setup:
  control:
```

| Parameter                   | Required? | Type    | Default | Purpose / Value                              |
| --------------------------- | --------- | ------- | ------- | -------------------------------------------- |
| dops_jenkins.resolve_prereq | no        | boolean | `false` | Enable automatic resolution of prequisites   |
| dops_jenkins.deploy         | no        | boolean | `false` | Enable installation of application packages  |
| dops_jenkins.setup          | no        | boolean | `false` | Enable application configuration             |
| dops_jenkins.control        | no        | boolean | `false` | Enable application subsystem service control |

### End State

- Use **end-state** parameters to define the target state after role execution.
- Parameters should be declared in **host_vars** or **group_vars** as they are intended to be permanent.

```yaml
dops_jenkins_application:
  name:
  type:
  version:
  installed:
dops_jenkins_subsystem:
  enabled:
  status:
dops_jenkins_server_options:
  port:
  listen_address:
dops_jenkins_firewall:
  zone:
```

| Parameter                                  | Required? | Type       | Default     | Purpose / Value                     |
| ------------------------------------------ | --------- | ---------- | ----------- | ----------------------------------- |
| dops_jenkins_application                   | no        | dictionary |             | Set application package end state   |
| dops_jenkins_application.name              | yes       | string     | `"jenkins"` | Select application package name     |
| dops_jenkins_application.type              | yes       | string     | `"distro"`  | Select application package type     |
| dops_jenkins_application.version           | yes       | string     | `"latest"`  | Select application package version  |
| dops_jenkins_application.installed         | yes       | boolean    | `true`      | Set application package end state   |
| dops_jenkins_subsystem                     | no        | dictionary |             | Set application subsystem end state |
| dops_jenkins_subsystem.enabled             | yes       | boolean    | `false`     | Enable the subsystem?               |
| dops_jenkins_subsystem.status              | yes       | string     | `"stopped"` | Set the service state               |
| dops_jenkins_server_options                | no        | dictionary |             | Set jenkins server options          |
| dops_jenkins_server_options.port           | no        | string     | `"8080"`    | Listen port                         |
| dops_jenkins_server_options.listen_address | no        | string     | `""`        | Listen address                      |
| dops_jenkins_firewall                      | no        | dictionary |             | OS Firewall options                 |
| dops_jenkins_firewall.zone                 | yes       | string     | `"public"`  | Name of the target zone             |

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
  - serdigital64.development
    - dev_java
- OS:
  - SystemD
  - Daemonize
- Packages:
  - OpenJDK11

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

Please see the [guidelines](../contributing/guidelines.md) for further details.

## Author

- [SerDigital64](https://serdigital64.github.io/)

## License

[GPL-3.0-or-later](https://www.gnu.org/licenses/gpl-3.0.txt)
