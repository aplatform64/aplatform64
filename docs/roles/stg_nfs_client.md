# Ansible Role: serdigital64.storage.stg_nfs_client

## Purpose

Manage the Linux NFS client

Supported features in the current version:

- Prepare environment:
  - Create main mount point path
- Deploy service. Packages are defined in the variable `stg_nfs_client_profiles`.
- Provision mounts:
  - Create mount point
  - Add entry to local fstab
  - Set mount state (mounted,unmounted)

The **stg_nfs_client** Ansible-Role is part of the [A:Platform64](https://github.com/serdigital64/aplatform64) project and is available in the [storage](https://aplatform64.readthedocs.io/en/latest/collections/storage) Ansible-Collection.

## Usage

The following example is an **Ansible Playbook** that includes all the supported features:

[use this link if viewing the doc on github](https://github.com/aplatform64/application/blob/main/playbooks/stg_nfs_client.yml)

```yaml
{% include "../examples/stg_nfs_client.yml" %}
```

The playbook can be run by executing:

```shell
# Set ANSIBLE_COLLECTIONS_PATHS to the default location. Change as needed.
ANSIBLE_COLLECTIONS_PATHS="${HOME}/.ansible/collections"
ansible-playbook "${ANSIBLE_COLLECTIONS_PATHS}/ansible_collections/serdigital64/storage/playbooks/stg_nfs_client.yml"
```

## Role Parameters

### Actions

- Use **action-parameters** to control what tasks are enabled for the role to execute.
- Parameters should be declared as task level vars as they are intented to be dynamic.

```yaml
stg_nfs_client:
  resolve_prereq:
  prepare:
  deploy:
  provision:
```

| Parameter                     | Required? | Type    | Default | Purpose / Value                               |
| ----------------------------- | --------- | ------- | ------- | --------------------------------------------- |
| stg_nfs_client.resolve_prereq | no        | boolean | `false` | Enable automatic resolution of prequisites    |
| stg_nfs_client.prepare        | no        | boolean | `false` | Enable environment preparation                |
| stg_nfs_client.deploy         | no        | boolean | `false` | Enable installation of application packages   |
| stg_nfs_client.provision      | no        | boolean | `false` | Enable provisioning of application components |

### End State

- Use **end-state** parameters to define the target state after role execution.
- Parameters should be declared in **host_vars** or **group_vars** as they are intended to be permanent.

```yaml
stg_nfs_client_application:
  name:
  type:
  version:
  installed:
stg_nfs_client_paths:
  shares_root:
stg_nfs_client_imports:
  - name:
    mount:
    server:
    share:
    options:
    owner:
    group:
    mode:
    mounted:
```

| Parameter                            | Required?      | Type       | Default             | Purpose / Value                                                       |
| ------------------------------------ | -------------- | ---------- | ------------------- | --------------------------------------------------------------------- |
| stg_nfs_client_application           | yes(deploy)    | dictionary |                     | Set application package end state                                     |
| stg_nfs_client_application.name      | yes            | string     | `"nfs_client"`      | Select application package name                                       |
| stg_nfs_client_application.type      | yes            | string     | `"distro"`          | Select application package type                                       |
| stg_nfs_client_application.version   | yes            | string     | `"latest"`          | Select application package version                                    |
| stg_nfs_client_application.installed | yes            | boolean    | `true`              | Set application package end state                                     |
| stg_nfs_client_paths                 | yes(prepare)   | dictionary |                     | Set paths                                                             |
| stg_nfs_client_paths.shares_root     | yes            | string     | `"/srv/nfs-client"` | Location where mounts will be created                                 |
| stg_nfs_client_imports               | yes(provision) | list       |                     |                                                                       |
| stg_nfs_client_imports.0.name        | no             | string     |                     | Share name                                                            |
| stg_nfs_client_imports.0.mount       | yes            | string     |                     | Local path where the share will be mounted. Relative to the root_path |
| stg_nfs_client_imports.0.server      | yes            | string     |                     | FQDN of the server exporting the share                                |
| stg_nfs_client_imports.0.share       | yes            | string     |                     | Remote share path                                                     |
| stg_nfs_client_imports.0.options     | yes            | string     |                     | Local mount options                                                   |
| stg_nfs_client_imports.0.owner       | no             | string     | `"root"`            | Mount path owner                                                      |
| stg_nfs_client_imports.0.group       | no             | string     | `"root"`            | Mount path group                                                      |
| stg_nfs_client_imports.0.mode        | no             | string     | `"755`              | Mount path mode                                                       |
| stg_nfs_client_imports.0.mounted     | no             | boolean    | `true`              | Mount the share?                                                      |

## Deployment

### OS Compatibility

The operating system compatibility list is defined in the variable: `stg_nfs_client_platforms`

### Dependencies

- Ansible Collections:
  - serdigital64.backup
    - bkp_archive
  - serdigital64.system
    - sys_package
    - sys_repository
  - ansible.posix
    - mount

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
