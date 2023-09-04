# Ansible Collection: serdigital64.backup

## About

Ansible Roles for automating backup infrastructure management.

This collection is part of the [A:Platform64](https://github.com/aplatform64/aplatform64) project for automated infrastructure-as-code management.

## Content

| role                                                                                      | purpose                                            |
| ----------------------------------------------------------------------------------------- | -------------------------------------------------- |
| [bkp_archive](https://aplatform64.readthedocs.io/en/latest/roles/bkp_archive)             | Extract file archives                              |
| [bkp_rclone_server](https://aplatform64.readthedocs.io/en/latest/roles/bkp_rclone_server) | Manage provisioning of the RClone tool as a server |
| [bkp_restic](https://aplatform64.readthedocs.io/en/latest/roles/bkp_restic)               | Manage provisioning of the Restic tool             |

## Deployment

### Dependencies

- Ansible Collections:
  - serdigital64.system

### Installation Procedure

Manually install Ansible Collections from the Ansible Galaxy repository:

```shell
ansible-galaxy collection install --upgrade serdigital64.backup
```

Automatic installation is also available by deploying [A:Platform64](https://aplatform64.readthedocs.io/en/latest/#deployment)

## Contributing

Help on implementing new features and maintaining the code base is welcomed.

Please see the [guidelines](https://aplatform64.readthedocs.io/en/latest/contributing/CONTRIBUTING/) for further details.

## Author

- [SerDigital64](https://serdigital64.github.io/)

## License

[Apache-2.0](https://www.apache.org/licenses/LICENSE-2.0.txt)
