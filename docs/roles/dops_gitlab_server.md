# Ansible Role: serdigital64.devops.dops_gitlab_server

## Purpose

Manage provisioning of GitLab Server

Supported features in the current version:

- Deploy application. Packages are defined in the variable `dops_gitlab_server_profiles`.
- Control application subsystem services. Services are defined in the variable `dops_gitlab_server_subsystems`.
- Configure OS level firewall rules. Rules are defined in the varible `dops_gitlab_server_firewall_rules`.
- Configure server options. Options are defined in the variable `dops_gitlab_server_server`.

The **dops_gitlab_server** Ansible-Role is part of the [A:Platform64](https://github.com/serdigital64/aplatform64) project and is available in the [devops](https://aplatform64.readthedocs.io/en/latest/collections/devops) Ansible-Collection.

## Usage

The following example is an **Ansible Playbook** that includes all the supported features:

[use this link if viewing the doc on github](https://github.com/aplatform64/devops/blob/main/playbooks/dops_gitlab_server.yml)

```yaml
{% include "../../collections/serdigital64/devops/playbooks/dops_gitlab_server.yml" %}
```

The playbook can be run by executing:

```shell
# Set ANSIBLE_COLLECTIONS_PATHS to the default location. Change as needed.
ANSIBLE_COLLECTIONS_PATHS="${HOME}/.ansible/collections"
ansible-playbook "${ANSIBLE_COLLECTIONS_PATHS}/ansible_collections/serdigital64/devops/playbooks/dops_gitlab_server.yml"
```

## Role Parameters

### Actions

- Use **action-parameters** to control what tasks are enabled for the role to execute.
- Parameters should be declared as task level vars as they are intented to be dynamic.

```yaml
dops_gitlab_server:
  resolve_prereq:
  deploy:
  setup:
  control:
```

| Parameter                         | Required? | Type    | Default | Purpose / Value                              |
| --------------------------------- | --------- | ------- | ------- | -------------------------------------------- |
| dops_gitlab_server.resolve_prereq | no        | boolean | `false` | Enable automatic resolution of prequisites   |
| dops_gitlab_server.deploy         | no        | boolean | `false` | Enable installation of application packages  |
| dops_gitlab_server.setup          | no        | boolean | `false` | Enable application configuration             |
| dops_gitlab_server.control        | no        | boolean | `false` | Enable application subsystem service control |

### End State

- Use **end-state** parameters to define the target state after role execution.
- Parameters should be declared in **host_vars** or **group_vars** as they are intended to be permanent.

```yaml
dops_gitlab_server_application:
  name:
  type:
  version:
  installed:
dops_gitlab_server_subsystem:
  enabled:
  status:
dops_gitlab_server_firewall:
  zone:
dops_gitlab_server_server:
  external_url:
```

| Parameter                                | Required?    | Type       | Default                | Purpose / Value                     |
| ---------------------------------------- | ------------ | ---------- | ---------------------- | ----------------------------------- |
| dops_gitlab_server_application           | yes(deploy)  | dictionary |                        | Set application package end state   |
| dops_gitlab_server_application.name      | yes          | string     | `"gitlab_server"`      | Select application package name     |
| dops_gitlab_server_application.type      | yes          | string     | `"distro"`             | Select application package type     |
| dops_gitlab_server_application.version   | yes          | string     | `"v14"`                | Select application package version  |
| dops_gitlab_server_application.installed | yes          | boolean    | `true`                 | Set application package end state   |
| dops_gitlab_server_subsystem             | yes(control) | dictionary |                        | Set application subsystem end state |
| dops_gitlab_server_subsystem.enabled     | yes          | boolean    | `false`                | Enable the subsystem?               |
| dops_gitlab_server_subsystem.status      | yes          | string     | `"stopped"`            | Set the service state               |
| dops_gitlab_server_server                | yes(control) | dictionary |                        | Set subsystem server options        |
| dops_gitlab_server_server.external_url   | yes          | string     | `"gitlab.localdomain"` | Server URL. Format: FQDN            |
| dops_gitlab_server_firewall              | yes(setup)   | dictionary |                        | OS Firewall options                 |
| dops_gitlab_server_firewall.zone         | yes          | string     | `"public"`             | Name of the target zone             |

## Deployment

### OS Compatibility

- CentOS8
- RedHat8
- AlmaLinux8
- OracleLinux8

### Dependencies

- Ansible Collections:
  - serdigital64.backup
    - bkp_archive
  - serdigital64.system
    - sys_package
    - sys_repository
  - serdigital64.security
    - sec_firewall_os

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
