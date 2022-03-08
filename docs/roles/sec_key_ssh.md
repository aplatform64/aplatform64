---
title: "Ansible Role: serdigital64.security.sec_key_ssh"
description: "Manage SSH Keys provisioning"
authors:
  - SerDigital64
tags:
  - ansible
  - devops
  - linux
  - automation
---

# Ansible Role: serdigital64.security.sec_key_ssh

## Purpose

Manage SSH Keys provisioning.

Supported features in the current version:

- Create private/public key pairs
- Install public key from file or string to remote user@host
- Register remote host as known

The **sec_key_ssh** Ansible-Role is part of the [A:Platform64](https://github.com/serdigital64/aplatform64) project and is available in the [security](https://aplatform64.readthedocs.io/en/latest/collections/security) Ansible-Collection.

## Usage

The following example is an **Ansible Playbook** that includes all the supported features:

[use this link if viewing the doc on github](https://github.com/aplatform64/security/blob/main/playbooks/sec_key_ssh.yml)

```yaml
{% include "../examples/sec_key_ssh.yml" %}
```

The playbook can be run by executing:

```shell
# Set ANSIBLE_COLLECTIONS_PATHS to the default location. Change as needed.
ANSIBLE_COLLECTIONS_PATHS="${HOME}/.ansible/collections"
ansible-playbook "${ANSIBLE_COLLECTIONS_PATHS}/ansible_collections/serdigital64/security/playbooks/sec_key_ssh.yml"
```

## Role Parameters

### Actions

- Use **action-parameters** to control what tasks are enabled for the role to execute.
- Parameters should be declared as task level vars as they are intented to be dynamic.

```yaml
sec_key_ssh:
  setup:
```

| Parameter         | Required? | Type    | Default | Purpose / Value            |
| ----------------- | --------- | ------- | ------- | -------------------------- |
| sec_key_ssh.setup | no        | boolean | `false` | Enable SSH key setup tasks |

### End State

- Use **end-state** parameters to define the target state after role execution.
- Parameters should be declared in **host_vars** or **group_vars** as they are intended to be permanent.

```yaml
sec_key_ssh_pairs:
  - file:
    path:
    owner:
    group:
    type:
    size:
sec_key_ssh_remotes:
  - key_file:
    key_string:
    host:
    user:
sec_key_ssh_knownhosts:
  - file:
    owner:
    group:
    hash:
    hosts:
```

| Parameter                        | Required? | Type   | Default | Purpose / Value                                                    |
| -------------------------------- | --------- | ------ | ------- | ------------------------------------------------------------------ |
| sec_key_ssh_pairs                | no        | list   |         | Define list of ssh key pairs                                       |
| sec_key_ssh_pairs.0.file         | yes       | string |         | Private key file name. Public file will add the `.pub` extension   |
| sec_key_ssh_pairs.0.path         | yes       | string |         | Full path where the key pair will be written to                    |
| sec_key_ssh_pairs.0.owner        | yes       | string |         | Key pair owner                                                     |
| sec_key_ssh_pairs.0.group        | yes       | string |         | Key pair group owner                                               |
| sec_key_ssh_pairs.0.type         | no        | string |         | Key pair type. Valid format as in ssh-keygen                       |
| sec_key_ssh_pairs.0.size         | no        | string |         | Key pair size                                                      |
| sec_key_ssh_remotes              | no        | list   |         | Define list of remote hosts where public keys will be installed to |
| sec_key_ssh_remotes.0.key_file   | yes       | string |         | Full path to the public key file in the source host                |
| sec_key_ssh_remotes.0.key_string | yes       | string |         | Public key content. If set ignore `key_file`                       |
| sec_key_ssh_remotes.0.host       | yes       | string |         | Host name where the key will be installed to                       |
| sec_key_ssh_remotes.0.user       | yes       | string |         | To what user the key will be installed to                          |
| sec_key_ssh_knownhosts           | no        | list   |         | Define list of hosts to register as known                          |
| sec_key_ssh_knownhosts.0.file    | yes       | string |         | Full path to the known_hosts file                                  |
| sec_key_ssh_knownhosts.0.owner   | yes       | string |         | Known_hosts file owner                                             |
| sec_key_ssh_knownhosts.0.group   | yes       | string |         | Known_hosts file group owner                                       |
| sec_key_ssh_knownhosts.0.hash    | no        | bolean | false   | Hash the hostname before registering?                              |
| sec_key_ssh_knownhosts.0.hosts   | yes       | list   |         | List of hosts to register in the known_hosts file. Use FQDNs       |

## Deployment

### OS Compatibility

- CentOS8
- OracleLinux8
- Ubuntu20
- Ubuntu21
- Fedora33
- Fedora35
- Debian10
- Debian11

### Dependencies

- Ansible Collections:
  - community.crypto
    - openssh_keypair
  - ansible.posix
    - authorized_key

### Prerequisites

The Ansible engine must be already installed and configured for privileged access and remote execution.

In addition the following prerequisites must be met:

- Packages:
  - OpenSSH Client

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

[GPL-3.0-or-later](https://www.gnu.org/licenses/gpl-3.0.txt)
