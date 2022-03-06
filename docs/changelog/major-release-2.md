# Releases

- [Releases](#releases)
  - [Release: 2.11.0](#release-2110)
  - [Release: 2.10.0](#release-2100)
  - [Release: 2.9.0](#release-290)
  - [Release: 2.8.0](#release-280)
  - [Release: 2.7.0](#release-270)
  - [Release: 2.6.0](#release-260)
  - [Release: 2.5.0](#release-250)
  - [Release: 2.4.0](#release-240)
  - [Release: 2.3.0](#release-230)
  - [Release: 2.2.0](#release-220)
  - [Release: 2.1.0](#release-210)
  - [Release: 2.0.0](#release-200)

## Release: 2.11.0

- database-1.0.0
  - add collection
  - db_mysql_server: add role
  - db_mariadb_server: add role
  - db_postgresql_server: add role
  - db_mysql_client: add role
  - db_mariadb_client: add role
  - db_postgresql_client: add role
- network-1.0.0
  - add collection
  - net_bind: add role
- monitor-1.0.0
  - add collection
  - mon_fluentd: add role
- automation-1.7.0
  - install: add new collections: database, monitor, network
  - auto_aplatform64: upgrade bashlib64 lib
  - manage_linux_servers: add podman, docker
  - manage_linux_workstations: add podman, docker
- devops-1.3.0
  - dops_shellcheck: add role
  - dops_molecule: add role
  - dops_yamllint: add role
  - dops_ansiblelint: add role
- system-1.3.6
  - sys_repo: fix syntax on templates
- container-1.1.0
  - cnt_docker: add role
- web-1.1.0
  - web_nginx: add role
  - web_haproxy: add role
  - web_httpd: add role

## Release: 2.10.0

- devops-1.2.0
  - dops_github_cli: add new role
- application-1.3.0
  - app_blender: add new role
  - app_firefox: add new role
  - app_freecad: add new role
  - app_pinta: add new role
  - app_pitivi: add new role
  - app_slack: add new role
- automation-1.6.0
  - ap64: add --limit option for playbook run
  - manage_office_nodes: add blender, firefox, freecad, pinta, pitivi, slack
  - manage_dev_nodes: add github cli
  - manage_linux_servers: add openssh client and server
  - manage_linux_workstations: add openssh client and server
- system-1.3.3
  - sys_package: enable system-site-packages for pip packages, add pip,wheel,setup upgrade

## Release: 2.9.0

- application-1.2.1
  - app_keepassx: rename role to app_keepassxc
- automation-1.4.1
  - manage_office_nodes: rename role to app_keepassxc

## Release: 2.8.0

- application-1.2.0
  - add role: app_darktable
- automation-1.4.0
  - manage_office_nodes: add darktable

## Release: 2.7.0

- automation-1.3.0
  - add manage_linux_servers playbook
  - manage_linux_workstations: add dconf service
  - auto_ansible_ontrol: add debug configuration set
  - ap64: update debug action

## Release: 2.6.0

- application-1.1.0
  - app_keepassxc: add user default setup
- system-1.2.1:
  - sys_gui_cinnamon: add nemo default cfg

## Release: 2.5.0

- automation-1.2.3
  - ap64: add collection selector to upgrade option
- system-1.2.0:
  - add role: sys_dconf
  - sys_shell: add new p10k custom set

## Release: 2.4.0

- dev-environment
  - add testing script: devap64-test
  - add dev env loader: devap64-set
  - create shared molecule configuration
- system-1.1.0
  - sys_fonts: use /usr/local/share/fonts for new custom fonts
  - sys_gui_cinnamon: add usr config provisioning
- storage-1.2.1
  - stg_autofs: add autofs.conf specific setting for Ubuntu

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
