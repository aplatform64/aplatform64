---
title: "Script: install.sh"
description: "Install the A:Platform64 environment"
authors:
  - SerDigital64
tags:
  - ansible
  - devops
  - linux
  - automation
---

# Script: install.sh

## Overview

Install the [A:Platform64](https://aplatform64.readthedocs.io) environment.

## Use Cases

### Install A:Platform64 and its prerequisites

- Install required packages:
  - Python
  - Virtual environment wrapper
  - Ansible
- Create required user account:
  - Ansible control node user
  - Setup SUDO rule
- Install A:Platform64
  - Use default parameters

```shell
./install.sh -6 -p -w -u -s -a
```

### Install A:Platform64

- Assume all prereqs are met
- Install A:Platform64
  - Use Python v3.9
  - Use default parameters

```shell
# Install using default parameters. Assume all prereqs are met. Use os native python 3.9
./install.sh -y '/usr/bin/python3.9' -6
```

## Command Line Interface

> `./install.sh [-x] [-6] [-p] [-w] [-u] [-s] [-a] [-k] [-t SITE]  [-y PYTHON] [-m USER] [-v VENV] [-r PATH] [-o PATH] [-h]`

### Commands

| Command | Purpose                                                                                                          |
| ------- | ---------------------------------------------------------------------------------------------------------------- |
| `-x`    | Run all installation steps: Python (-p), VEW (-w), Ansible (-a), account (-u), sudo rule (-s), A:Platform64 (-6) |
| `-6`    | Single step: install A:Platform64                                                                                |
| `-p`    | Single step: Install python v3.9 using OS native package                                                         |
| `-w`    | Single step: Install Virtual Environment Wrapper (VEW) python module                                             |
| `-u`    | Single step: Create Ansible control node account                                                                 |
| `-s`    | Single step: Give root privilege to the control node account by adding user rule to sudoers file                 |
| `-a`    | Single step: Install Ansible                                                                                     |
| `-h`    | Show usage info                                                                                                  |

### Flags

| Option | Purpose                                                                                                          |
| ------ | ---------------------------------------------------------------------------------------------------------------- |
| `-k`   | Let ansible-playbook ask for sudo password. Use when the target user doesn-t have the NOPASSWD: flag in sudoers. |

### Parameters

| Parameter   | Format       | Default                | Value                                                              |
| ----------- | ------------ | ---------------------- | ------------------------------------------------------------------ |
| `-t SITE`   | `[a-z][0-9]` | `site`                 | Site name                                                          |
| `-y PYTHON` | `full-path`  |                        | Python3.9 interpreter path                                         |
| `-m USER`   | `[a-z][0-9]` | `sitectl`              | Control node account login name                                    |
| `-v VENV`   | `[a-z][0-9]` | `aplatform64`          | Python virtual environment name where Ansible will be installed to |
| `-r PATH`   | `full-path`  | `/opt/aplatform64`     | Install path for collections and configurations                    |
| `-o PATH`   | `full-path`  | `/var/opt/aplatform64` | Install path for temporary and run-time data                       |

### Exit Status

| Code | Status                |
| ---- | --------------------- |
| 0    | Successfull execution |
| 1    | Execution failure     |

## Deployment

### OS Compatibility

- CentOS8
- OracleLinux8
- Ubuntu20
- Ubuntu21
- Fedora33
- Fedora35
- Debian10
- Debian11

### Prerequisites

- Python 3
- OpenSSH
- Sudo
- Regular user account with sudo privilege for running the installer

### Installation Procedure

Download the installation script and resources:

```shell
APLATFORM64_INSTALLER='https://raw.githubusercontent.com/serdigital64/aplatform64/main/collections/serdigital64/automation/roles/auto_aplatform64/files/installer'
APLATFORM64_SHELL64='https://raw.githubusercontent.com/serdigital64/aplatform64/main/collections/serdigital64/automation/roles/auto_aplatform64/files/scripts'
curl \
  -O "$APLATFORM64_SHELL64/bashlib64.bash" \
  -O "$APLATFORM64_INSTALLER/install.sh" \
  -O "$APLATFORM64_INSTALLER/install_helper.sh" \
  -O "$APLATFORM64_INSTALLER/install_helper.yml"
chmod 755 install.sh install_helper.sh
```

## Contributing

Help on implementing new features and maintaining the code base is welcomed.

Please see the [guidelines](https://aplatform64.readthedocs.io/en/latest/contributing/CONTRIBUTING) for further details.

## Author

- [SerDigital64](https://serdigital64.github.io/)

## License

[GPL-3.0-or-later](https://www.gnu.org/licenses/gpl-3.0.txt)
