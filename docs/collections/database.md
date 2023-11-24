# Ansible Collection: serdigital64.database

## About

Ansible Roles for automating database tools provisioning..

This collection is part of the [A:Platform64](https://github.com/aplatform64/aplatform64) project for automated infrastructure-as-code management.

## Content

| role                                                                                            | purpose                                  |
| ----------------------------------------------------------------------------------------------- | ---------------------------------------- |
| [db_mariadb_client](https://aplatform64.readthedocs.io/en/latest/roles/db_mariadb_client)       | Manage provisioning of MariaDB client    |
| [db_mariadb_server](https://aplatform64.readthedocs.io/en/latest/roles/db_mariadb_server)       | Manage provisioning of MariaDB server    |
| [db_mysql_client](https://aplatform64.readthedocs.io/en/latest/roles/db_mysql_client)           | Manage provisioning of MySQL client      |
| [db_mysql_server](https://aplatform64.readthedocs.io/en/latest/roles/db_mysql_server)           | Manage provisioning of MySQL server      |
| [db_postgresql_client](https://aplatform64.readthedocs.io/en/latest/roles/db_postgresql_client) | Manage provisioning of PostgreSQL client |
| [db_postgresql_server](https://aplatform64.readthedocs.io/en/latest/roles/db_postgresql_server) | Manage provisioning of PostgreSQL server |

## Deployment

### Dependencies

- Ansible Collections:
  - serdigital64.backup
  - serdigital64.system

### Installation Procedure

Manually install Ansible Collections from the Ansible Galaxy repository:

```shell
ansible-galaxy collection install --upgrade serdigital64.database
```

Automatic installation is also available by deploying [A:Platform64](https://aplatform64.readthedocs.io/en/latest/#deployment)

## Contributing

Help on implementing new features and maintaining the code base is welcomed.

Please see the [guidelines](https://aplatform64.readthedocs.io/en/latest/CONTRIBUTING.md) for further details.

## Author

- [SerDigital64](https://serdigital64.github.io/)

## License

[Apache-2.0](https://www.apache.org/licenses/LICENSE-2.0.txt)
