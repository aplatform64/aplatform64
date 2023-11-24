# Ansible Role: serdigital64.system.sys_repository

## Purpose

Manage application package repositories.

Features available in the current version:

- Install repository management tools
  - flatpak: distro native CLI and service
  - snap: distro native CLI and service
  - git: distro native CLI
  - pip: distro native pip
  - brew: shared CLI using dedicated regular user
- Add remote repositories.
  - yum
  - apt
  - flatpak
  - brew
- Manage availability of installed repositories. Predefined optional repositories are declared in the variable `sys_repository_sources`.
  - distro
  - yum
  - apt
  - brew
- Prepare repository for usage
  - distro: update cache
- Install package manager specific helpers (declared in the variable `sys_repository_packages.tools`)

Supported repositories types as defined in the variable `sys_repository_flavours`:

| Type    | Description                     |
| ------- | ------------------------------- |
| apt     | Repository for DEB packages     |
| brew    | Repository for BREW packages    |
| distro  | OS native repository            |
| flatpak | Repository for FLATPAK packages |
| git     | Git based repository            |
| pip     | Repository for Python modules   |
| snap    | Repository for SNAP packages    |
| yum     | Repository for RPM packages     |

The **sys_repository** Ansible-Role is part of the [A:Platform64](https://github.com/aplatform64/aplatform64) project and is available in the [system](https://aplatform64.readthedocs.io/en/latest/collections/system) Ansible-Collection.

## Usage

The following example is an **Ansible Playbook** that includes all the supported features:

[use this link if viewing the doc on github](https://github.com/aplatform64/system/blob/main/playbooks/sys_repository.yml)

```yaml
{% include "../examples/sys_repository.yml" %}
```

The playbook can be run by executing:

```shell
# Set ANSIBLE_COLLECTIONS_PATHS to the default location. Change as needed.
ANSIBLE_COLLECTIONS_PATHS="${HOME}/.ansible/collections"
ansible-playbook "${ANSIBLE_COLLECTIONS_PATHS}/ansible_collections/serdigital64/system/playbooks/sys_repository.yml"
```

## Role Parameters

### Actions

- Use **action-parameters** to control what tasks are enabled for the role to execute.
- Parameters should be declared as task level vars as they are intented to be dynamic.

```yaml
sys_repository:
  prepare:
  deploy:
  setup:
  provision:
```

| Parameter                | Required? | Type    | Default | Purpose / Value                                                |
| ------------------------ | --------- | ------- | ------- | -------------------------------------------------------------- |
| sys_repository.prepare   | no        | boolean | `false` | Enable preparation of the runtime environment                  |
| sys_repository.deploy    | no        | boolean | `false` | Enable installation of application packages used by the role   |
| sys_repository.setup     | no        | boolean | `false` | Enable repository availability control. YUM based distros only |
| sys_repository.provision | no        | boolean | `false` | Enable installation of new repositories                        |

### End State

- Use **end-state** parameters to define the target state after role execution.
- Parameters should be declared in **host_vars** or **group_vars** as they are intended to be permanent.

```yaml
sys_repository_managers:
  brew:
  flatpak:
  git:
  pip:
  snap:
sys_repository_catalog_distro:
  NAME:
sys_repository_catalog_flatpak:
  NAME:
sys_repository_catalog_apt:
  NAME:
sys_repository_catalog_yum:
  NAME:
sys_repository_catalog_brew:
  NAME:
sys_repository_custom_distro:
  - name:
    package:
sys_repository_custom_flatpak:
  - name:
    url:
sys_repository_custom_brew:
  - name:
    source:
sys_repository_custom_yum:
  - name:
    description:
    url:
    gpgkey:
    sslcacert:
sys_repository_custom_apt:
  - name:
    suite:
    component:
    url:
    gpgkey:
    pgpkey:
```

| Parameter                               | Required? | Type       | Default | Purpose / Value                                                   |
| --------------------------------------- | --------- | ---------- | ------- | ----------------------------------------------------------------- |
| sys_repository_managers.brew            | no        | boolean    | `false` | Enable/Disable Homebrew repository                                |
| sys_repository_managers.flatpak         | no        | boolean    | `false` | Enable/Disable FlatHub repository                                 |
| sys_repository_managers.snap            | no        | boolean    | `false` | Enable/Disable Snap repository                                    |
| sys_repository_managers.git             | no        | boolean    | `false` | Enable/Disable GIT repositories                                   |
| sys_repository_managers.pip             | no        | boolean    | `false` | Enable/Disable Python modules repository                          |
| sys_repository_catalog_distro           | no        | dictionary |         | Define installed distro native repositories state.                |
| sys_repository_catalog_distro.NAME      | no        | boolean    |         | Is the repository enabled?. Replace NAME with the repository name |
| sys_repository_catalog_flatpak          | no        | dictionary |         | Define installed flatpak repositories state.                      |
| sys_repository_catalog_flatpak.NAME     | no        | boolean    |         | Is the repository enabled?. Replace NAME with the repository name |
| sys_repository_catalog_apt              | no        | dictionary |         | Define installed apt repositories state.                          |
| sys_repository_catalog_apt.NAME         | no        | boolean    |         | Is the repository enabled?. Replace NAME with the repository name |
| sys_repository_catalog_yum              | no        | dictionary |         | Define installed yum repositories state.                          |
| sys_repository_catalog_yum.NAME         | no        | boolean    |         | Is the repository enabled?. Replace NAME with the repository name |
| sys_repository_catalog_brew             | no        | dictionary |         | Define installed yum repositories state.                          |
| sys_repository_catalog_brew.NAME        | no        | boolean    |         | Is the repository enabled?. Replace NAME with the repository name |
| sys_repository_custom_distro            | no        | list       |         | Define optional distro native repositories                        |
| sys_repository_custom_distro.0.name     | yes       | string     |         | Define repository name                                            |
| sys_repository_custom_distro.0.package  | yes       | string     |         | Define package name                                               |
| sys_repository_custom_flatpak           | yes       | list       |         | Define optional flatpak repositories                              |
| sys_repository_custom_flatpak.0.name    | yes       | string     |         | Define repository name                                            |
| sys_repository_custom_flatpak.0.url     | yes       | string     |         | Define repository location                                        |
| sys_repository_custom_brew              | no        | list       |         | Define optional flatpak repositories                              |
| sys_repository_custom_brew.0.name       | yes       | string     |         | Define repository name                                            |
| sys_repository_custom_brew.0.source     | yes       | string     |         | Define repository source                                          |
| sys_repository_custom_yum               | no        | list       |         | Define optional yum repositories                                  |
| sys_repository_custom_yum.0.name        | yes       | string     |         | Set repository short name                                         |
| sys_repository_custom_yum.0.description | yes       | string     |         | Describe content                                                  |
| sys_repository_custom_yum.0.url         | yes       | string     |         | Define repository source                                          |
| sys_repository_custom_yum.0.gpgkey      | no        | string     |         | Define gpgkey source                                              |
| sys_repository_custom_yum.0.sslcacert   | no        | string     |         | Define sslcert source                                             |
| sys_repository_custom_apt               | no        | list       |         | Define optional apt repositories                                  |
| sys_repository_custom_apt.0.name        | yes       | string     |         | Set repository short name                                         |
| sys_repository_custom_apt.0.suite       | yes       | string     |         | Set suite attribute                                               |
| sys_repository_custom_apt.0.component   | no        | string     |         | Set component attribute                                           |
| sys_repository_custom_apt.0.url         | yes       | string     |         | Define repository source                                          |
| sys_repository_custom_apt.0.gpgkey      | no        | string     |         | Define gpgkey source                                              |
| sys_repository_custom_apt.0.pgpkey      | no        | string     |         | Define pgpkey source                                              |

## Deployment

### OS Compatibility

The operating system compatibility list is defined in the variable: `sys_repository_platforms`

### Dependencies

- Ansible Collections:
  - serdigital64.system
    - sys_user
    - sys_sudo
  - serdigital64.devops
    - dops_git_client
  - serdigital64-development
    - dev_python

### Prerequisites

The Ansible engine must be already installed and configured for privileged access and remote execution.

### Installation Procedure

Manually install Ansible Collections from the Ansible Galaxy repository:

```shell
ansible-galaxy collection install --upgrade serdigital64.system
```

Automatic installation is also available by deploying [A:Platform64](https://aplatform64.readthedocs.io/en/latest/#deployment)

## Contributing

Help on implementing new features and maintaining the code base is welcomed.

Please see the [guidelines](https://aplatform64.readthedocs.io/en/latest/CONTRIBUTING.md) for further details.

## Author

- [SerDigital64](https://serdigital64.github.io/)

## License

[Apache-2.0](https://www.apache.org/licenses/LICENSE-2.0.txt)
