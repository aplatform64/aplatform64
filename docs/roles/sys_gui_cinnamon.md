# Ansible Role: serdigital64.system.sys_gui_cinnamon

## Purpose

Manage provisioning of the Cinnamon desktop environment

Supported features in the current version:

- Prepare environment for application deployment.
- Deploy application. Packages are defined in the variable `sys_gui_cinnamon_profiles`.
- Provision application components:
  - Create user default configuration. Available sets are defined in the variable `sys_gui_cinnamon_dconf_catalog`:
    - desktop (theme, panel)
    - nemo
  - Deploy to system-wide DConf as local db

The **sys_gui_cinnamon** Ansible-Role is part of the [A:Platform64](https://github.com/aplatform64/aplatform64) project and is available in the [system](https://aplatform64.readthedocs.io/en/latest/collections/system) Ansible-Collection.

## Usage

The following example is an **Ansible Playbook** that includes all the supported features:

[use this link if viewing the doc on github](https://github.com/aplatform64/system/blob/main/playbooks/sys_gui_cinnamon.yml)

```yaml
{% include "../examples/sys_gui_cinnamon.yml" %}
```

The playbook can be run by executing:

```shell
# Set ANSIBLE_COLLECTIONS_PATHS to the default location. Change as needed.
ANSIBLE_COLLECTIONS_PATHS="${HOME}/.ansible/collections"
ansible-playbook "${ANSIBLE_COLLECTIONS_PATHS}/ansible_collections/serdigital64/system/playbooks/sys_gui_cinnamon.yml"
```

## Role Parameters

### Actions

- Use **action-parameters** to control what tasks are enabled for the role to execute.
- Parameters should be declared as task level vars as they are intented to be dynamic.

```yaml
sys_gui_cinnamon:
  resolve_prereq:
  prepare:
  deploy:
  provision:
```

| Parameter                       | Required? | Type    | Default | Purpose / Value                               |
| ------------------------------- | --------- | ------- | ------- | --------------------------------------------- |
| sys_gui_cinnamon.resolve_prereq | no        | boolean | `false` | Enable automatic resolution of prequisites    |
| sys_gui_cinnamon.prepare        | no        | boolean | `false` | Enable environment preparation                |
| sys_gui_cinnamon.deploy         | no        | boolean | `false` | Enable installation of application packages   |
| sys_gui_cinnamon.provision      | no        | boolean | `false` | Enable provisioning of application components |

### End State

- Use **end-state** parameters to define the target state after role execution.
- Parameters should be declared in **host_vars** or **group_vars** as they are intended to be permanent.

```yaml
sys_gui_cinnamon_dconf:
  desktop:
  nemo:
```

| Parameter                      | Required?      | Type       | Default                     | Purpose / Value             |
| ------------------------------ | -------------- | ---------- | --------------------------- | --------------------------- |
| sys_gui_cinnamon_dconf         | yes(provision) | dictionary |                             | Define user options         |
| sys_gui_cinnamon_dconf.desktop | yes            | string     | `"desktop_adapta_nokto_v1"` | Desktop configuration set   |
| sys_gui_cinnamon_dconf.nemo    | yes            | string     | `"nemo_v1"`                 | Nemo configuration set name |

## Deployment

### OS Compatibility

The operating system compatibility list is defined in the variable: `sys_gui_cinnamon_platforms`

### Dependencies

- Ansible Collections:
  - serdigital64.backup
    - bkp_archive
  - serdigital64.system
    - sys_package
    - sys_repository
    - sys_dconf

### Prerequisites

The Ansible engine must be already installed and configured for privileged access and remote execution.

In addition the following prerequisites can be automatically solved when running the playbook by setting the role action: `resolve_prereq: true`

- Package manager for the target application is installed and enabled.

### Installation Procedure

Manually install Ansible Collections from the Ansible Galaxy repository:

```shell
ansible-galaxy collection install serdigital64.system
```

Automatic installation is also available by deploying [A:Platform64](https://aplatform64.readthedocs.io/en/latest/#deployment)

## Contributing

Help on implementing new features and maintaining the code base is welcomed.

Please see the [guidelines](https://aplatform64.readthedocs.io/en/latest/CONTRIBUTING.md) for further details.

## Author

- [SerDigital64](https://serdigital64.github.io/)

## License

[Apache-2.0](https://www.apache.org/licenses/LICENSE-2.0.txt)
