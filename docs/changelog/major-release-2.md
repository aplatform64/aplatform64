# Releases

- [Releases](#releases)
  - [Release: 2.4.0](#release-240)
  - [Release: 2.3.0](#release-230)
  - [Release: 2.2.0](#release-220)
  - [Release: 2.1.0](#release-210)
  - [Release: 2.0.0](#release-200)

## Release: 2.4.0

- project
  - add testing script devap64-test
  - create shared molecule configuration

## Release: 2.3.0

- storage-1.2.0
  - stg_repository: add new role
- automation-1.2.0
  - playbooks: rename manage_git_server_nodes to manage_git_servers, add manage_file_servers

## Release: 2.2.0

- application-1.0.1
  - app_vscode: update extension list
- devops-1.1.2
  - dops_git_client: fix var name
- storage-1.1.0
  - stg_nfs_client: add new role
  - stg_nfs_server: add new role
- system-1.0.3
  - sys_sudo: fix doc typo
- docs
  - roles: added local markdown link for github views

## Release: 2.1.0

- devops-1.1.0
  - dops_git_client: add user default config
- system-1.0.1
  - sys_sudo: optimize code
- automation-1.1.0
  - installer: add pip upgrade
  - playbooks: update inventory defaults
  - cli: add remove site

## Release: 2.0.0

- Refactor
  - Migrate collection core:
    - core_shell: system.sys_shell
    - core_subsystem: system.sys_subsystem
    - core_user: system.sys_user
    - core_key: security.sec_key_ssh
    - core_archive: backup.bkp_archive
    - core_repository: system.sys_repository
    - core_package: sys.sys_package
    - core_firewall: sec_firewall_os
