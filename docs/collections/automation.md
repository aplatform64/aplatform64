# Ansible Collection: serdigital64.automation

## About

Ansible Roles for managing automation tools provisioning.

This collection is part of the [A:Platform64](https://github.com/aplatform64/aplatform64) project for automated infrastructure-as-code management.

## Content

| role                                                                                            | purpose                                           |
| ----------------------------------------------------------------------------------------------- | ------------------------------------------------- |
| [auto_aplatform64](https://aplatform64.readthedocs.io/en/latest/roles/auto_aplatform64)         | Automate the management of computing environments |
| [auto_ansible_control](https://aplatform64.readthedocs.io/en/latest/roles/auto_ansible_control) | Automate the management of Ansible Control Node   |
| [auto_ansible_node](https://aplatform64.readthedocs.io/en/latest/roles/auto_ansible_node)       | Automate the management of Ansible Managed Nodes  |

## Deployment

### Dependencies

- Ansible Collections:
  - community.general.ini_file
  - serdigital64.backup
  - serdigital64.system
  - serdigital64.security

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

[Apache-2.0](https://www.apache.org/licenses/LICENSE-2.0.txt)
