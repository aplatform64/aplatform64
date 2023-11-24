# Ansible Role: serdigital64.backup.bkp_archive

## Purpose

Simplify the extraction of content from file archives.

Supported features in the current version:

- Uncompress single file archive. (e.g.: installer.xz -> installer)
- Uncompress single directory archive. (e.g.: application_content.tar.xz -> application_content/)

Archive formats:

- zip
- bzip2
- xz
- compress
- tar
- compressed tar

The **bkp_archive** Ansible-Role is part of the [A:Platform64](https://github.com/aplatform64/aplatform64) project and is available in the [backup](https://aplatform64.readthedocs.io/en/latest/collections/backup) Ansible-Collection.

## Usage

The following example is an **Ansible Playbook** that includes all the supported features:

[use this link if viewing the doc on github](https://github.com/aplatform64/backup/blob/main/playbooks/bkp_archive.yml)

```yaml
{% include "../examples/bkp_archive.yml" %}
```

The playbook can be run by executing:

```shell
# Set ANSIBLE_COLLECTIONS_PATHS to the default location. Change as needed.
ANSIBLE_COLLECTIONS_PATHS="${HOME}/.ansible/collections"
ansible-playbook "${ANSIBLE_COLLECTIONS_PATHS}/ansible_collections/serdigital64/backup/playbooks/bkp_archive.yml"
```

## Role Parameters

### Actions

- Use **action-parameters** to control what tasks are enabled for the role to execute.
- Parameters should be declared as task level vars as they are intented to be dynamic.

```yaml
bkp_archive:
  resolve_prereq:
  deploy:
  provision:
bkp_archive_files:
  - archive:
      path:
      file:
      keep:
    content:
      path:
      name:
      access:
        mode:
          file:
          dir:
          setype:
        owner:
        group:
```

| Parameter                                      | Required? | Type       | Default | Purpose / Value                                                       |
| ---------------------------------------------- | --------- | ---------- | ------- | --------------------------------------------------------------------- |
| bkp_archive.resolve_prereq                     | no        | boolean    | `false` | Enable automatic resolution of prequisites                            |
| bkp_archive.deploy                             | no        | boolean    | `false` | Enable installation of required operating system packages             |
| bkp_archive.provision                          | no        | boolean    | `false` | Enable processing of archive                                          |
| bkp_archive_files                              | yes       | list       |         | List of archive files                                                 |
| bkp_archive_files.0.archive                    | yes       | dictionary |         | File archive definition                                               |
| bkp_archive_files.0.archive.path               | yes       | string     |         | Full path to the archive file                                         |
| bkp_archive_files.0.archive.file               | yes       | string     |         | File archive name                                                     |
| bkp_archive_files.0.archive.keep               | no        | boolean    | `false` | Keep the archive after opening it?. If not the file is removed        |
| bkp_archive_files.0.content                    | no        | dictionary |         | Archive content definition                                            |
| bkp_archive_files.0.content.path               | yes       | string     |         | Full path where the content is located when not stored in the archive |
| bkp_archive_files.0.content.name               | yes       | string     |         | Target name                                                           |
| bkp_archive_files.0.content.access             | no        | dictionary |         | Archive content permissions and ownership definition                  |
| bkp_archive_files.0.content.access.mode.file   | no        | string     |         | File permissions (octal) when content is file                         |
| bkp_archive_files.0.content.access.mode.dir    | no        | string     |         | Directory permissions (octal) when content is directory               |
| bkp_archive_files.0.content.access.mode.setype | no        | string     |         | SELinux file type                                                     |
| bkp_archive_files.0.content.access.owner       | no        | string     |         | File owner: user                                                      |
| bkp_archive_files.0.content.access.group       | no        | string     |         | File owner: group                                                     |

### End State

- Use **end-state** parameters to define the target state after role execution.
- Parameters should be declared in **host_vars** or **group_vars** as they are intended to be permanent.

```yaml
bkp_archive_packages_installed:
```

| Parameter                      | Required? | Type    | Default | Purpose / Value           |
| ------------------------------ | --------- | ------- | ------- | ------------------------- |
| bkp_archive_packages_installed | no        | boolean | `true`  | Set the package end state |

## Deployment

### OS Compatibility

The operating system compatibility list is defined in the variable: `bkp_archive_platforms`

### Dependencies

- Ansible Collections:
  - serdigital64.system
    - sys_repository

### Prerequisites

The Ansible engine must be already installed and configured for privileged access and remote execution.

In addition the following prerequisites can be automatically solved when running the playbook by setting the role action: `resolve_prereq: true`

- Package managers for the target application are installed and enabled.

### Installation Procedure

Manually install Ansible Collections from the Ansible Galaxy repository:

```shell
ansible-galaxy collection install --upgrade serdigital64.backup
```

Automatic installation is also available by deploying [A:Platform64](https://aplatform64.readthedocs.io/en/latest/#deployment)

## Contributing

Help on implementing new features and maintaining the code base is welcomed.

Please see the [guidelines](https://aplatform64.readthedocs.io/en/latest/CONTRIBUTING.md) for further details.

## Author

- [SerDigital64](https://serdigital64.github.io/)

## License

[Apache-2.0](https://www.apache.org/licenses/LICENSE-2.0.txt)
