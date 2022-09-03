# Ansible Role: serdigital64.automation.auto_ansible_node

## Purpose

Automate the management of Ansible Managed Nodes.

Supported features in the current version:

- Create managed node user.
- Grant root privilege to managed node user.
- Provision OpenSSH Key for remote access from managed node.

Notice that first time usage requires a bootstrap process where the role is run using temporary access credentials to perform the initial setup.

The **auto_ansible_node** Ansible-Role is part of the [A:Platform64](https://github.com/serdigital64/aplatform64) project and is available in the [automation](https://aplatform64.readthedocs.io/en/latest/collections/automation) Ansible-Collection.

## Usage

The following example is an **Ansible Playbook** that includes all the supported features:

[use this link if viewing the doc on github](https://github.com/aplatform64/automation/blob/main/playbooks/auto_ansible_node.yml)

```yaml
{% include "../examples/auto_ansible_node.yml" %}
```

The playbook can be run by executing:

```shell
# Set ANSIBLE_COLLECTIONS_PATHS to the default location. Change as needed.
ANSIBLE_COLLECTIONS_PATHS="${HOME}/.ansible/collections"
ansible-playbook "${ANSIBLE_COLLECTIONS_PATHS}/ansible_collections/serdigital64/automation/playbooks/auto_ansible_node.yml"
```

## Role Parameters

### Actions

- Use **action-parameters** to control what tasks are enabled for the role to execute.
- Parameters should be declared as task level vars as they are intented to be dynamic.

```yaml
auto_ansible_node:
  prepare:
  provision:
```

| Parameter | Required? | Type    | Default | Purpose / Value           |
| --------- | --------- | ------- | ------- | ------------------------- |
| prepare   | no        | boolean | false   | Enable preparation tasks  |
| provision | no        | boolean | false   | Enable provisioning tasks |

### End State

- Use **end-state** parameters to define the target state after role execution.
- Parameters should be declared in **host_vars** or **group_vars** as they are intended to be permanent.

```yaml
auto_ansible_node_paths:
  var:
auto_ansible_node_owners:
  node:
    user:
    group:
auto_ansible_node_key_file:
```

| Parameter                           | Required?      | Type       | Default             | Purpose / Value                  |
| ----------------------------------- | -------------- | ---------- | ------------------- | -------------------------------- |
| auto_ansible_node_paths             | yes(prepare)   | dictionary |                     | Set paths                        |
| auto_ansible_node_paths.var         | yes            | string     | `"/var/opt/amnode"` | Runtime data repository          |
| auto_ansible_node_owners            | yes(prepare)   | dictionary |                     | Define users                     |
| auto_ansible_node_owners.node       | yes            | dictionary |                     | Define directory structure owner |
| auto_ansible_node_owners.node.user  | yes            | string     | `"amnode"`          | Set login name                   |
| auto_ansible_node_owners.node.group | yes            | string     | `"amnode"`          | Set group name                   |
| auto_ansible_node_key_file          | yes(provision) | string     |                     | Path to the OpenSSH key file     |

## Deployment

### OS Compatibility

The operating system compatibility list is defined in the variable: `auto_ansible_node_platforms`

### Dependencies

- Ansible Collections:
  - ansible.posix
    - authorized_key

### Prerequisites

The Ansible engine must be already installed and configured for privileged access and remote execution.

In addition the following prerequisites must be met:

- Managed node:
  - Bootstrap user with sudo privilege
  - OS Packages:
    - OpenSSH server
    - Sudo
    - Python3

### Installation Procedure

Manually install Ansible Collections from the Ansible Galaxy repository:

```shell
ansible-galaxy collection install --upgrade serdigital64.automation
```

Automatic installation is also available by deploying [A:Platform64](https://aplatform64.readthedocs.io/en/latest/#deployment)

## Contributing

Help on implementing new features and maintaining the code base is welcomed.

Please see the [guidelines](https://aplatform64.readthedocs.io/en/latest/contributing/CONTRIBUTING) for further details.

## Author

- [SerDigital64](https://serdigital64.github.io/)

## License

[GPL-3.0-or-later](https://www.gnu.org/licenses/gpl-3.0.txt)
