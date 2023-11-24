# Ansible Role: serdigital64.application.app_freecad

## Purpose

Manage provisioning of the FreeCAD application.

Supported features in the current version:

- Deploy application. Packages are defined in the variable `app_freecad_profiles`.

The **app_freecad** Ansible-Role is part of the [A:Platform64](https://github.com/aplatform64/aplatform64) project and is available in the [application](https://aplatform64.readthedocs.io/en/latest/collections/application) Ansible-Collection.

## Usage

The following example is an **Ansible Playbook** that includes all the supported features:

[use this link if viewing the doc on github](https://github.com/aplatform64/application/blob/main/playbooks/app_freecad.yml)

```yaml
{% include "../examples/app_freecad.yml" %}
```

The playbook can be run by executing:

```shell
# Set ANSIBLE_COLLECTIONS_PATHS to the default location. Change as needed.
ANSIBLE_COLLECTIONS_PATHS="${HOME}/.ansible/collections"
ansible-playbook "${ANSIBLE_COLLECTIONS_PATHS}/ansible_collections/serdigital64/application/playbooks/app_freecad.yml"
```

## Role Parameters

### Actions

- Use **action-parameters** to control what tasks are enabled for the role to execute.
- Parameters should be declared as task level vars as they are intented to be dynamic.

```yaml
app_freecad:
  resolve_prereq:
  deploy:
```

| Parameter                  | Required? | Type    | Default | Purpose / Value                             |
| -------------------------- | --------- | ------- | ------- | ------------------------------------------- |
| app_freecad.resolve_prereq | no        | boolean | `false` | Enable automatic resolution of prequisites  |
| app_freecad.deploy         | no        | boolean | `false` | Enable installation of application packages |

### End State

- Use **end-state** parameters to define the target state after role execution.
- Parameters should be declared in **host_vars** or **group_vars** as they are intended to be permanent.

```yaml
app_freecad_application:
  name:
  type:
  version:
  installed:
```

| Parameter                         | Required?   | Type       | Default     | Purpose / Value                    |
| --------------------------------- | ----------- | ---------- | ----------- | ---------------------------------- |
| app_freecad_application           | yes(deploy) | dictionary |             | Set application package end state  |
| app_freecad_application.name      | yes         | string     | `"freecad"` | Select application package name    |
| app_freecad_application.type      | yes         | string     | `"flatpak"` | Select application package type    |
| app_freecad_application.version   | yes         | string     | `"latest"`  | Select application package version |
| app_freecad_application.installed | yes         | boolean    | `true`      | Set application package end state  |

## Deployment

### OS Compatibility

The operating system compatibility list is defined in the variable: `app_freecad_platforms`

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
