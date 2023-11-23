# Ansible Role: serdigital64.system.sys_package

## Purpose

Manage application package provisioning.

Supported features in the current version:

- Download package file to local repository.
- Extract package file contents to staging area.
- Promote content from staging to install destination.
- Execute script/command in staging area.
- Cleanup files after package uninstallation.

Supported package types (defined in the variable `sys_package_flavours`):

| Type    | Description               |
| ------- | ------------------------- |
| binary  | Compressed archive        |
| brew    | Homebrew package          |
| deb     | Debian OS family package  |
| distro  | OS specific package       |
| flatpak | Flatpak package           |
| git     | GIT repository            |
| pip     | Python module             |
| rpm     | Redhat OS familty package |
| snap    | Snap package              |

Package specific actions:

- PIP
  - Create dedicated venv location
  - Create user and group owners
  - Create loader script that will activate the venv and call the app CLI

In order to allow homogeneous package profile definitions use the variable `sys_package_profiles.T.V.supported` to flag packages that are not available in the target platform. This will skip the package deploy without generating execution errors.

The **sys_package** Ansible-Role is part of the [A:Platform64](https://github.com/aplatform64/aplatform64) project and is available in the [system](https://aplatform64.readthedocs.io/en/latest/collections/system) Ansible-Collection.

## Usage

The following example is an **Ansible Playbook** that includes all the supported features:

[use this link if viewing the doc on github](https://github.com/aplatform64/system/blob/main/playbooks/sys_package.yml)

```yaml
{% include "../examples/sys_package.yml" %}
```

The playbook can be run by executing:

```shell
# Set ANSIBLE_COLLECTIONS_PATHS to the default location. Change as needed.
ANSIBLE_COLLECTIONS_PATHS="${HOME}/.ansible/collections"
ansible-playbook "${ANSIBLE_COLLECTIONS_PATHS}/ansible_collections/serdigital64/system/playbooks/sys_package.yml"
```

## Role Parameters

### Actions

- Use **action-parameters** to control what tasks are enabled for the role to execute.
- Parameters should be declared as task level vars as they are intented to be dynamic.

```yaml
sys_package:
  resolve_prereq:
  prepare:
  provision:
sys_package_application:
  name:
  type:
  version:
  installed:
sys_package_profiles:
  T:
    V:
      supported:
      origin:
      packages:
        - name:
          file:
          uncompress:
          snap:
            classic:
          git:
            branch:
          referer:
      options:
        brew:
          cask:
        pip:
          owner:
          group:
          path:
          cli:
          system:
          python:
      paths:
        - target:
          owner:
          group:
          mode:
      promotion:
        - source:
          target:
          owner:
          group:
          mode:
      script:
      cleanup:
```

| Parameter                                        | Required? | Type       | Default  | Purpose / Value                                                                                         |
| ------------------------------------------------ | --------- | ---------- | -------- | ------------------------------------------------------------------------------------------------------- |
| sys_package.resolve_prereq                       | no        | boolean    | `false`  | Enable automatic resolution of prequisites                                                              |
| sys_package.prepare                              | no        | boolean    | `false`  | Enable preparation of the runtime environment                                                           |
| sys_package.provision                            | no        | boolean    | `false`  | Enable installation/uninstallation of packages                                                          |
| sys_package_application                          | yes       | dictionary |          | Required when `provision == true`. Define target application from profile list                          |
| sys_package_application.name                     | yes       | string     |          | Select application package name                                                                         |
| sys_package_application.type                     | yes       | string     |          | Select application package type                                                                         |
| sys_package_application.version                  | yes       | string     |          | Select application package version                                                                      |
| sys_package_application.installed                | yes       | boolean    |          | Set application end state                                                                               |
| sys_package_profiles                             | yes       | dictionary |          | Required when `provision == true`. Define application details                                           |
| sys_package_profiles.T                           | yes       | dictionary |          | Define application details for the package type _T_. Replace _T_ with a valid type                      |
| sys_package_profiles.T.V                         | yes       | dictionary |          | Define application details for the version _V_. Replace _V_ with `latest` or version `vX_Y_Z`           |
| sys_package_profiles.T.V.supported               | no        | boolean    | `true`   | Is the application available for the target platform?                                                   |
| sys_package_profiles.T.V.origin                  | yes       | string     |          | (binary,deb,flatpak,git,rpm,brew) Repository URL or name from where the file package will be downloaded |
| sys_package_profiles.T.V.packages                | yes       | list       |          | List of application packages to be installed                                                            |
| sys_package_profiles.T.V.packages.0.name         | yes       | string     |          | (brew,flatpak,snap,rpm,deb,distro,pip) Package name as found in the package repository or package file  |
| sys_package_profiles.T.V.packages.0.file         | yes       | string     |          | (binary,deb,git,rpm) Package file name as found in the origin                                           |
| sys_package_profiles.T.V.packages.0.referer      | no        | string     |          | Set the HTTP Header Referer field. Value: URL. Used for sites that will not allow direct URL download   |
| sys_package_profiles.T.V.packages.0.uncompress   | no        | boolean    |          | (binary) Uncompress the package file before installing                                                  |
| sys_package_profiles.T.V.packages.0.snap         | no        | dictionary |          | (snap) Snap options                                                                                     |
| sys_package_profiles.T.V.packages.0.snap.classic | no        | boolean    |          | (snap) Set the _classic_ flag when installing the snap package                                          |
| sys_package_profiles.T.V.packages.0.git          | no        | dictionary |          | (git) GIT options                                                                                       |
| sys_package_profiles.T.V.packages.0.git.branch   | no        | string     |          | (git) Set the target branch.                                                                            |
| sys_package_profiles.T.V.options                 | yes       | dictionary |          | (pip) Global package options                                                                            |
| sys_package_profiles.T.V.options.brew            | no        | dictionary |          | (brew) Homebrew options                                                                                 |
| sys_package_profiles.T.V.options.brew.cask       | no        | boolean    |          | (brew) The package is a cask                                                                            |
| sys_package_profiles.T.V.options.pip             | yes       | dictionary |          | (pip) PIP options                                                                                       |
| sys_package_profiles.T.V.options.pip.owner       | no        | string     | `"root"` | (pip) Destination path owner                                                                            |
| sys_package_profiles.T.V.options.pip.group       | no        | string     | `"root"` | (pip) Destination path group owner                                                                      |
| sys_package_profiles.T.V.options.pip.path        | yes       | string     |          | (pip) Destination path where the Python modules and venv will be installed to                           |
| sys_package_profiles.T.V.options.pip.cli         | yes       | string     |          | (pip) CLI (python app) name to call the module directly from the shell                                  |
| sys_package_profiles.T.V.options.pip.system      | no        | boolean    | `false`  | (pip) Enable --system-site-packages venv creation option                                                |
| sys_package_profiles.T.V.options.pip.python      | no        | string     |          | (pip) Full path to the Python interpreter. Default is OS dependant                                      |
| sys_package_profiles.T.V.paths                   | no        | list       |          | (binary,git) List of paths to be created before promotion                                               |
| sys_package_profiles.T.V.paths.0.target          | yes       | string     |          | Full path where files will be promoted (copied) to                                                      |
| sys_package_profiles.T.V.paths.0.mode            | no        | string     |          | Target's permissions (octal)                                                                            |
| sys_package_profiles.T.V.paths.0.owner           | no        | string     |          | Target's owner: user name                                                                               |
| sys_package_profiles.T.V.paths.0.group           | no        | string     |          | Target's Owner: group                                                                                   |
| sys_package_profiles.T.V.promotion               | no        | dictionary |          | (binary,git) List of files that will be promoted (copied) after the package file is opened              |
| sys_package_profiles.T.V.promotion.0.source      | yes       | string     |          | Relative path to the source file that will be promoted                                                  |
| sys_package_profiles.T.V.promotion.0.target      | yes       | string     |          | Full path to the destination where the file will be promoted (copied) to                                |
| sys_package_profiles.T.V.promotion.0.mode        | no        | string     |          | Target's permissions (octal)                                                                            |
| sys_package_profiles.T.V.promotion.0.owner       | no        | string     |          | Target's owner: user name                                                                               |
| sys_package_profiles.T.V.promotion.0.group       | no        | string     |          | Target's Owner: group                                                                                   |
| sys_package_profiles.T.V.script                  | no        | list       |          | (binary) Script or command to run after the application package is opened in staging                    |
| sys_package_profiles.T.V.script.0                | yes       | string     |          | Path to the script or command. Relative to the installation base                                        |
| sys_package_profiles.T.V.script.N                | no        | string     |          | Parameter definition. Add as many lines as parameters. Same format as `ansible.builtin.command.argv`    |
| sys_package_profiles.T.V.cleanup                 | no        | list       |          | List of full path files that must be removed after the application is uninstalled.                      |

### End State

- Use **end-state** parameters to define the target state after role execution.
- Parameters should be declared in **host_vars** or **group_vars** as they are intended to be permanent.

```yaml
sys_package_paths:
  root_var:
```

| Parameter                  | Required?    | Type       | Default                  | Purpose / Value                |
| -------------------------- | ------------ | ---------- | ------------------------ | ------------------------------ |
| sys_package_paths          | yes(prepare) | dictionary |                          | Set paths                      |
| sys_package_paths.root_var | yes          | string     | `"/var/opt/sys_package"` | Path for storing variable data |

## Deployment

### OS Compatibility

The operating system compatibility list is defined in the variable: `sys_package_platforms`

### Dependencies

- Ansible Collections:
  - community.general
    - snap
    - flatpak
    - homebrew
  - serdigital64.backup
    - bkp_archive
  - serdigital64.system
    - sys_repository
    - sys_user

### Prerequisites

The Ansible engine must be already installed and configured for privileged access and remote execution.

In addition the following prerequisites can be automatically solved when running the playbook by setting the role action: `resolve_prereq: true`

- Package manager for the target application is installed and enabled.

### Installation Procedure

Manually install Ansible Collections from the Ansible Galaxy repository:

```shell
ansible-galaxy collection install --upgrade serdigital64.system
```

Automatic installation is also available by deploying [A:Platform64](https://aplatform64.readthedocs.io/en/latest/#deployment)

## Contributing

Help on implementing new features and maintaining the code base is welcomed.

Please see the [guidelines](https://aplatform64.readthedocs.io/en/latest/CONTRIBUTING) for further details.

## Author

- [SerDigital64](https://serdigital64.github.io/)

## License

[Apache-2.0](https://www.apache.org/licenses/LICENSE-2.0.txt)
