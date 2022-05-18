# Ansible Role: serdigital64.infrastructure.infra_helm

## Purpose

Manage provisioning of Helm CLI.

Supported features in the current version:

- Prepare environment for application deployment.
- Deploy application. Packages are defined in the variable `infra_helm_profiles`.

The **infra_helm** Ansible-Role is part of the [A:Platform64](https://github.com/serdigital64/aplatform64) project and is available in the [infrastructure](https://aplatform64.readthedocs.io/en/latest/collections/infrastructure) Ansible-Collection.

## Usage

The following example is an **Ansible Playbook** that includes all the supported features:

[use this link if viewing the doc on github](https://github.com/aplatform64/infrastructure/blob/main/playbooks/infra_helm.yml)

```yaml
{% include "../examples/infra_helm.yml" %}
```

The playbook can be run by executing:

```shell
# Set ANSIBLE_COLLECTIONS_PATHS to the default location. Change as needed.
ANSIBLE_COLLECTIONS_PATHS="${HOME}/.ansible/collections"
ansible-playbook "${ANSIBLE_COLLECTIONS_PATHS}/ansible_collections/serdigital64/infrastructure/playbooks/infra_helm.yml"
```

## Role Parameters

### Actions

- Use **action-parameters** to control what tasks are enabled for the role to execute.
- Parameters should be declared as task level vars as they are intented to be dynamic.

```yaml
infra_helm:
  resolve_prereq:
  prepare:
  deploy:
```

| Parameter                 | Required? | Type    | Default | Purpose / Value                             |
| ------------------------- | --------- | ------- | ------- | ------------------------------------------- |
| infra_helm.resolve_prereq | no        | boolean | `false` | Enable automatic resolution of prequisites  |
| infra_helm.prepare        | no        | boolean | `false` | Enable environment preparation              |
| infra_helm.deploy         | no        | boolean | `false` | Enable installation of application packages |

### End State

- Use **end-state** parameters to define the target state after role execution.
- Parameters should be declared in **host_vars** or **group_vars** as they are intended to be permanent.

```yaml
infra_helm_application:
  name:
  type:
  version:
  installed:
infra_helm_paths:
  root:
infra_helm_owners:
  root:
    name:
    group:
```

| Parameter                        | Required?    | Type       | Default       | Purpose / Value                    |
| -------------------------------- | ------------ | ---------- | ------------- | ---------------------------------- |
| infra_helm_application           | yes(deploy)  | dictionary |               | Set application package end state  |
| infra_helm_application.name      | yes          | string     | `"helm"`      | Select application package name    |
| infra_helm_application.type      | yes          | string     | `"binary"`    | Select application package type    |
| infra_helm_application.version   | yes          | string     | `"latest"`    | Select application package version |
| infra_helm_application.installed | yes          | boolean    | `true`        | Set application package end state  |
| infra_helm_paths                 | yes(prepare) | dictionary |               | Set paths                          |
| infra_helm_paths.root            | yes          | string     | `"/opt/helm"` |                                    |
| infra_helm_owners                | yes(prepare) | dictionary |               | Define users                       |
| infra_helm_owners.root           | yes          | dictionary |               | Define directory structure owner   |
| infra_helm_owners.root.name      | yes          | string     | `"helm"`      | Set login name                     |
| infra_helm_owners.root.group     | yes          | string     | `"helm"`      | Set group name                     |

## Deployment

### OS Compatibility

The operating system compatibility list is defined in the variable: `infra_helm_platforms`

### Dependencies

- Ansible Collections:
  - serdigital64.backup
    - bkp_archive
  - serdigital64.system
    - sys_package
    - sys_repository
    - sys_user

### Prerequisites

The Ansible engine must be already installed and configured for privileged access and remote execution.

In addition the following prerequisites can be automatically solved when running the playbook by setting the role action: `resolve_prereq: true`

- Package manager for the target application is installed and enabled.

### Installation Procedure

Manually install Ansible Collections from the Ansible Galaxy repository:

```shell
ansible-galaxy collection install serdigital64.infrastructure
```

Automatic installation is also available by deploying [A:Platform64](https://aplatform64.readthedocs.io/en/latest/#deployment)

## Contributing

Help on implementing new features and maintaining the code base is welcomed.

Please see the [guidelines](https://aplatform64.readthedocs.io/en/latest/contributing/CONTRIBUTING) for further details.

## Author

- [SerDigital64](https://serdigital64.github.io/)

## License

[GPL-3.0-or-later](https://www.gnu.org/licenses/gpl-3.0.txt)
