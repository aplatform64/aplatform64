# Ansible Collection: serdigital64.network

## About

Ansible Roles for automating network tools provisioning..

This collection is part of the [A:Platform64](https://github.com/serdigital64/aplatform64) project for automated infrastructure-as-code management.

## Content

| role                                                                      | purpose                          |
| ------------------------------------------------------------------------- | -------------------------------- |
| [net_bind](https://aplatform64.readthedocs.io/en/latest/roles/net_bind)   | Manage provisioning of Bind      |
| [net_istio](https://aplatform64.readthedocs.io/en/latest/roles/net_istio) | Manage provisioning of Istio CLI |

## Deployment

### Dependencies

- Ansible Collections:
  - serdigital64.backup
  - serdigital64.system

### Installation Procedure

Manually install Ansible Collections from the Ansible Galaxy repository:

```shell
ansible-galaxy collection install --upgrade serdigital64.network
```

Automatic installation is also available by deploying [A:Platform64](https://aplatform64.readthedocs.io/en/latest/#deployment)

## Contributing

Help on implementing new features and maintaining the code base is welcomed.

Please see the [guidelines](https://aplatform64.readthedocs.io/en/latest/contributing/CONTRIBUTING) for further details.

## Author

- [SerDigital64](https://serdigital64.github.io/)

## License

[Apache-2.0](https://www.apache.org/licenses/LICENSE-2.0.txt)
