# Ansible Role: serdigital64.storage.stg_nfs_server

## Purpose

Manage the Linux NFS server

Supported features in the current version:

- Deploy application. Packages are defined in the variable `stg_nfs_server_profiles`.
- Control application subsystem services. Services are defined in the variable `stg_nfs_server_subsystems`.
- Configure application subsystem server.
- Configure OS level firewall rules. Rules are defined in the varible `stg_nfs_server_firewall_rules`
- Provision application components:
  - Add/Remove shares from the NFS exports list

The **stg_nfs_server** Ansible-Role is part of the [A:Platform64](https://github.com/aplatform64/aplatform64) project and is available in the [storage](https://aplatform64.readthedocs.io/en/latest/collections/storage) Ansible-Collection.

## Usage

The following example is an **Ansible Playbook** that includes all the supported features:

[use this link if viewing the doc on github](https://github.com/aplatform64/storage/blob/main/playbooks/stg_nfs_server.yml)

```yaml
{% include "../examples/stg_nfs_server.yml" %}
```

The playbook can be run by executing:

```shell
# Set ANSIBLE_COLLECTIONS_PATHS to the default location. Change as needed.
ANSIBLE_COLLECTIONS_PATHS="${HOME}/.ansible/collections"
ansible-playbook "${ANSIBLE_COLLECTIONS_PATHS}/ansible_collections/serdigital64/storage/playbooks/stg_nfs_server.yml"
```

## Role Parameters

### Actions

- Use **action-parameters** to control what tasks are enabled for the role to execute.
- Parameters should be declared as task level vars as they are intented to be dynamic.

```yaml
stg_nfs_server:
  resolve_prereq:
  deploy:
  setup:
  control:
  provision:
```

| Parameter                     | Required? | Type    | Default | Purpose / Value                               |
| ----------------------------- | --------- | ------- | ------- | --------------------------------------------- |
| stg_nfs_server.resolve_prereq | no        | boolean | `false` | Enable automatic resolution of prequisites    |
| stg_nfs_server.deploy         | no        | boolean | `false` | Enable installation of application packages   |
| stg_nfs_server.setup          | no        | boolean | `false` | Enable application configuration              |
| stg_nfs_server.control        | no        | boolean | `false` | Enable application subsystem service control  |
| stg_nfs_server.provision      | no        | boolean | `false` | Enable provisioning of application components |

### End State

- Use **end-state** parameters to define the target state after role execution.
- Parameters should be declared in **host_vars** or **group_vars** as they are intended to be permanent.

```yaml
stg_nfs_server_application:
  name:
  type:
  version:
  installed:
stg_nfs_server_subsystem:
  enabled:
  status:
stg_nfs_server_firewall:
  zone:
stg_nfs_server_exports:
  - path:
    options:
    enabled:
```

| Parameter                            | Required?          | Type       | Default        | Purpose / Value                     |
| ------------------------------------ | ------------------ | ---------- | -------------- | ----------------------------------- |
| stg_nfs_server_application           | yes(deploy)        | dictionary |                | Set application package end state   |
| stg_nfs_server_application.name      | yes                | string     | `"nfs_server"` | Select application package name     |
| stg_nfs_server_application.type      | yes                | string     | `"distro"`     | Select application package type     |
| stg_nfs_server_application.version   | yes                | string     | `"latest"`     | Select application package version  |
| stg_nfs_server_application.installed | yes                | boolean    | `true`         | Set application package end state   |
| stg_nfs_server_subsystem             | yes(control,setup) | dictionary |                | Set application subsystem end state |
| stg_nfs_server_subsystem.enabled     | yes                | boolean    | `false`        | Enable the subsystem?               |
| stg_nfs_server_subsystem.status      | yes                | string     | `"stopped"`    | Set the service state               |
| stg_nfs_server_firewall              | yes(control,setup) | dictionary |                | OS Firewall options                 |
| stg_nfs_server_firewall.zone         | yes                | string     | `"public"`     | Name of the target zone             |
| stg_nfs_server_exports               | yes(provision)     | dictionary |                | List of NFS shares to export        |
| stg_nfs_server_exports.0.path        | yes                | string     |                | Full path                           |
| stg_nfs_server_exports.0.options     | yes                | string     |                | NFS export optionss                 |
| stg_nfs_server_exports.0.enabled     | yes                | boolean    |                | Enable the export?                  |

## Deployment

### OS Compatibility

The operating system compatibility list is defined in the variable: `stg_nfs_server_platforms`

### Dependencies

- Ansible Collections:
  - serdigital64.backup
    - bkp_archive
  - serdigital64.system
    - sys_package
    - sys_repository
  - serdigital64.security
    - sec_firewall_os

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

Please see the [guidelines](https://aplatform64.readthedocs.io/en/latest/CONTRIBUTING.md) for further details.

## Author

- [SerDigital64](https://serdigital64.github.io/)

## License

[Apache-2.0](https://www.apache.org/licenses/LICENSE-2.0.txt)
