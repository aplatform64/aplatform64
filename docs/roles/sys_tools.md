# Ansible Role: serdigital64.system.sys_tools

## Purpose

Manage basic OS tools provisioning.

Supported features in the current version:

- Deploy tools:
  - file
  - gawk
  - grep
  - groff
  - less
  - lsof
  - sed

The **sys_tools** Ansible-Role is part of the [A:Platform64](https://github.com/aplatform64/aplatform64) project and is available in the [system](https://aplatform64.readthedocs.io/en/latest/collections/system) Ansible-Collection.

## Usage

The following example is an **Ansible Playbook** that includes all the supported features:

[use this link if viewing the doc on github](https://github.com/aplatform64/system/blob/main/playbooks/sys_tools.yml)

```yaml
{% include "../examples/sys_tools.yml" %}
```

The playbook can be run by executing:

```shell
# Set ANSIBLE_COLLECTIONS_PATHS to the default install location. Change as needed.
ANSIBLE_COLLECTIONS_PATHS="${HOME}/.ansible/collections"
ansible-playbook "${ANSIBLE_COLLECTIONS_PATHS}/ansible_collections/serdigital64/system/playbooks/sys_tools.yml"
```

## Role Parameters

### Actions

- Use **action-parameters** to control what tasks are enabled for the role to execute.
- Parameters should be declared as task level vars as they are intented to be dynamic.

```yaml
sys_tools:
  resolve_prereq:
  deploy:
```

| Parameter                | Required? | Type    | Default | Purpose / Value                             |
| ------------------------ | --------- | ------- | ------- | ------------------------------------------- |
| sys_tools.resolve_prereq | no        | boolean | `false` | Enable automatic resolution of prequisites  |
| sys_tools.deploy         | no        | boolean | `false` | Enable installation of application packages |

### End State

- Use **end-state** parameters to define the target state after role execution.
- Parameters should be declared in **host_vars** or **group_vars** as they are intended to be permanent.

```yaml
sys_tools_catalog:
  file:
  gawk:
  grep:
  groff:
  less:
  lsof:
  sed:
```

| Parameter               | Required? | Type       | Default | Purpose / Value        |
| ----------------------- | --------- | ---------- | ------- | ---------------------- |
| sys_tools_catalog       | no        | dictionary |         | Define available tools |
| sys_tools_catalog.file  | no        | boolean    | `false` | Install the tool?      |
| sys_tools_catalog.gawk  | no        | boolean    | `false` | Install the tool?      |
| sys_tools_catalog.grep  | no        | boolean    | `false` | Install the tool?      |
| sys_tools_catalog.groff | no        | boolean    | `false` | Install the tool?      |
| sys_tools_catalog.less  | no        | boolean    | `false` | Install the tool?      |
| sys_tools_catalog.lsof  | no        | boolean    | `false` | Install the tool?      |
| sys_tools_catalog.sed   | no        | boolean    | `false` | Install the tool?      |

## Deployment

### OS Compatibility

The operating system compatibility list is defined in the variable: `sys_tools_platforms`

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

Please see the [guidelines](https://aplatform64.readthedocs.io/en/latest/contributing/CONTRIBUTING) for further details.

## Author

- [SerDigital64](https://serdigital64.github.io/)

## License

[Apache-2.0](https://www.apache.org/licenses/LICENSE-2.0.txt)
