# Ansible Role: serdigital64.security.sec_openssh_client

## Purpose

Manage provisioning of OpenSSH client.

Supported features in the current version:

- Deploy application. Packages are defined in the variable `sec_openssh_client_profiles`.

The **sec_openssh_client** Ansible-Role is part of the [A:Platform64](https://github.com/serdigital64/aplatform64) project and is available in the [security](https://aplatform64.readthedocs.io/en/latest/collections/security) Ansible-Collection.

## Usage

The following example is an **Ansible Playbook** that includes all the supported features:

[use this link if viewing the doc on github](https://github.com/aplatform64/security/blob/main/playbooks/sec_openssh_client.yml)

```yaml
{% include "../examples/sec_openssh_client.yml" %}
```

The playbook can be run by executing:

```shell
# Set ANSIBLE_COLLECTIONS_PATHS to the default install location. Change as needed.
ANSIBLE_COLLECTIONS_PATHS="${HOME}/.ansible/collections"
ansible-playbook "${ANSIBLE_COLLECTIONS_PATHS}/ansible_collections/serdigital64/security/playbooks/sec_openssh_client.yml"
```

## Role Parameters

### Actions

- Use **action-parameters** to control what tasks are enabled for the role to execute.
- Parameters should be declared as task level vars as they are intented to be dynamic.

```yaml
sec_openssh_client:
  resolve_prereq:
  deploy:
```

| Parameter                         | Required? | Type    | Default | Purpose / Value                            |
| --------------------------------- | --------- | ------- | ------- | ------------------------------------------ |
| sec_openssh_client.resolve_prereq | no        | boolean | `false` | Enable automatic resolution of prequisites |
| sec_openssh_client.deploy         | no        | boolean | `false` | Enable installation of application package |

### End State

- Use **end-state** parameters to define the target state after role execution.
- Parameters should be declared in **host_vars** or **group_vars** as they are intended to be permanent.

```yaml
sec_openssh_client_application:
  name:
  type:
  version:
  installed:
```

| Parameter                                | Required? | Type       | Default            | Purpose / Value                    |
| ---------------------------------------- | --------- | ---------- | ------------------ | ---------------------------------- |
| sec_openssh_client_application           | no        | dictionary |                    | Set application package end state  |
| sec_openssh_client_application.name      | no        | string     | `"openssh_client"` | Select application package name    |
| sec_openssh_client_application.type      | no        | string     | `"distro"`         | Select application package type    |
| sec_openssh_client_application.version   | no        | string     | `"latest"`         | Select application package version |
| sec_openssh_client_application.installed | no        | boolean    | `true`             | Set application package end state  |

## Deployment

### OS Compatibility

The operating system compatibility list is defined in the variable: `sec_openssh_client_platforms`

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
