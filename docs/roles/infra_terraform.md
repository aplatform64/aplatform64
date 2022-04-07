# Ansible Role: serdigital64.infrastructure.infra_terraform

## Purpose

Manage provisioning of the Terraform tool.

Supported features in the current version:

- Create directory structure for persistent and ephemeral data
- Deploy application. Packages are defined in the variable `infra_terraform_profiles`.
- Create initial configuration
- Create repositories for projects
- Provision projects (copy from source to state directory)
- Run terraform against projects

The module provides a directory structure for facilitating the usage of infrastructure-as-code with source-code-management tools:

- Separates ephemeral from persistent data
  - `/opt/terraform/`
  - `/var/opt/terraform/`
- Implements the usage of projects: repository for storing terraform scripts:
  - `/opt/terraform/src/<PROJECT>`: terraform source scripts
  - `/var/opt/terraform/states/<PROJECT>`: working directory where terraform is run (state, logs, etc.)

The **infra_terraform** Ansible-Role is part of the [A:Platform64](https://github.com/serdigital64/aplatform64) project and is available in the [infrastructure](https://aplatform64.readthedocs.io/en/latest/collections/infrastructure) Ansible-Collection.

## Usage

The following example is an **Ansible Playbook** that includes all the supported features:

[use this link if viewing the doc on github](https://github.com/aplatform64/infrastructure/blob/main/playbooks/infra_terraform.yml)

```yaml
{% include "../examples/infra_terraform.yml" %}
```

The playbook can be run by executing:

```shell
# Set ANSIBLE_COLLECTIONS_PATHS to the default install location. Change as needed.
ANSIBLE_COLLECTIONS_PATHS="${HOME}/.ansible/collections"
ansible-playbook "${ANSIBLE_COLLECTIONS_PATHS}/ansible_collections/serdigital64/infrastructure/playbooks/infra_terraform.yml"
```

## Role Parameters

### Actions

- Use **action-parameters** to control what tasks are enabled for the role to execute.
- Parameters should be declared as task level vars as they are intented to be dynamic.

```yaml
infra_terraform:
  resolve_prereq:
  prepare:
  deploy:
  setup:
  control:
  provision:
```

| Parameter                      | Required? | Type    | Default | Purpose / Value                               |
| ------------------------------ | --------- | ------- | ------- | --------------------------------------------- |
| infra_terraform.resolve_prereq | no        | boolean | `false` | Enable automatic resolution of prequisites    |
| infra_terraform.prepare        | no        | boolean | `false` | Enable environment preparation                |
| infra_terraform.deploy         | no        | boolean | `false` | Enable installation of application packages   |
| infra_terraform.setup          | no        | boolean | `false` | Enable application configuration              |
| infra_terraform.control        | no        | boolean | `false` | Enable application subsystem service control  |
| infra_terraform.provision      | no        | boolean | `false` | Enable provisioning of application components |

### End State

- Use **end-state** parameters to define the target state after role execution.
- Parameters should be declared in **host_vars** or **group_vars** as they are intended to be permanent.

```yaml
infra_terraform_application:
  name:
  type:
  version:
  installed:
infra_terraform_paths:
  root:
  etc:
  src:
  var:
infra_terraform_users:
  terraform:
    name:
    group:
    home:
infra_terraform_projects:
  - name:
```

| Parameter                             | Required?      | Type       | Default                | Purpose / Value                     |
| ------------------------------------- | -------------- | ---------- | ---------------------- | ----------------------------------- |
| infra_terraform_application           | no             | dictionary |                        | Set application package end state   |
| infra_terraform_application.name      | no             | string     | `"terraform"`          | Select application package name     |
| infra_terraform_application.type      | no             | string     | `"distro"`             | Select application package type     |
| infra_terraform_application.version   | no             | string     | `"latest"`             | Select application package version  |
| infra_terraform_application.installed | no             | boolean    | `true`                 | Set application package end state   |
| infra_terraform_paths                 | yes            | dictionary |                        | Set directory structure             |
| infra_terraform_paths.root            | yes            | string     | `"/opt/terraform"`     | Base path for persistent data       |
| infra_terraform_paths.etc             | yes            | string     | `"/opt/terraform/etc"` | Base path for configuration data    |
| infra_terraform_paths.src             | yes            | string     | `"/opt/terraform/src"` | Base path for project's source code |
| infra_terraform_paths.var             | yes            | string     | `"/var/opt/terraform"` | Base path for ephemeral data        |
| infra_terraform_users                 | yes            | dictionary |                        | Define users                        |
| infra_terraform_users.terraform       | yes            | dictionary |                        | Define directory structure owner    |
| infra_terraform_users.terraform.name  | yes            | string     | `"terraform"`          | Set login name                      |
| infra_terraform_users.terraform.group | yes            | string     | `"terraform"`          | Set group name                      |
| infra_terraform_users.terraform.home  | yes            | string     | `"/home/terraform"`    | Set home directory                  |
| infra_terraform_projects              | yes(provision) | list       |                        | Define projects                     |
| infra_terraform_projects.0.name       | yes(provision) | string     | `"default"`            | Project name                        |

## Deployment

### OS Compatibility

The operating system compatibility list is defined in the variable: `infra_terraform_platforms`

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
ansible-galaxy collection install --upgrade serdigital64.infrastructure
```

Automatic installation is also available by deploying [A:Platform64](https://aplatform64.readthedocs.io/en/latest/#deployment)

## Contributing

Help on implementing new features and maintaining the code base is welcomed.

Please see the [guidelines](https://aplatform64.readthedocs.io/en/latest/contributing/CONTRIBUTING) for further details.

## Author

- [SerDigital64](https://serdigital64.github.io/)

## License

[GPL-3.0-or-later](https://www.gnu.org/licenses/gpl-3.0.txt)
