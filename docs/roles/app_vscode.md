# Ansible Role: serdigital64.application.app_vscode

## Purpose

Manage provisioning of the VSCode application

Supported features in the current version:

- Deploy application. Packages are defined in the variable `app_vscode_profiles`.
- Setup user-level application configuration.
- Create user-level recommended extensions file.

The role defines in the variable `app_vscode_catalog` a curated list of extensions groupd by category. The recommended extension file will be created using group names from the catalog.

The **app_vscode** Ansible-Role is part of the [A:Platform64](https://github.com/aplatform64/aplatform64) project and is available in the [application](https://aplatform64.readthedocs.io/en/latest/collections/application) Ansible-Collection.

## Usage

The following example is an **Ansible Playbook** that includes all the supported features:

[use this link if viewing the doc on github](https://github.com/aplatform64/application/blob/main/playbooks/app_vscode.yml)

```yaml
{% include "../examples/app_vscode.yml" %}
```

The playbook can be run by executing:

```shell
# Set ANSIBLE_COLLECTIONS_PATHS to the default location. Change as needed.
ANSIBLE_COLLECTIONS_PATHS="${HOME}/.ansible/collections"
ansible-playbook "${ANSIBLE_COLLECTIONS_PATHS}/ansible_collections/serdigital64/application/playbooks/app_vscode.yml"
```

## Role Parameters

### Actions

- Use **action-parameters** to control what tasks are enabled for the role to execute.
- Parameters should be declared as task level vars as they are intented to be dynamic.

```yaml
app_vscode:
  resolve_prereq:
  deploy:
  setup:
```

| Parameter                 | Required? | Type    | Default | Purpose / Value                             |
| ------------------------- | --------- | ------- | ------- | ------------------------------------------- |
| app_vscode.resolve_prereq | no        | boolean | `false` | Enable automatic resolution of prequisites  |
| app_vscode.deploy         | no        | boolean | `false` | Enable installation of application packages |
| app_vscode.setup          | no        | boolean | `false` | Enable application setup                    |

### End State

- Use **end-state** parameters to define the target state after role execution.
- Parameters should be declared in **host_vars** or **group_vars** as they are intended to be permanent.

```yaml
app_vscode_application:
  name:
  type:
  version:
  installed:
app_vscode_users:
  - name:
    home:
    extensions:
app_vscode_default_extensions:
```

| Parameter                        | Required? | Type       | Default                    | Purpose / Value                                             |
| -------------------------------- | --------- | ---------- | -------------------------- | ----------------------------------------------------------- |
| app_vscode_application           | no        | dictionary |                            | Set application package end state                           |
| app_vscode_application.name      | no        | string     | `"vscode"`                 | Select application package name                             |
| app_vscode_application.type      | no        | string     | `"distro"`                 | Select application package type                             |
| app_vscode_application.version   | no        | string     | `"latest"`                 | Select application package version                          |
| app_vscode_application.installed | no        | boolean    | `true`                     | Set application package end state                           |
| app_vscode_users                 | no        | list       |                            | Target list of users where the app will be configured       |
| app_vscode_users.0.name          | yes       | string     |                            | User's login name                                           |
| app_vscode_users.0.home          | yes       | string     |                            | User's home directory, full path                            |
| app_vscode_users.0.extensions    | no        | list       |                            | List of extension groups as defined in `app_vscode_catalog` |
| app_vscode_default_extensions    | no        | list       | ["icons","themes","tools"] | List of default extension groups                            |

## Deployment

### OS Compatibility

The operating system compatibility list is defined in the variable: `app_vscode_platforms`

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
ansible-galaxy collection install --upgrade serdigital64.application
```

Automatic installation is also available by deploying [A:Platform64](https://aplatform64.readthedocs.io/en/latest/#deployment)

## Contributing

Help on implementing new features and maintaining the code base is welcomed.

Please see the [guidelines](https://aplatform64.readthedocs.io/en/latest/CONTRIBUTING) for further details.

## Author

- [SerDigital64](https://serdigital64.github.io/)

## License

[Apache-2.0](https://www.apache.org/licenses/LICENSE-2.0.txt)
