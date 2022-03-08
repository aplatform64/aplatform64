---
title: "Ansible Playbook: manage_doc_sites"
description: "Provision documentation site management tools"
authors:
  - SerDigital64
tags:
  - ansible
  - devops
  - linux
  - automation
---

# Ansible Playbook: manage_doc_sites

## Purpose

Provision documentation site management tools.

Supported features in the current version:

- Deploy static site generation tools:
  - MkDocs

## Use Cases

### Deploy MkDocs tool

- Verify that target nodes are registered in the inventory file: [doc_sites.ini](#inventory)
- Verify that target tools are selected in the playbook endstate file: [manage_doc_sites.yml](#end-state)
- Run the playbook. Use the `-s <SITE>` parameter to select the target site.

```shell
/opt/aplatform64/bin/ap64.sh -n -p manage_doc_sites -s <SITE>
```

## Playbook Parameters

### Inventory

Register the hosts that will consume the service in the Ansible Inventory file:

- File: `inventories/site/doc_sites.ini`
- Host Group: `doc_sites`

### End State

A dedicated group_vars directory is used to store end-state configuration settings for both the playbook and related Ansible Roles.

Set playbook specific settings in the file: `inventories/site/group_vars/doc_sites/manage_doc_sites.yml`

```yaml
manage_doc_sites_apps:
  mkdocs:
```

| Parameter                    | Required? | Type       | Default | Purpose / Value                           |
| ---------------------------- | --------- | ---------- | ------- | ----------------------------------------- |
| manage_doc_sites_apps        | no        | dictionary |         | Define what applications will be deployed |
| manage_doc_sites_apps.mkdocs | no        | boolean    | `true`  | Deploy the application?                   |

Additional role specific settings are available to further customize the playbook:

| A:Platform64 role                                                                | group_vars file                                            |
| -------------------------------------------------------------------------------- | ---------------------------------------------------------- |
| [serdigital64.system.sys_repository](../roles/sys_repository.md#role-parameters) | `inventories/site/group_vars/doc_sites/sys_repository.yml` |

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

Dependencies in this section are automatically solved during the installation process.

- Ansible Collections:
  - serdigital64.backup
  - serdigital64.system
  - serdigital64.

### Prerequisites

- Ansible:
  - Control Node: A:Platform64 installed and configured
  - Managed Nodes: target hosts prepared for A:Platform64 control

### Installation Procedure

The playbook is automatically deployed during the [A:Platform64 installation](/#installation) process

## Contributing

Help on implementing new features and maintaining the code base is welcomed.

Please see the [guidelines](https://aplatform64.readthedocs.io/en/latest/contributing/CONTRIBUTING) for further details.

## Author

- [SerDigital64](https://serdigital64.github.io/)

## License

[GPL-3.0-or-later](https://www.gnu.org/licenses/gpl-3.0.txt)
