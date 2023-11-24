# Ansible Role: serdigital64.application.app_tilix

## Purpose

Manage provisioning of the Tilix application

Supported features in the current version:

- Prepare environment for application deployment.
- Deploy application. Packages are defined in the variable `app_tilix_profiles`.
- Configure users.

The **app_tilix** Ansible-Role is part of the [A:Platform64](https://github.com/aplatform64/aplatform64) project and is available in the [application](https://aplatform64.readthedocs.io/en/latest/collections/application) Ansible-Collection.

## Usage

The following example is an **Ansible Playbook** that includes all the supported features:

[use this link if viewing the doc on github](https://github.com/aplatform64/application/blob/main/playbooks/app_tilix.yml)

```yaml
{% include "../examples/app_tilix.yml" %}
```

The playbook can be run by executing:

```shell
# Set ANSIBLE_COLLECTIONS_PATHS to the default location. Change as needed.
ANSIBLE_COLLECTIONS_PATHS="${HOME}/.ansible/collections"
ansible-playbook "${ANSIBLE_COLLECTIONS_PATHS}/ansible_collections/serdigital64/application/playbooks/app_tilix.yml"
```

## Role Parameters

### Actions

- Use **action-parameters** to control what tasks are enabled for the role to execute.
- Parameters should be declared as task level vars as they are intented to be dynamic.

```yaml
app_tilix:
  resolve_prereq:
  prepare:
  deploy:
  setup:
```

| Parameter                | Required? | Type    | Default | Purpose / Value                             |
| ------------------------ | --------- | ------- | ------- | ------------------------------------------- |
| app_tilix.resolve_prereq | no        | boolean | `false` | Enable automatic resolution of prequisites  |
| app_tilix.prepare        | no        | boolean | `false` | Enable environment preparation              |
| app_tilix.deploy         | no        | boolean | `false` | Enable installation of application packages |
| app_tilix.setup          | no        | boolean | `false` | Enable application configuration            |

### End State

- Use **end-state** parameters to define the target state after role execution.
- Parameters should be declared in **host_vars** or **group_vars** as they are intended to be permanent.

```yaml
app_tilix_application:
  name:
  type:
  version:
  installed:
app_tilix_dconf:
  tilix:
```

| Parameter                       | Required?   | Type       | Default     | Purpose / Value                    |
| ------------------------------- | ----------- | ---------- | ----------- | ---------------------------------- |
| app_tilix_application           | yes(deploy) | dictionary |             | Set application package end state  |
| app_tilix_application.name      | yes(deploy) | string     | `"tilix"`   | Select application package name    |
| app_tilix_application.type      | yes(deploy) | string     | `"distro"`  | Select application package type    |
| app_tilix_application.version   | yes(deploy) | string     | `"latest"`  | Select application package version |
| app_tilix_application.installed | yes(deploy) | boolean    | `true`      | Set application package end state  |
| app_tilix_dconf                 | yes(setup)  | dictionary |             | Define user options                |
| app_tilix_dconf.tilix           | yes         | string     | `"p10k_v1"` | Desktop configuration set          |

## Deployment

### OS Compatibility

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
ansible-galaxy collection install serdigital64.application
```

Automatic installation is also available by deploying [A:Platform64](https://aplatform64.readthedocs.io/en/latest/#deployment)

## Contributing

Help on implementing new features and maintaining the code base is welcomed.

Please see the [guidelines](https://aplatform64.readthedocs.io/en/latest/CONTRIBUTING.md) for further details.

## Author

- [SerDigital64](https://serdigital64.github.io/)

## License

[Apache-2.0](https://www.apache.org/licenses/LICENSE-2.0.txt)
