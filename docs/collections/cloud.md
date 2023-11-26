# Ansible Collection: serdigital64.cloud

## About

Ansible Roles for automating cloud tools provisioning.

This collection is part of the [A:Platform64](https://github.com/aplatform64/aplatform64) project for automated infrastructure-as-code management.

## Content

| role                                                                                      | purpose                                                                    |
| ----------------------------------------------------------------------------------------- | -------------------------------------------------------------------------- |
| [cloud_aws_cli](https://aplatform64.readthedocs.io/en/latest/roles/cloud_aws_cli)         | Manage provisioning of AWS CLI                                             |
| [cloud_azure_cli](https://aplatform64.readthedocs.io/en/latest/roles/cloud_azure_cli)     | Manage provisioning of Azure CLI                                           |
| [cloud_foundry_cli](https://aplatform64.readthedocs.io/en/latest/roles/cloud_foundry_cli) | Manage provisioning of Cloud Foundry CLI                                   |
| [cloud_google_cli](https://aplatform64.readthedocs.io/en/latest/roles/cloud_google_cli)   | Manage provisioning of Google Cloud CLI                                    |
| [cloud_ibm_cli](https://aplatform64.readthedocs.io/en/latest/roles/cloud_ibm_cli)         | Manage provisioning of IBM CLI                                             |

## Deployment

### Dependencies

- Ansible Collections:
  - community.aws
  - serdigital64.backup
  - serdigital64.system

### Installation Procedure

Manually install Ansible Collections from the Ansible Galaxy repository:

```shell
ansible-galaxy collection install --upgrade serdigital64.cloud
```

Automatic installation is also available by deploying [A:Platform64](https://aplatform64.readthedocs.io/en/latest/#deployment)

## Contributing

Help on implementing new features and maintaining the code base is welcomed.

Please see the [guidelines](https://aplatform64.readthedocs.io/en/latest/CONTRIBUTING) for further details.

## Author

- [SerDigital64](https://serdigital64.github.io/)

## License

[Apache-2.0](https://www.apache.org/licenses/LICENSE-2.0.txt)
