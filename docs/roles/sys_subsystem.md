# Ansible Role: serdigital64.system.sys_subsystem

## Purpose

Manage Linux subsystem configuration

Supported features in the current version:

- Register custom subsystem
- Deploy subsystem optional tools. Packages are defined in the variable `sys_subsystem_profiles`.

Supported subsystem managers:

- SystemD

The **sys_subsystem** Ansible-Role is part of the [A:Platform64](https://github.com/aplatform64/aplatform64) project and is available in the [system](https://aplatform64.readthedocs.io/en/latest/collections/system) Ansible-Collection.

## Usage

The following example is an **Ansible Playbook** that includes all the supported features:

[use this link if viewing the doc on github](https://github.com/aplatform64/system/blob/main/playbooks/sys_subsystem.yml)

```yaml
{% include "../examples/sys_subsystem.yml" %}
```

The playbook can be run by executing:

```shell
# Set ANSIBLE_COLLECTIONS_PATHS to the default location. Change as needed.
ANSIBLE_COLLECTIONS_PATHS="${HOME}/.ansible/collections"
ansible-playbook "${ANSIBLE_COLLECTIONS_PATHS}/ansible_collections/serdigital64/system/playbooks/sys_subsystem.yml"
```

## Role Parameters

### Actions

- Use **action-parameters** to control what tasks are enabled for the role to execute.
- Parameters should be declared as task level vars as they are intented to be dynamic.

```yaml
sys_subsystem:
  resolve_prereq:
  deploy:
  setup:
```

| Parameter                    | Required? | Type    | Default | Purpose / Value                            |
| ---------------------------- | --------- | ------- | ------- | ------------------------------------------ |
| sys_subsystem.resolve_prereq | no        | boolean | `false` | Enable automatic resolution of prequisites |
| sys_subsystem.deploy         | no        | boolean | `false` | Enable installation of optional tools      |
| sys_subsystem.setup          | no        | boolean | `false` | Enable system services configuration       |

### End State

- Use **end-state** parameters to define the target state after role execution.
- Parameters should be declared in **host_vars** or **group_vars** as they are intended to be permanent.

```yaml
sys_subsystem_custom:
  - name:
    description:
    start_type:
      simple:
    working_directory:
    user:
    exec_start:
    restart:
      on_failure:
    std_output:
      none:
      journal:
    std_error:
      journal:
    wanted_by:
      multi_user:
```

| Parameter                                   | Required? | Type       | Default                                       | Purpose / Value                    |
| ------------------------------------------- | --------- | ---------- | --------------------------------------------- | ---------------------------------- |
| sys_subsystem_custom                        | no        | list       |                                               | List of custom services            |
| sys_subsystem_custom.0.name                 | yes       | string     |                                               | Service name                       |
| sys_subsystem_custom.0.description          | no        | string     | `"Service {{ sys_subsystem_custom.0.name }}"` | Service short description          |
| sys_subsystem_custom.0.start_type           | yes       | dictionary |                                               | Define the process start-up type   |
| sys_subsystem_custom.0.start_type.simple    | no        | boolean    |                                               | SystemD type: simple               |
| sys_subsystem_custom.0.working_directory    | no        | string     |                                               | Working directory, full path       |
| sys_subsystem_custom.0.user                 | no        | string     | 'root'                                        | User that will run the service     |
| sys_subsystem_custom.0.exec_start           | yes       | string     |                                               | Full path to the service program   |
| sys_subsystem_custom.0.restart              | no        | dictionary |                                               | Define when to restart the service |
| sys_subsystem_custom.0.on_failure           | no        | boolean    |                                               | SystemD Event: On Failure          |
| sys_subsystem_custom.0.std_output           | no        | dictionary |                                               | Where to redireect stdoutput to    |
| sys_subsystem_custom.0.journal              | no        | boolean    |                                               | Use SystemD Journal                |
| sys_subsystem_custom.0.std_error            | no        | dictionary |                                               | Where to redireect stderr to       |
| sys_subsystem_custom.0.journal              | no        | boolean    |                                               | Use SystemD Journal                |
| sys_subsystem_custom.0.wanted_by            | no        | string     |                                               | When to run the service            |
| sys_subsystem_custom.0.wanted_by.multi_user | no        | boolean    |                                               | SystemD Target: multi user         |

## Deployment

### OS Compatibility

The operating system compatibility list is defined in the variable: `sys_subsystem_platforms`

### Dependencies

- Ansible Collections:
  - serdigital64.backup
    - bkp_archive
  - serdigital64.system
    - sys_package
    - sys_repository
    - sys_package

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

Please see the [guidelines](https://aplatform64.readthedocs.io/en/latest/CONTRIBUTING.md) for further details.

## Author

- [SerDigital64](https://serdigital64.github.io/)

## License

[Apache-2.0](https://www.apache.org/licenses/LICENSE-2.0.txt)
