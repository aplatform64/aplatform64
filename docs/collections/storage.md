# Ansible Collection: serdigital64.storage

## About

Ansible Roles for automating storage management.

This collection is part of the [A:Platform64](https://github.com/aplatform64/aplatform64) project for automated infrastructure-as-code management.

## Content

| role                                                                                | purpose                               |
| ----------------------------------------------------------------------------------- | ------------------------------------- |
| [stg_autofs](https://aplatform64.readthedocs.io/en/latest/roles/stg_autofs)         | Manage the AutoFS service             |
| [stg_nfs_client](https://aplatform64.readthedocs.io/en/latest/roles/stg_nfs_client) | Manage the Linux NFS client           |
| [stg_nfs_server](https://aplatform64.readthedocs.io/en/latest/roles/stg_nfs_server) | Manage the Linux NFS server           |
| [stg_repository](https://aplatform64.readthedocs.io/en/latest/roles/stg_repository) | Manage file repositories provisioning |

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

Please see the [guidelines](https://aplatform64.readthedocs.io/en/latest/contributing/CONTRIBUTING) for further details.

## Author

- [SerDigital64](https://serdigital64.github.io/)

## License

[Apache-2.0](https://www.apache.org/licenses/LICENSE-2.0.txt)
