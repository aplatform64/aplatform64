# Ansible Collection: serdigital64.web

## About

Ansible Roles for automating web tools provisioning.

This collection is part of the [A:Platform64](https://github.com/serdigital64/aplatform64) project for automated infrastructure-as-code management.

## Content

| role                                                                          | purpose                                |
| ----------------------------------------------------------------------------- | -------------------------------------- |
| [web_haproxy](https://aplatform64.readthedocs.io/en/latest/roles/web_haproxy) | Manage provisioning of HAProxy         |
| [web_httpd](https://aplatform64.readthedocs.io/en/latest/roles/web_httpd)     | Manage provisioning of Apache HTTPD    |
| [web_mkdocs](https://aplatform64.readthedocs.io/en/latest/roles/web_mkdocs)   | Manage provisioning of the MkDocs tool |
| [web_nginx](https://aplatform64.readthedocs.io/en/latest/roles/web_nginx)     | Manage provisioning of NGINX           |

## Deployment

### Dependencies

- Ansible Collections:
  - serdigital64.backup
  - serdigital64.system

### Installation Procedure

Manually install Ansible Collections from the Ansible Galaxy repository:

```shell
ansible-galaxy collection install --upgrade serdigital64.web
```

Automatic installation is also available by deploying [A:Platform64](https://aplatform64.readthedocs.io/en/latest/#deployment)

## Contributing

Help on implementing new features and maintaining the code base is welcomed.

Please see the [guidelines](https://aplatform64.readthedocs.io/en/latest/contributing/CONTRIBUTING) for further details.

## Author

- [SerDigital64](https://serdigital64.github.io/)

## License

[Apache-2.0](https://www.apache.org/licenses/LICENSE-2.0.txt)
