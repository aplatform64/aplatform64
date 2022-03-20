# Ansible Role: serdigital64.devops.dops_yamllint

## Purpose

Manage provisioning of YAML Linter

Supported features in the current version:

- Deploy application. Packages are defined in the variable `dops_yamllint_profiles`.

The **dops_yamllint** Ansible-Role is part of the [A:Platform64](https://github.com/serdigital64/aplatform64) project and is available in the [devops](https://aplatform64.readthedocs.io/en/latest/collections/devops) Ansible-Collection.

## Usage

The following example is an **Ansible Playbook** that includes all the supported features:

[use this link if viewing the doc on github](https://github.com/aplatform64/devops/blob/main/playbooks/dops_yamllint.yml)

```yaml
{% include "../examples/dops_yamllint.yml" %}
```

The playbook can be run by executing:

```shell
# Set ANSIBLE_COLLECTIONS_PATHS to the default location. Change as needed.
ANSIBLE_COLLECTIONS_PATHS="${HOME}/.ansible/collections"
ansible-playbook "${ANSIBLE_COLLECTIONS_PATHS}/ansible_collections/serdigital64/devops/playbooks/dops_yamllint.yml"
```

## Role Parameters

### Actions

- Use **action-parameters** to control what tasks are enabled for the role to execute.
- Parameters should be declared as task level vars as they are intented to be dynamic.

```yaml
dops_yamllint:
  resolve_prereq:
  deploy:
```

| Parameter                    | Required? | Type    | Default | Purpose / Value                             |
| ---------------------------- | --------- | ------- | ------- | ------------------------------------------- |
| dops_yamllint.resolve_prereq | no        | boolean | `false` | Enable automatic resolution of prequisites  |
| dops_yamllint.deploy         | no        | boolean | `false` | Enable installation of application packages |

### End State

- Use **end-state** parameters to define the target state after role execution.
- Parameters should be declared in **host_vars** or **group_vars** as they are intended to be permanent.

```yaml
dops_yamllint_application:
  name:
  type:
  version:
  installed:
dops_yamllint_paths:
  root:
dops_yamllint_owners:
  app:
    name:
    group:
    home:
```

| Parameter                           | Required?    | Type       | Default            | Purpose / Value                    |
| ----------------------------------- | ------------ | ---------- | ------------------ | ---------------------------------- |
| dops_yamllint_application           | yes(deploy)  | dictionary |                    | Set application package end state  |
| dops_yamllint_application.name      | yes          | string     | `"yamllint"`       | Select application package name    |
| dops_yamllint_application.type      | yes          | string     | `"pip"`            | Select application package type    |
| dops_yamllint_application.version   | yes          | string     | `"latest"`         | Select application package version |
| dops_yamllint_application.installed | yes          | boolean    | `true`             | Set application package end state  |
| dops_yamllint_paths                 | yes(prepare) | dictionary |                    | Set paths                          |
| dops_yamllint_paths.root            | yes          | string     | `"/opt/yamllint"`  |                                    |
| dops_yamllint_owners                | yes(prepare) | dictionary |                    | Define users                       |
| dops_yamllint_owners.app            | yes          | dictionary |                    | Define directory structure owner   |
| dops_yamllint_owners.app.name       | yes          | string     | `"yamllint"`       | Set login name                     |
| dops_yamllint_owners.app.group      | yes          | string     | `"yamllint"`       | Set group name                     |
| dops_yamllint_owners.app.home       | yes          | string     | `"/home/yamllint"` | Set home directory                 |

## Deployment

### OS Compatibility

- CentOS8
- RedHat8
- AlmaLinux8
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

### Prerequisites

The Ansible engine must be already installed and configured for privileged access and remote execution.

In addition the following prerequisites can be automatically solved when running the playbook by setting the role action: `resolve_prereq: true`

- Package manager for the target application is installed and enabled.

### Installation Procedure

Manually install Ansible Collections from the Ansible Galaxy repository:

```shell
ansible-galaxy collection install serdigital64.devops
```

Automatic installation is also available by deploying [A:Platform64](https://aplatform64.readthedocs.io/en/latest/#deployment)

## Contributing

Help on implementing new features and maintaining the code base is welcomed.

Please see the [guidelines](https://aplatform64.readthedocs.io/en/latest/contributing/CONTRIBUTING) for further details.

## Author

- [SerDigital64](https://serdigital64.github.io/)

## License

[GPL-3.0-or-later](https://www.gnu.org/licenses/gpl-3.0.txt)
