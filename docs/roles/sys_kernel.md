# Ansible Role: serdigital64.system.sys_kernel

## Purpose

Manage OS Kernel configuration.

Supported features in the current version:

- Provision sysctl tool
- Control Kernel subsystem tunables:
  - network
  - filesystem

The **sys_kernel** Ansible-Role is part of the [A:Platform64](https://github.com/aplatform64/aplatform64) project and is available in the [system](https://aplatform64.readthedocs.io/en/latest/collections/system) Ansible-Collection.

## Usage

The following example is an **Ansible Playbook** that includes all the supported features:

[use this link if viewing the doc on github](https://github.com/aplatform64/system/blob/main/playbooks/sys_kernel.yml)

```yaml
{% include "../examples/sys_kernel.yml" %}
```

The playbook can be run by executing:

```shell
# Set ANSIBLE_COLLECTIONS_PATHS to the default install location. Change as needed.
ANSIBLE_COLLECTIONS_PATHS="${HOME}/.ansible/collections"
ansible-playbook "${ANSIBLE_COLLECTIONS_PATHS}/ansible_collections/serdigital64/system/playbooks/sys_kernel.yml"
```

## Role Parameters

### Actions

- Use **action-parameters** to control what tasks are enabled for the role to execute.
- Parameters should be declared as task level vars as they are intented to be dynamic.

```yaml
sys_kernel:
  resolve_prereq:
  deploy:
  setup:
```

| Parameter                 | Required? | Type    | Default | Purpose / Value                             |
| ------------------------- | --------- | ------- | ------- | ------------------------------------------- |
| sys_kernel.resolve_prereq | no        | boolean | `false` | Enable automatic resolution of prequisites  |
| sys_kernel.deploy         | no        | boolean | `false` | Enable installation of application packages |
| sys_kernel.setup          | no        | boolean | `false` | Enable application configuration            |

### End State

- Use **end-state** parameters to define the target state after role execution.
- Parameters should be declared in **host_vars** or **group_vars** as they are intended to be permanent.

```yaml
sys_kernel_tunables:
  net:
    ipv4:
      ip_forward:
  fs:
    file_max:
    inotify:
      max_queued_events:
      max_user_instances:
      max_user_watches:
```

| Parameter                                         | Required? | Type       | Default | Purpose / Value           |
| ------------------------------------------------- | --------- | ---------- | ------- | ------------------------- |
| sys_kernel_tunables                               | no        | dictionary |         | Set kernel tunables       |
| sys_kernel_tunables.net                           | no        | dictionary |         | Tune network subsystem    |
| sys_kernel_tunables.net.ipv4                      | no        | dictionary |         | Set IPv4 tunables         |
| sys_kernel_tunables.net.ipv4.ip_forwad            | no        | boolean    |         | Set tunable               |
| sys_kernel_tunables.fs                            | no        | dictionary |         | Tune filesystem subsystem |
| sys_kernel_tunables.fs.file_max                   | no        | string     |         | Set tunable               |
| sys_kernel_tunables.fs.inotify                    | no        | dictionary |         | Set inotify tunables      |
| sys_kernel_tunables.fs.inotify.max_queued_events  | no        | string     |         | Set tunable               |
| sys_kernel_tunables.fs.inotify.max_user_instances | no        | string     |         | Set tunable               |
| sys_kernel_tunables.fs.inotify.max_user_watches   | no        | string     |         | Set tunable               |

## Deployment

### OS Compatibility

The operating system compatibility list is defined in the variable: `sys_kernel_platforms`

### Dependencies

- Ansible Collections:
  - serdigital64.backup
    - bkp_archive
  - serdigital64.system
    - sys_package
    - sys_repository
  - ansible.posix
    - sysctl

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

Please see the [guidelines](https://aplatform64.readthedocs.io/en/latest/CONTRIBUTING) for further details.

## Author

- [SerDigital64](https://serdigital64.github.io/)

## License

[Apache-2.0](https://www.apache.org/licenses/LICENSE-2.0.txt)
