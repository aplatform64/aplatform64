# Releases

- [Releases](#releases)
  - [Release: 2.1.0](#release-210)
  - [Release: 2.0.0](#release-200)

## Release: 2.1.0

- automation-1.0.1
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
