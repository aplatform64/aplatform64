# Ansible Role: serdigital64.container.cnt_kubectl

## Purpose

Manage provisioning of KubeCtl.

Supported features in the current version:

- Deploy application. Packages are defined in the variable `cnt_kubectl_profiles`.

The **cnt_kubectl** Ansible-Role is part of the [A:Platform64](https://github.com/serdigital64/aplatform64) project and is available in the [container](https://aplatform64.readthedocs.io/en/latest/collections/container) Ansible-Collection.

## Usage

The following example is an **Ansible Playbook** that includes all the supported features:

[use this link if viewing the doc on github](https://github.com/aplatform64/container/blob/main/playbooks/cnt_kubectl.yml)

```yaml
{% include "../examples/cnt_kubectl.yml" %}
```

The playbook can be run by executing:

```shell
# Set ANSIBLE_COLLECTIONS_PATHS to the default location. Change as needed.
ANSIBLE_COLLECTIONS_PATHS="${HOME}/.ansible/collections"
ansible-playbook "${ANSIBLE_COLLECTIONS_PATHS}/ansible_collections/serdigital64/container/playbooks/cnt_kubectl.yml"
```

## Role Parameters

### Actions

- Use **action-parameters** to control what tasks are enabled for the role to execute.
- Parameters should be declared as task level vars as they are intented to be dynamic.

```yaml
cnt_kubectl:
  resolve_prereq:
  deploy:
```

| Parameter                  | Required? | Type    | Default | Purpose / Value                             |
| -------------------------- | --------- | ------- | ------- | ------------------------------------------- |
| cnt_kubectl.resolve_prereq | no        | boolean | `false` | Enable automatic resolution of prequisites  |
| cnt_kubectl.deploy         | no        | boolean | `false` | Enable installation of application packages |

### End State

- Use **end-state** parameters to define the target state after role execution.
- Parameters should be declared in **host_vars** or **group_vars** as they are intended to be permanent.

```yaml
cnt_kubectl_application:
  name:
  type:
  version:
  installed:
```

| Parameter                         | Required?   | Type       | Default           | Purpose / Value                    |
| --------------------------------- | ----------- | ---------- | ----------------- | ---------------------------------- |
| cnt_kubectl_application           | yes(deploy) | dictionary |                   | Set application package end state  |
| cnt_kubectl_application.name      | yes         | string     | `"kubectl"`       | Select application package name    |
| cnt_kubectl_application.type      | yes         | string     | `"distro","brew"` | Select application package type    |
| cnt_kubectl_application.version   | yes         | string     | `"latest"`        | Select application package version |
| cnt_kubectl_application.installed | yes         | boolean    | `true`            | Set application package end state  |

## Deployment

### OS Compatibility

The operating system compatibility list is defined in the variable: `cnt_kubectl_platforms`

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
ansible-galaxy collection install serdigital64.container
```

Automatic installation is also available by deploying [A:Platform64](https://aplatform64.readthedocs.io/en/latest/#deployment)

## Contributing

Help on implementing new features and maintaining the code base is welcomed.

Please see the [guidelines](https://aplatform64.readthedocs.io/en/latest/contributing/CONTRIBUTING) for further details.

## Author

- [SerDigital64](https://serdigital64.github.io/)

## License

[Apache-2.0](https://www.apache.org/licenses/LICENSE-2.0.txt)
