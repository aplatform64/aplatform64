---
title: "Ansible Role: serdigital64.development.dev_java"
description: "Manage provisioning of Java"
authors:
  - SerDigital64
tags:
  - ansible
  - devops
  - linux
  - automation
---

# Ansible Role: serdigital64.development.dev_java

## Purpose

Manage provisioning of Java

Supported features in the current version:

- Deploy language. Packages are defined in the variable `dev_java_profiles`.

Supported JAVA versions:

- OpenJDK v8
- OpenJDK v11
- OpenJDK v17

The **dev_java** Ansible-Role is part of the [A:Platform64](https://github.com/serdigital64/aplatform64) project and is available in the [development](https://aplatform64.readthedocs.io/en/latest/collections/development) Ansible-Collection.

## Usage

The following example is an **Ansible Playbook** that includes all the supported features:

[use this link if viewing the doc on github](https://github.com/aplatform64/development/blob/main/playbooks/dev_java.yml)

```yaml
{% include "../../collections/serdigital64/development/playbooks/dev_java.yml" %}
```

The playbook can be run by executing:

```shell
# Set ANSIBLE_COLLECTIONS_PATHS to the default install location. Change as needed.
ANSIBLE_COLLECTIONS_PATHS="${HOME}/.ansible/collections"
ansible-playbook "${ANSIBLE_COLLECTIONS_PATHS}/ansible_collections/serdigital64/development/playbooks/dev_java.yml"
```

## Role Parameters

### Actions

- Use **action-parameters** to control what tasks are enabled for the role to execute.
- Parameters should be declared as task level vars as they are intented to be dynamic.

```yaml
dev_java:
  resolve_prereq:
  deploy:
```

| Parameter               | Required? | Type    | Default | Purpose / Value                             |
| ----------------------- | --------- | ------- | ------- | ------------------------------------------- |
| dev_java.resolve_prereq | no        | boolean | `false` | Enable automatic resolution of prequisites  |
| dev_java.deploy         | no        | boolean | `false` | Enable installation of application packages |

### End State

- Use **end-state** parameters to define the target state after role execution.
- Parameters should be declared in **host_vars** or **group_vars** as they are intended to be permanent.

```yaml
dev_java_application:
  openjdk_jdk_v1_8:
    name:
    type:
    version:
    installed:
  openjdk_jdk_v1_11:
    name:
    type:
    version:
    installed:
  openjdk_jdk_v1_17:
    name:
    type:
    version:
    installed:
```

| Parameter                                        | Required? | Type       | Default               | Purpose / Value                    |
| ------------------------------------------------ | --------- | ---------- | --------------------- | ---------------------------------- |
| dev_java_application                             | no        | dictionary |                       | Set application package end state  |
| dev_java_application.openjdk_jdk_v1_8            | no        | dictionary |                       | Set application package end state  |
| dev_java_application.openjdk_jdk_v1_8.name       | no        | string     | `"openjdk_jdk_v1_8"`  | Select application package name    |
| dev_java_application.openjdk_jdk_v1_8.type       | no        | string     | `"distro"`            | Select application package type    |
| dev_java_application.openjdk_jdk_v1_8.version    | no        | string     | `"latest"`            | Select application package version |
| dev_java_application.openjdk_jdk_v1_8.installed  | no        | boolean    | `false`               | Set application package end state  |
| dev_java_application.openjdk_jdk_v1_11           | no        | dictionary |                       | Set application package end state  |
| dev_java_application.openjdk_jdk_v1_11.name      | no        | string     | `"openjdk_jdk_v1_11"` | Select application package name    |
| dev_java_application.openjdk_jdk_v1_11.type      | no        | string     | `"distro"`            | Select application package type    |
| dev_java_application.openjdk_jdk_v1_11.version   | no        | string     | `"latest"`            | Select application package version |
| dev_java_application.openjdk_jdk_v1_11.installed | no        | boolean    | `false`               | Set application package end state  |
| dev_java_application.openjdk_jdk_v1_17           | no        | dictionary |                       | Set application package end state  |
| dev_java_application.openjdk_jdk_v1_17.name      | no        | string     | `"openjdk_jdk_v1_17"` | Select application package name    |
| dev_java_application.openjdk_jdk_v1_17.type      | no        | string     | `"distro"`            | Select application package type    |
| dev_java_application.openjdk_jdk_v1_17.version   | no        | string     | `"latest"`            | Select application package version |
| dev_java_application.openjdk_jdk_v1_17.installed | no        | boolean    | `true`                | Set application package end state  |

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
ansible-galaxy collection install --upgrade serdigital64.development
```

Automatic installation is also available by deploying [A:Platform64](https://aplatform64.readthedocs.io/en/latest/#deployment)

## Contributing

Help on implementing new features and maintaining the code base is welcomed.

Please see the [guidelines](https://aplatform64.readthedocs.io/en/latest/contributing/CONTRIBUTING) for further details.

## Author

- [SerDigital64](https://serdigital64.github.io/)

## License

[GPL-3.0-or-later](https://www.gnu.org/licenses/gpl-3.0.txt)
