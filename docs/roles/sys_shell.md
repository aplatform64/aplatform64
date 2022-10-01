# Ansible Role: serdigital64.system.sys_shell

## Purpose

Manage Unix shells provisioning.

Features available in the current version:

- Deploy application. Packages are defined in the variable `sys_shell_profiles`.
- Install shell plugins. Plugin catalog is defined in the variable `sys_shell_plugins`
  - zsh
- Configure user profile for shell types:
  - zsh
  - bash

Supported shells (defined in the variable `sys_shell_flavour`):

| Tag  | Shell name       |
| ---- | ---------------- |
| csh  | C Shell          |
| zsh  | Z Shell          |
| bash | Born Again Shell |
| ksh  | Korn Shell       |

The **sys_shell** Ansible-Role is part of the [A:Platform64](https://github.com/serdigital64/aplatform64) project and is available in the [system](https://aplatform64.readthedocs.io/en/latest/collections/system) Ansible-Collection.

## Usage

The following example is an **Ansible Playbook** that includes all the supported features:

[use this link if viewing the doc on github](https://github.com/aplatform64/system/blob/main/playbooks/sys_shell.yml)

```yaml
{% include "../examples/sys_shell.yml" %}
```

The playbook can be run by executing:

```shell
# Set ANSIBLE_COLLECTIONS_PATHS to the default location. Change as needed.
ANSIBLE_COLLECTIONS_PATHS="${HOME}/.ansible/collections"
ansible-playbook "${ANSIBLE_COLLECTIONS_PATHS}/ansible_collections/serdigital64/system/playbooks/sys_shell.yml"
```

## Role Parameters

### Actions

- Use **action-parameters** to control what tasks are enabled for the role to execute.
- Parameters should be declared as task level vars as they are intented to be dynamic.

```yaml
sys_shell:
  resolve_prereq:
  deploy:
  setup:
```

| Parameter                | Required? | Type    | Default | Purpose / Value                             |
| ------------------------ | --------- | ------- | ------- | ------------------------------------------- |
| sys_shell.resolve_prereq | no        | boolean | `false` | Enable automatic resolution of prequisites  |
| sys_shell.deploy         | no        | boolean | `false` | Enable installation of application packages |
| sys_shell.setup          | no        | boolean | `false` | Enable user shell profile configuration     |

### End State

- Use **end-state** parameters to define the target state after role execution.
- Parameters should be declared in **host_vars** or **group_vars** as they are intended to be permanent.

```yaml
sys_shell_catalog:
  zsh:
  bash:
  ksh:
  csh:
sys_shell_users:
  - name:
    flavour:
    access:
      user:
        owner:
      group:
        owner:
      mode:
        file:
        dir:
    home:
    paths:
    variables:
      - name:
        value:
        export:
    sources:
    include_system:
sys_shell_actions:
  setup:
    overwrite:
```

| Parameter                         | Required?  | Type       | Default | Purpose / Value                                                          |
| --------------------------------- | ---------- | ---------- | ------- | ------------------------------------------------------------------------ |
| sys_shell_catalog                 | no         | dictionary |         | Define what unix shells will be available on the system                  |
| sys_shell_catalog.zsh             | no         | boolean    | `false` | Enable processing of the zsh shell                                       |
| sys_shell_catalog.bash            | no         | boolean    | `false` | Enable processing of the bash shell                                      |
| sys_shell_catalog.csh             | no         | boolean    | `false` | Enable processing of the csh shell                                       |
| sys_shell_catalog.ksh             | no         | boolean    | `false` | Enable processing of the ksh shell                                       |
| sys_shell_user                    | yes(setup) | list       |         | Define the list of target users to setup                                 |
| sys_shell_user.name               | yes(setup) | string     |         | Login name                                                               |
| sys_shell_user.flavour            | yes(setup) | string     |         | Profile shell type. Use the associated tag from the supported shell list |
| sys_shell_user.access             | no         | dictionary |         | Define access permissions for profile files                              |
| sys_shell_user.access.user        | yes(setup) | dictionary |         | Define owning user                                                       |
| sys_shell_user.access.user.owner  | yes(setup) | string     |         | User name                                                                |
| sys_shell_user.access.group       | yes(setup) | dictionary |         | Define owning group                                                      |
| sys_shell_user.access.group.owner | yes(setup) | string     |         | Group name                                                               |
| sys_shell_user.access.mode        | no         | dictionary |         | Define file permissions                                                  |
| sys_shell_user.access.mode.file   | no         | string     |         | Define permissions for files. Use octal notation                         |
| sys_shell_user.access.mode.dir    | no         | string     |         | Define permissions for directories. Use octal notation                   |
| sys_shell_user.home               | no         | string     |         | Full path to the user's home directory                                   |
| sys_shell_user.paths              | no         | list       |         | List of full paths to add to the PATH variable                           |
| sys_shell_user.variables          | no         | list       |         | List of user defined variables to be added to the profile                |
| sys_shell_user.variables.0.name   | no         | string     |         | Variable name                                                            |
| sys_shell_user.variables.0.value  | no         | string     |         | Variable value                                                           |
| sys_shell_user.variables.0.export | no         | boolean    |         | Export the variable?                                                     |
| sys_shell_user.sources            | no         | list       |         | List of full path scripts to be included in the profile (source)         |
| sys_shell_user.include_system     | no         | boolean    |         | Include system wide profile?                                             |
| sys_shell_actions                 | no         | dictionary |         | Set action options                                                       |
| sys_shell_actions.setup           | no         | dictionary |         | Set setup action options                                                 |
| sys_shell_actions.setup.overwrite | no         | boolean    | `false` | Overwrite user configurations?                                           |

## Deployment

### OS Compatibility

The operating system compatibility list is defined in the variable: `sys_shell_platforms`

### Dependencies

- Ansible Collections:
  - serdigital64.automation
    - auto_ansible_node
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
