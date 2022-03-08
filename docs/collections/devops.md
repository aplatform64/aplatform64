# Ansible Collection: serdigital64.devops

## About

Ansible Roles for automating devops tools provisioning.

This collection is part of the [A:Platform64](https://github.com/serdigital64/aplatform64) project for automated infrastructure-as-code management.

## Content

| role                                                                                    | purpose                                |
| --------------------------------------------------------------------------------------- | -------------------------------------- |
| [dops_ansiblelint](https://aplatform64.readthedocs.io/en/latest/roles/dops_ansiblelint) | Manage provisioning of Ansible Linter  |
| [dops_batscore](https://aplatform64.readthedocs.io/en/latest/roles/dops_batscore)       | Manage provisioning of Bats Core       |
| [dops_git_client](https://aplatform64.readthedocs.io/en/latest/roles/dops_git_client)   | Manage provisioning of client side GIT |
| [dops_git_server](https://aplatform64.readthedocs.io/en/latest/roles/dops_git_server)   | Manage GIT server                      |
| [dops_github_cli](https://aplatform64.readthedocs.io/en/latest/roles/dops_github_cli)   | Manage provisioning of GitHub CLI      |
| [dops_jenkins](https://aplatform64.readthedocs.io/en/latest/roles/dops_jenkins)         | Manage Jenkins server                  |
| [dops_molecule](https://aplatform64.readthedocs.io/en/latest/roles/dops_molecule)       | Manage provisioning of Molecule        |
| [dops_shellcheck](https://aplatform64.readthedocs.io/en/latest/roles/dops_shellcheck)   | Manage provisioning of ShellCheck      |
| [dops_yamllint](https://aplatform64.readthedocs.io/en/latest/roles/dops_yamllint)       | Manage provisioning of YAML Linter     |

## Deployment

### Dependencies

- Ansible Collections:
  - serdigital64.backup
  - serdigital64.system
  - serdigital64.development

### Installation Procedure

Manually install Ansible Collections from the Ansible Galaxy repository:

```shell
ansible-galaxy collection install --upgrade serdigital64.devops
```

Automatic installation is also available by deploying [A:Platform64](https://aplatform64.readthedocs.io/en/latest/#deployment)

## Contributing

Help on implementing new features and maintaining the code base is welcomed.

Please see the [guidelines](https://aplatform64.readthedocs.io/en/latest/contributing/CONTRIBUTING) for further details.

## Author

- [SerDigital64](https://serdigital64.github.io/)

## License

[GPL-3.0-or-later](https://www.gnu.org/licenses/gpl-3.0.txt)
