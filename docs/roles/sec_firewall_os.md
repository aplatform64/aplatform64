# Ansible Role: serdigital64.security.sec_firewall_os

## Purpose

Manage provisioning of Operating System native Firewall

Supported features in the current version:

- Deploy application. Packages are defined in the variable `sec_firewall_os_profiles`.
- Configure application subsystem. Services are defined in the variable `sec_firewall_os_subsystems`.
- Provision Firewall rules:
  - firewalld

The **sec_firewall_os** Ansible-Role is part of the [A:Platform64](https://github.com/serdigital64/aplatform64) project and is available in the [security](https://aplatform64.readthedocs.io/en/latest/collections/security) Ansible-Collection.

## Usage

The following example is an **Ansible Playbook** that includes all the supported features:

[use this link if viewing the doc on github](https://github.com/aplatform64/security/blob/main/playbooks/sec_firewall_os.yml)

```yaml
{% include "../examples/sec_firewall_os.yml" %}
```

The playbook can be run by executing:

```shell
# Set ANSIBLE_COLLECTIONS_PATHS to the default install location. Change as needed.
ANSIBLE_COLLECTIONS_PATHS="${HOME}/.ansible/collections"
ansible-playbook "${ANSIBLE_COLLECTIONS_PATHS}/ansible_collections/serdigital64/security/playbooks/sec_firewall_os.yml"
```

## Role Parameters

### Actions

- Use **action-parameters** to control what tasks are enabled for the role to execute.
- Parameters should be declared as task level vars as they are intented to be dynamic.

```yaml
sec_firewall_os:
  resolve_prereq:
  deploy:
  setup:
  control:
  provision:
```

| Parameter                      | Required? | Type    | Default | Purpose / Value                              |
| ------------------------------ | --------- | ------- | ------- | -------------------------------------------- |
| sec_firewall_os.resolve_prereq | no        | boolean | `false` | Enable automatic resolution of prequisites   |
| sec_firewall_os.deploy         | no        | boolean | `false` | Enable installation of application packages  |
| sec_firewall_os.setup          | no        | boolean | `false` | Enable application configuration             |
| sec_firewall_os.control        | no        | boolean | `false` | Enable application subsystem service control |
| sec_firewall_os.provision      | no        | boolean | `false` | Enable firewall rules provisioning           |

### End State

- Use **end-state** parameters to define the target state after role execution.
- Parameters should be declared in **host_vars** or **group_vars** as they are intended to be permanent.

```yaml
sec_firewall_os_application:
  name:
  type:
  version:
  installed:
sec_firewall_os_subsystem:
  enabled:
  status:
sec_firewall_os_rules:
  - id:
    zone:
    service:
    port:
    allow:
```

| Parameter                             | Required? | Type       | Default              | Purpose / Value                             |
| ------------------------------------- | --------- | ---------- | -------------------- | ------------------------------------------- |
| sec_firewall_os_application           | no        | dictionary |                      | Set application package end state           |
| sec_firewall_os_application.name      | no        | string     | `"firewall_manager"` | Select application package name             |
| sec_firewall_os_application.type      | no        | string     | `"distro"`           | Select application package type             |
| sec_firewall_os_application.version   | no        | string     | `"latest"`           | Select application package version          |
| sec_firewall_os_application.installed | no        | boolean    | `true`               | Set application package end state           |
| sec_firewall_os_subsystem             | no        | dictionary |                      | Set application subsystem end state         |
| sec_firewall_os_subsystem.enabled     | no        | boolean    | `false`              | Enable the subsystem?                       |
| sec_firewall_os_subsystem.status      | no        | string     | `"stopped"`          | Set the service state                       |
| sec_firewall_os_rules                 | no        | list       |                      | List of firewall rules                      |
| sec_firewall_os_rules.0.id            | yes       | string     |                      | Short name to identify the rule from others |
| sec_firewall_os_rules.0.zone          | yes       | string     |                      | Apply the rule to this zone                 |
| sec_firewall_os_rules.0.service       | no        | string     |                      | Set the target service                      |
| sec_firewall_os_rules.0.port          | no        | string     |                      | Set the target port                         |
| sec_firewall_os_rules.0.allow         | yes       | boolean    |                      | Set the rule to allow or deny traffic       |

## Deployment

### OS Compatibility

The operating system compatibility list is defined in the variable: `sec_firewall_os_platforms`

### Dependencies

- Ansible Collections:

  - ansible.posix
    - firewalld
  - serdigital64.system
    - sys_package
    - sys_repository

- Python Modules
  - firewalld

### Prerequisites

The Ansible engine must be already installed and configured for privileged access and remote execution.

In addition the following prerequisites can be automatically solved when running the playbook by setting the role action: `resolve_prereq: true`

- Package manager for the target application is installed and enabled.

### Installation Procedure

Manually install Ansible Collections from the Ansible Galaxy repository:

```shell
ansible-galaxy collection install --upgrade serdigital64.security
```

Automatic installation is also available by deploying [A:Platform64](https://aplatform64.readthedocs.io/en/latest/#deployment)

## Contributing

Help on implementing new features and maintaining the code base is welcomed.

Please see the [guidelines](https://aplatform64.readthedocs.io/en/latest/contributing/CONTRIBUTING) for further details.

## Author

- [SerDigital64](https://serdigital64.github.io/)

## License

[Apache-2.0](https://www.apache.org/licenses/LICENSE-2.0.txt)
