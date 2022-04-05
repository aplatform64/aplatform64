# Ansible Collection: serdigital64.system

## About

Ansible Roles for automating operating system management.

This collection is part of the [A:Platform64](https://github.com/serdigital64/aplatform64) project for automated infrastructure-as-code management.

## Content

| role                                                                                    | purpose                                                 |
| --------------------------------------------------------------------------------------- | ------------------------------------------------------- |
| [sys_dconf](https://aplatform64.readthedocs.io/en/latest/roles/sys_dconf)               | Manage provisioning of the DConf service                |
| [sys_fonts](https://aplatform64.readthedocs.io/en/latest/roles/sys_fonts)               | Manage OS fonts provisioning                            |
| [sys_gui_cinnamon](https://aplatform64.readthedocs.io/en/latest/roles/sys_gui_cinnamon) | Manage provisioning of the Cinnamon desktop environment |
| [sys_kernel](https://aplatform64.readthedocs.io/en/latest/roles/sys_kernel)             | Manage OS Kernel configuration                          |
| [sys_mc](https://aplatform64.readthedocs.io/en/latest/roles/sys_mc)                     | Manage provisioning of the Midnight Commander tool      |
| [sys_package](https://aplatform64.readthedocs.io/en/latest/roles/sys_package)           | Manage application packages                             |
| [sys_repository](https://aplatform64.readthedocs.io/en/latest/roles/sys_repository)     | Manage application package repositories                 |
| [sys_shell](https://aplatform64.readthedocs.io/en/latest/roles/sys_shell)               | Manage Unix shells provisioning                         |
| [sys_subsystem](https://aplatform64.readthedocs.io/en/latest/roles/sys_subsystem)       | Manage Linux subsystem configuration                    |
| [sys_sudo](https://aplatform64.readthedocs.io/en/latest/roles/sys_sudo)                 | Manage SuDo provisioning                                |
| [sys_tools](https://aplatform64.readthedocs.io/en/latest/roles/sys_tools)               | Manage basic OS tools provisioning                      |
| [sys_user](https://aplatform64.readthedocs.io/en/latest/roles/sys_user)                 | Manage Unix users and groups provisioning               |

## Deployment

### Dependencies

- Ansible Collections:
  - ansible.posix
  - community.general
  - serdigital64.automation
  - serdigital64.backup
  - serdigital64.development
  - serdigital64.devops

### Installation Procedure

Manually install Ansible Collections from the Ansible Galaxy repository:

```shell
ansible-galaxy collection install --upgrade serdigital64.system
```

Automatic installation is also available by deploying [A:Platform64](https://aplatform64.readthedocs.io/en/latest/#deployment)

## Contributing

Help on implementing new features and maintaining the code base is welcomed.

Please see the [guidelines](https://aplatform64.readthedocs.io/en/latest/contributing/CONTRIBUTING/) for further details.

## Author

- [SerDigital64](https://serdigital64.github.io/)

## License

[GPL-3.0-or-later](https://www.gnu.org/licenses/gpl-3.0.txt)
