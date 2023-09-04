# Ansible Collection: serdigital64.development

## About

Ansible Roles for automating development environment provisioning.

This collection is part of the [A:Platform64](https://github.com/aplatform64/aplatform64) project for automated infrastructure-as-code management.

## Content

| role                                                                        | purpose                                         |
| --------------------------------------------------------------------------- | ----------------------------------------------- |
| [dev_gcc](https://aplatform64.readthedocs.io/en/latest/roles/dev_gcc)       | Manage provisioning of GCC                      |
| [dev_java](https://aplatform64.readthedocs.io/en/latest/roles/dev_java)     | Manage provisioning of Java                     |
| [dev_nodejs](https://aplatform64.readthedocs.io/en/latest/roles/dev_nodejs) | Manage provisioning of NodeJS                   |
| [dev_opencl](https://aplatform64.readthedocs.io/en/latest/roles/dev_opencl) | Manage provision OpenCL development environment |
| [dev_python](https://aplatform64.readthedocs.io/en/latest/roles/dev_python) | Manage provision of Python                      |
| [dev_ruby](https://aplatform64.readthedocs.io/en/latest/roles/dev_ruby)     | Manage provisioning of Ruby                     |
| [dev_tools](https://aplatform64.readthedocs.io/en/latest/roles/dev_tools)   | Manage provisioning of common development tools |

## Deployment

### Dependencies

- Ansible Collections:
  - serdigital64.backup
  - serdigital64.system

### Installation Procedure

Manually install Ansible Collections from the Ansible Galaxy repository:

```shell
ansible-galaxy collection install --upgrade serdigital64.development
```

Automatic installation is also available by deploying [A:Platform64](https://aplatform64.readthedocs.io/en/latest/#deployment)

## Contributing

Help on implementing new features and maintaining the code base is welcomed.

Please see the [guidelines](https://aplatform64.readthedocs.io/en/latest/contributing/CONTRIBUTING/) for further details.

## Author

- [SerDigital64](https://serdigital64.github.io/)

## License

[Apache-2.0](https://www.apache.org/licenses/LICENSE-2.0.txt)
