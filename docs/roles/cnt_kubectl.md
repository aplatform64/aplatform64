# Ansible Role: serdigital64.X_COLLECTION_NAME_X.cnt_kubectl

## Purpose

Manage provisioning of KubeCtl.

Supported features in the current version:

- Prepare environment for application deployment.
- Deploy application. Packages are defined in the variable `cnt_kubectl_profiles`.
- Control application subsystem services. Services are defined in the variable `cnt_kubectl_subsystems`.
- Configure application.
- Configure users.
- Configure application subsystem server.
- Provision application components.
- Configure OS level firewall rules. Rules are defined in the varible `cnt_kubectl_firewall_rules`

The **cnt_kubectl** Ansible-Role is part of the [A:Platform64](https://github.com/serdigital64/aplatform64) project and is available in the [X_COLLECTION_NAME_X](https://aplatform64.readthedocs.io/en/latest/collections/X_COLLECTION_NAME_X) Ansible-Collection.

## Usage

The following example is an **Ansible Playbook** that includes all the supported features:

[use this link if viewing the doc on github](https://github.com/aplatform64/X_COLLECTION_NAME_X/blob/main/playbooks/cnt_kubectl.yml)

```yaml
{ % include "../examples/cnt_kubectl.yml" % }
```

The playbook can be run by executing:

```shell
# Set ANSIBLE_COLLECTIONS_PATHS to the default location. Change as needed.
ANSIBLE_COLLECTIONS_PATHS="${HOME}/.ansible/collections"
ansible-playbook "${ANSIBLE_COLLECTIONS_PATHS}/ansible_collections/serdigital64/X_COLLECTION_NAME_X/playbooks/cnt_kubectl.yml"
```

## Role Parameters

### Actions

- Use **action-parameters** to control what tasks are enabled for the role to execute.
- Parameters should be declared as task level vars as they are intented to be dynamic.

```yaml
cnt_kubectl:
  resolve_prereq:
  prepare:
  deploy:
  setup:
  control:
  provision:
```

| Parameter                    | Required? | Type    | Default | Purpose / Value                               |
| ---------------------------- | --------- | ------- | ------- | --------------------------------------------- |
| cnt_kubectl.resolve_prereq | no        | boolean | `false` | Enable automatic resolution of prequisites    |
| cnt_kubectl.prepare        | no        | boolean | `false` | Enable environment preparation                |
| cnt_kubectl.deploy         | no        | boolean | `false` | Enable installation of application packages   |
| cnt_kubectl.setup          | no        | boolean | `false` | Enable application configuration              |
| cnt_kubectl.control        | no        | boolean | `false` | Enable application subsystem service control  |
| cnt_kubectl.provision      | no        | boolean | `false` | Enable provisioning of application components |

### End State

- Use **end-state** parameters to define the target state after role execution.
- Parameters should be declared in **host_vars** or **group_vars** as they are intended to be permanent.

```yaml
cnt_kubectl_application:
  name:
  type:
  version:
  installed:
cnt_kubectl_subsystem:
  enabled:
  status:
cnt_kubectl_server:
  X_DEFAULT_SERVER_OPTION_X:
cnt_kubectl_paths:
  X_DEFAULT_PATH_X:
cnt_kubectl_owners:
  X_DEFAULT_USER_X:
    name:
    group:
    home:
cnt_kubectl_firewall:
  zone:
cnt_kubectl_setup_users:
  - user:
    home:
# cnt_kubectl_actions:
#   setup:
#     X_ACTION_OPTION:
```

| Parameter                                      | Required?    | Type       | Default                             | Purpose / Value                     |
| ---------------------------------------------- | ------------ | ---------- | ----------------------------------- | ----------------------------------- |
| cnt_kubectl_application                      | yes(deploy)  | dictionary |                                     | Set application package end state   |
| cnt_kubectl_application.name                 | yes          | string     | `"kubectl"`                      | Select application package name     |
| cnt_kubectl_application.type                 | yes          | string     | `"X_APP_TYPE_X"`                    | Select application package type     |
| cnt_kubectl_application.version              | yes          | string     | `"X_APP_VERSION_X"`                 | Select application package version  |
| cnt_kubectl_application.installed            | yes          | boolean    | `true`                              | Set application package end state   |
| cnt_kubectl_subsystem                        | yes(control) | dictionary |                                     | Set application subsystem end state |
| cnt_kubectl_subsystem.enabled                | yes          | boolean    | `false`                             | Enable the subsystem?               |
| cnt_kubectl_subsystem.status                 | yes          | string     | `"stopped"`                         | Set the service state               |
| cnt_kubectl_server                           | yes(control) | dictionary |                                     | Set subsystem server options        |
| cnt_kubectl_server.X_DEFAULT_SERVER_OPTION_X | yes          | string     | `"X_DEFAULT_SERVER_OPTION_VALUE_X"` |                                     |
| cnt_kubectl_paths                            | yes(prepare) | dictionary |                                     | Set paths                           |
| cnt_kubectl_paths.X_DEFAULT_PATH_X           | yes          | string     | `"X_DEFAULT_PATH_VALUE_X"`          |                                     |
| cnt_kubectl_owners                           | yes(prepare) | dictionary |                                     | Define users                        |
| cnt_kubectl_owners.X_DEFAULT_USER_X          | yes          | dictionary |                                     | Define directory structure owner    |
| cnt_kubectl_owners.X_DEFAULT_USER_X.name     | yes          | string     | `"X_DEFAULT_USER_NAME_X"`           | Set login name                      |
| cnt_kubectl_owners.X_DEFAULT_USER_X.group    | yes          | string     | `"X_DEFAULT_USER_GROUP_X"`          | Set group name                      |
| cnt_kubectl_owners.X_DEFAULT_USER_X.home     | yes          | string     | `"X_DEFAULT_USER_HOME_X"`           | Set home directory                  |
| cnt_kubectl_firewall                         | yes(setup)   | dictionary |                                     | OS Firewall options                 |
| cnt_kubectl_firewall.zone                    | yes          | string     | `"public"`                          | Name of the target zone             |
| cnt_kubectl_setup_users                      | yes(setup)   | list       |                                     | List of users for the setup task    |
| cnt_kubectl_setup_users.0.user               | yes          | string     |                                     | User login name                     |
| cnt_kubectl_setup_users.0.home               | yes          | string     |                                     | Home full path                      |
| cnt_kubectl_actions                          | no           | dictionary |                                     | Set action options                  |
| cnt_kubectl_actions.setup                    | no           | dictionary |                                     | Set setup action options            |
| cnt_kubectl_actions.setup.X_ACTION_OPTION    | no           |            |                                     |                                     |

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
ansible-galaxy collection install serdigital64.X_COLLECTION_NAME_X
```

Automatic installation is also available by deploying [A:Platform64](https://aplatform64.readthedocs.io/en/latest/#deployment)

## Contributing

Help on implementing new features and maintaining the code base is welcomed.

Please see the [guidelines](https://aplatform64.readthedocs.io/en/latest/contributing/CONTRIBUTING) for further details.

## Author

- [SerDigital64](https://serdigital64.github.io/)

## License

[GPL-3.0-or-later](https://www.gnu.org/licenses/gpl-3.0.txt)
