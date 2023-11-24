# Ansible Role: serdigital64.hardware.hw_gpu_amd

## Purpose

Manage provisioning of AMD GPU drivers.

Supported features in the current version:

- Deploy headless drivers with OpenCL support. Packages are defined in the variable `hw_gpu_amd_profiles`.
  _Download and open only. For now the install process is manual to avoid kernel level failures_

The **hw_gpu_amd** Ansible-Role is part of the [A:Platform64](https://github.com/aplatform64/aplatform64) project and is available in the [hardware](https://aplatform64.readthedocs.io/en/latest/collections/hardware) Ansible-Collection.

## Usage

The following example is an **Ansible Playbook** that includes all the supported features:

[use this link if viewing the doc on github](https://github.com/aplatform64/hardware/blob/main/playbooks/hw_gpu_amd.yml)

```yaml
{% include "../examples/hw_gpu_amd.yml" %}
```

The playbook can be run by executing:

```shell
# Set ANSIBLE_COLLECTIONS_PATHS to the default install location. Change as needed.
ANSIBLE_COLLECTIONS_PATHS="${HOME}/.ansible/collections"
ansible-playbook "${ANSIBLE_COLLECTIONS_PATHS}/ansible_collections/serdigital64/hardware/playbooks/hw_gpu_amd.yml"
```

## Role Parameters

### Actions

- Use **action-parameters** to control what tasks are enabled for the role to execute.
- Parameters should be declared as task level vars as they are intented to be dynamic.

```yaml
hw_gpu_amd:
  resolve_prereq:
  deploy:
```

| Parameter                 | Required? | Type    | Default | Purpose / Value                             |
| ------------------------- | --------- | ------- | ------- | ------------------------------------------- |
| hw_gpu_amd.resolve_prereq | no        | boolean | `false` | Enable automatic resolution of prequisites  |
| hw_gpu_amd.deploy         | no        | boolean | `false` | Enable installation of application packages |

### End State

- Use **end-state** parameters to define the target state after role execution.
- Parameters should be declared in **host_vars** or **group_vars** as they are intended to be permanent.

```yaml
hw_gpu_amd_application:
  name:
  type:
  version:
  installed:
```

| Parameter                        | Required? | Type       | Default    | Purpose / Value                    |
| -------------------------------- | --------- | ---------- | ---------- | ---------------------------------- |
| hw_gpu_amd_application           | no        | dictionary |            | Set application package end state  |
| hw_gpu_amd_application.name      | no        | string     | `"amdgpu"` | Select application package name    |
| hw_gpu_amd_application.type      | no        | string     | `"binary"` | Select application package type    |
| hw_gpu_amd_application.version   | no        | string     | `"v21_30"` | Select application package version |
| hw_gpu_amd_application.installed | no        | boolean    | `true`     | Set application package end state  |

## Deployment

### OS Compatibility

The operating system compatibility list is defined in the variable: `hw_gpu_amd_platforms`

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
ansible-galaxy collection install --upgrade serdigital64.hardware
```

Automatic installation is also available by deploying [A:Platform64](https://aplatform64.readthedocs.io/en/latest/#deployment)

## Contributing

Help on implementing new features and maintaining the code base is welcomed.

Please see the [guidelines](https://aplatform64.readthedocs.io/en/latest/CONTRIBUTING.md) for further details.

## Author

- [SerDigital64](https://serdigital64.github.io/)

## License

[Apache-2.0](https://www.apache.org/licenses/LICENSE-2.0.txt)
