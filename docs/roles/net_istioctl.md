# Ansible Role: serdigital64.network.net_istioctl

## Purpose

Manage provisioning of IstioCtl.

Supported features in the current version:

- Prepare environment for application deployment.
- Deploy application. Packages are defined in the variable `net_istioctl_profiles`.

The **net_istioctl** Ansible-Role is part of the [A:Platform64](https://github.com/aplatform64/aplatform64) project and is available in the [network](https://aplatform64.readthedocs.io/en/latest/collections/network) Ansible-Collection.

## Usage

The following example is an **Ansible Playbook** that includes all the supported features:

[use this link if viewing the doc on github](https://github.com/aplatform64/network/blob/main/playbooks/net_istioctl.yml)

```yaml
{% include "../examples/net_istioctl.yml" %}
```

The playbook can be run by executing:

```shell
# Set ANSIBLE_COLLECTIONS_PATHS to the default location. Change as needed.
ANSIBLE_COLLECTIONS_PATHS="${HOME}/.ansible/collections"
ansible-playbook "${ANSIBLE_COLLECTIONS_PATHS}/ansible_collections/serdigital64/network/playbooks/net_istioctl.yml"
```

## Role Parameters

### Actions

- Use **action-parameters** to control what tasks are enabled for the role to execute.
- Parameters should be declared as task level vars as they are intented to be dynamic.

```yaml
net_istioctl:
  resolve_prereq:
  prepare:
  deploy:
```

| Parameter                   | Required? | Type    | Default | Purpose / Value                             |
| --------------------------- | --------- | ------- | ------- | ------------------------------------------- |
| net_istioctl.resolve_prereq | no        | boolean | `false` | Enable automatic resolution of prequisites  |
| net_istioctl.prepare        | no        | boolean | `false` | Enable environment preparation              |
| net_istioctl.deploy         | no        | boolean | `false` | Enable installation of application packages |

### End State

- Use **end-state** parameters to define the target state after role execution.
- Parameters should be declared in **host_vars** or **group_vars** as they are intended to be permanent.

```yaml
net_istioctl_application:
  name:
  type:
  version:
  installed:
net_istioctl_paths:
  root:
net_istioctl_owners:
  root:
    name:
    group:
```

| Parameter                          | Required?    | Type       | Default           | Purpose / Value                    |
| ---------------------------------- | ------------ | ---------- | ----------------- | ---------------------------------- |
| net_istioctl_application           | yes(deploy)  | dictionary |                   | Set application package end state  |
| net_istioctl_application.name      | yes          | string     | `"istioctl"`      | Select application package name    |
| net_istioctl_application.type      | yes          | string     | `"binary"`        | Select application package type    |
| net_istioctl_application.version   | yes          | string     | `"latest"`        | Select application package version |
| net_istioctl_application.installed | yes          | boolean    | `true`            | Set application package end state  |
| net_istioctl_paths                 | yes(prepare) | dictionary |                   | Set paths                          |
| net_istioctl_paths.root            | yes          | string     | `"/opt/istioctl"` |                                    |
| net_istioctl_owners                | yes(prepare) | dictionary |                   | Define users                       |
| net_istioctl_owners.root           | yes          | dictionary |                   | Define directory structure owner   |
| net_istioctl_owners.root.name      | yes          | string     | `"istioctl"`      | Set login name                     |
| net_istioctl_owners.root.group     | yes          | string     | `"istioctl"`      | Set group name                     |

## Deployment

### OS Compatibility

The operating system compatibility list is defined in the variable: `net_istioctl_platforms`

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
ansible-galaxy collection install serdigital64.network
```

Automatic installation is also available by deploying [A:Platform64](https://aplatform64.readthedocs.io/en/latest/#deployment)

## Contributing

Help on implementing new features and maintaining the code base is welcomed.

Please see the [guidelines](https://aplatform64.readthedocs.io/en/latest/contributing/CONTRIBUTING) for further details.

## Author

- [SerDigital64](https://serdigital64.github.io/)

## License

[Apache-2.0](https://www.apache.org/licenses/LICENSE-2.0.txt)
