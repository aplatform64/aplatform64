# Ansible Collection: serdigital64.storage

## About

Ansible Roles for automating storage management.

This collection is part of the [A:Platform64](https://github.com/serdigital64/aplatform64) project for automated infrastructure-as-code management.

## Content

| role                                                                                | purpose                     |
| ----------------------------------------------------------------------------------- | --------------------------- |
| [stg_autofs](https://aplatform64.readthedocs.io/en/latest/roles/stg_autofs)         | Manage the AutoFS service   |
| [stg_nfs_client](https://aplatform64.readthedocs.io/en/latest/roles/stg_nfs_client) | Manage the Linux NFS client |
| [stg_nfs_server](https://aplatform64.readthedocs.io/en/latest/roles/stg_nfs_server) | Manage the Linux NFS server |

## Deployment

### Dependencies

- Ansible Collections:
  - ansible.posix
  - serdigital64.backup
  - serdigital64.system
  - serdigital64.security

### Installation Procedure

Manually install Ansible Collections from the Ansible Galaxy repository:

```shell
ansible-galaxy collection install --upgrade serdigital64.storage
```

Automatic installation is also available by deploying [A:Platform64](https://aplatform64.readthedocs.io/en/latest/#deployment)

## Contributing

Help on implementing new features and maintaining the code base is welcomed.

Please see the [guidelines](https://aplatform64.readthedocs.io/en/latest/contributing/guidelines) for further details.

## Author

- [SerDigital64](https://serdigital64.github.io/)

## License

[GPL-3.0-or-later](https://www.gnu.org/licenses/gpl-3.0.txt)
