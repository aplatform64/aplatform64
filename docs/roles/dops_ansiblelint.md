# Ansible Role: serdigital64.devops.dops_ansiblelint

## Purpose

Manage provisioning of Ansible Linter.

Supported features in the current version:

- Deploy application. Packages are defined in the variable `dops_ansiblelint_profiles`.

The **dops_ansiblelint** Ansible-Role is part of the [A:Platform64](https://github.com/serdigital64/aplatform64) project and is available in the [devops](../collections/devops.md) Ansible-Collection.

## Usage

The following example is an **Ansible Playbook** that includes all the supported features:

[use this link if viewing the doc on github](../../collections/serdigital64/devops/playbooks/dops_ansiblelint.yml)

```yaml
{% include "../../collections/serdigital64/devops/playbooks/dops_ansiblelint.yml" %}
```

The playbook can be run by executing:

```shell
# Set ANSIBLE_COLLECTIONS_PATHS to the default location. Change as needed.
ANSIBLE_COLLECTIONS_PATHS="${HOME}/.ansible/collections"
ansible-playbook "${ANSIBLE_COLLECTIONS_PATHS}/ansible_collections/serdigital64/devops/playbooks/dops_ansiblelint.yml"
```

## Role Parameters

### Actions

- Use **action-parameters** to control what tasks are enabled for the role to execute.
- Parameters should be declared as task level vars as they are intented to be dynamic.

```yaml
dops_ansiblelint:
  resolve_prereq:
  deploy:
```

| Parameter                       | Required? | Type    | Default | Purpose / Value                             |
| ------------------------------- | --------- | ------- | ------- | ------------------------------------------- |
| dops_ansiblelint.resolve_prereq | no        | boolean | `false` | Enable automatic resolution of prequisites  |
| dops_ansiblelint.deploy         | no        | boolean | `false` | Enable installation of application packages |

### End State

- Use **end-state** parameters to define the target state after role execution.
- Parameters should be declared in **host_vars** or **group_vars** as they are intended to be permanent.

```yaml
dops_ansiblelint_application:
  name:
  type:
  version:
  installed:
dops_ansiblelint_paths:
  root:
dops_ansiblelint_owners:
  app:
    name:
    group:
    home:
```

| Parameter                              | Required?    | Type       | Default               | Purpose / Value                    |
| -------------------------------------- | ------------ | ---------- | --------------------- | ---------------------------------- |
| dops_ansiblelint_application           | yes(deploy)  | dictionary |                       | Set application package end state  |
| dops_ansiblelint_application.name      | yes          | string     | `"ansiblelint"`       | Select application package name    |
| dops_ansiblelint_application.type      | yes          | string     | `"pip"`               | Select application package type    |
| dops_ansiblelint_application.version   | yes          | string     | `"latest"`            | Select application package version |
| dops_ansiblelint_application.installed | yes          | boolean    | `true`                | Set application package end state  |
| dops_ansiblelint_paths                 | yes(prepare) | dictionary |                       | Set paths                          |
| dops_ansiblelint_paths.root            | yes          | string     | `"/opt/ansiblelint"`  |                                    |
| dops_ansiblelint_owners                | yes(prepare) | dictionary |                       | Define users                       |
| dops_ansiblelint_owners.app            | yes          | dictionary |                       | Define directory structure owner   |
| dops_ansiblelint_owners.app.name       | yes          | string     | `"ansiblelint"`       | Set login name                     |
| dops_ansiblelint_owners.app.group      | yes          | string     | `"ansiblelint"`       | Set group name                     |
| dops_ansiblelint_owners.app.home       | yes          | string     | `"/home/ansiblelint"` | Set home directory                 |

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

Please see the [guidelines](../contributing/guidelines.md) for further details.

## Author

- [SerDigital64](https://serdigital64.github.io/)

## License

[GPL-3.0-or-later](https://www.gnu.org/licenses/gpl-3.0.txt)
