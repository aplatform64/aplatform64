# Ansible Role: serdigital64.development.dev_python

## Purpose

Manage provision of Python

Supported features in the current version:

- Deploy language and basic tools. Packages are defined in the variable `dev_python_profiles`.
  - Python versions:
    - CentOS8: v8, v9
    - OracleLinux8: v8, v9
    - Ubuntu20: v8, v9
    - Ubuntu21: v9, v10
    - Fedora33: v9
    - Fedora35: v10
    - Debian10: v7
    - Debian11: v9
  - Tools:
    - pip
    - venv
    - setuptools
    - wheel
- Provision isolated applications: this feature is used to install modules that can be used directly from the command line as stand-alone applications:
  - Dedicated directory
  - Virtual environment (venv)
  - Python Modules

The **dev_python** Ansible-Role is part of the [A:Platform64](https://github.com/aplatform64/aplatform64) project and is available in the [development](https://aplatform64.readthedocs.io/en/latest/collections/development) Ansible-Collection.

## Usage

The following example is an **Ansible Playbook** that includes all the supported features:

[use this link if viewing the doc on github](https://github.com/aplatform64/development/blob/main/playbooks/dev_python.yml)

```yaml
{% include "../examples/dev_python.yml" %}
```

The playbook can be run by executing:

```shell
# Set ANSIBLE_COLLECTIONS_PATHS to the default install location. Change as needed.
ANSIBLE_COLLECTIONS_PATHS="${HOME}/.ansible/collections"
ansible-playbook "${ANSIBLE_COLLECTIONS_PATHS}/ansible_collections/serdigital64/development/playbooks/dev_python.yml"
```

## Role Parameters

### Actions

- Use **action-parameters** to control what tasks are enabled for the role to execute.
- Parameters should be declared as task level vars as they are intented to be dynamic.

```yaml
dev_python:
  resolve_prereq:
  deploy:
  provision:
```

| Parameter                 | Required? | Type    | Default | Purpose / Value                                               |
| ------------------------- | --------- | ------- | ------- | ------------------------------------------------------------- |
| dev_python.resolve_prereq | no        | boolean | `false` | Enable automatic resolution of prequisites                    |
| dev_python.deploy         | no        | boolean | `false` | Enable installation of application packages                   |
| dev_python.provision      | no        | boolean | `false` | Enable provisioning of isolated applications (python modules) |

### End State

- Use **end-state** parameters to define the target state after role execution.
- Parameters should be declared in **host_vars** or **group_vars** as they are intended to be permanent.

```yaml
dev_python_application:
  name:
  type:
  version:
  installed:
dev_python_applications:
  - name:
    description:
    location:
    owner:
    group:
    modules:
      -
```

| Parameter                             | Required?      | Type       | Default         | Purpose / Value                              |
| ------------------------------------- | -------------- | ---------- | --------------- | -------------------------------------------- |
| dev_python_application                | no             | dictionary |                 | Set application package end state            |
| dev_python_application.name           | no             | string     | `"python"`      | Select application package name              |
| dev_python_application.type           | no             | string     | `"distro"`      | Select application package type              |
| dev_python_application.version        | no             | string     | `"latest"`      | Select application package version           |
| dev_python_application.installed      | no             | boolean    | `true`          | Set application package end state            |
| dev_python_applications.0.name        | yes(provision) | string     |                 | Application short name. Format: a-z 0-9      |
| dev_python_applications.0.description | no             | string     |                 | Short description                            |
| dev_python_applications.0.location    | yes(provision) | string     |                 | Full path where the app will be installed to |
| dev_python_applications.0.owner       | no             | string     | `"root"`        | Location owner                               |
| dev_python_applications.0.group       | no             | string     | `"root"`        | Location group                               |
| dev_python_applications.0.modules     | yes(provision) | list       |                 | List of Python modules that forms the app    |
| dev_python_applications.0.modules.0   | yes(provision) | string     |                 | Python module name                           |

## Deployment

### OS Compatibility

The operating system compatibility list is defined in the variable: `dev_python_platforms`

### Dependencies

- Ansible Collections:
  - serdigital64.backup
  - serdigital64.system

### Prerequisites

The Ansible engine must be already installed and configured for privileged access and remote execution.

In addition the following prerequisites can be automatically solved when running the playbook by setting the role action: `resolve_prereq: true`

- Package manager for the target application is installed and enabled.

### Installation Procedure

Manually install Ansible Collections from the Ansible Galaxy repository:

```shell
ansible-galaxy collection install --upgrade serdigital64.development
```

Automatic installation is also available by deploying [A:Platform64](https://aplatform64.readthedocs.io/en/latest/#deployment)

## Contributing

Help on implementing new features and maintaining the code base is welcomed.

Please see the [guidelines](https://aplatform64.readthedocs.io/en/latest/CONTRIBUTING) for further details.

## Author

- [SerDigital64](https://serdigital64.github.io/)

## License

[Apache-2.0](https://www.apache.org/licenses/LICENSE-2.0.txt)
