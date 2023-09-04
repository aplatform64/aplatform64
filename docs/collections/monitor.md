# Ansible Collection: serdigital64.monitor

## About

Ansible Roles for automating monitoring tools provisioning..

This collection is part of the [A:Platform64](https://github.com/aplatform64/aplatform64) project for automated infrastructure-as-code management.

## Content

| role                                                                          | purpose                        |
| ----------------------------------------------------------------------------- | ------------------------------ |
| [mon_fluentd](https://aplatform64.readthedocs.io/en/latest/roles/mon_fluentd) | Manage provisioning of Fluentd |

## Deployment

### Dependencies

- Ansible Collections:
  - serdigital64.backup
  - serdigital64.system

### Installation Procedure

Manually install Ansible Collections from the Ansible Galaxy repository:

```shell
ansible-galaxy collection install --upgrade serdigital64.monitor
```

Automatic installation is also available by deploying [A:Platform64](https://aplatform64.readthedocs.io/en/latest/#deployment)

## Contributing

Help on implementing new features and maintaining the code base is welcomed.

Please see the [guidelines](https://aplatform64.readthedocs.io/en/latest/contributing/CONTRIBUTING) for further details.

## Author

- [SerDigital64](https://serdigital64.github.io/)

## License

[Apache-2.0](https://www.apache.org/licenses/LICENSE-2.0.txt)
