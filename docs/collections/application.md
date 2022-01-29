# Ansible Collection: serdigital64.application

## About

Ansible Roles for automating office applications provisioning.

This collection is part of the [A:Platform64](https://github.com/serdigital64/aplatform64) project for automated infrastructure-as-code management.

## Content

| role                                                                                  | purpose                                              |
| ------------------------------------------------------------------------------------- | ---------------------------------------------------- |
| [app_chrome](https://aplatform64.readthedocs.io/en/latest/roles/app_chrome)           | Manage provisioning of the Google Chrome application |
| [app_drawio](https://aplatform64.readthedocs.io/en/latest/roles/app_drawio)           | Manage provisioning of the DrawIO application        |
| [app_gimp](https://aplatform64.readthedocs.io/en/latest/roles/app_gimp)               | Manage provisioning of the GIMP application          |
| [app_inkscape](https://aplatform64.readthedocs.io/en/latest/roles/app_inkscape)       | Manage provisioning of the InkScape application      |
| [app_keepassx](https://aplatform64.readthedocs.io/en/latest/roles/app_keepassx)       | Manage provisioning of the KeePassX application      |
| [app_kryta](https://aplatform64.readthedocs.io/en/latest/roles/app_kryta)             | Manage provisioning of the Kryta application         |
| [app_libreoffice](https://aplatform64.readthedocs.io/en/latest/roles/app_libreoffice) | Manage provisioning of the Libre Office application  |
| [app_msteams](https://aplatform64.readthedocs.io/en/latest/roles/app_msteams)         | Manage provisioning of the MS Teams application      |
| [app_obs](https://aplatform64.readthedocs.io/en/latest/roles/app_obs)                 | Manage provisioning of the OBS application           |
| [app_shotcut](https://aplatform64.readthedocs.io/en/latest/roles/app_shotcut)         | Manage provisioning of the ShotCut application       |
| [app_skype](https://aplatform64.readthedocs.io/en/latest/roles/app_skype)             | Manage provisioning of the Skype application         |
| [app_spotify](https://aplatform64.readthedocs.io/en/latest/roles/app_spotify)         | Manage provisioning of the Spotify application       |
| [app_tilix](https://aplatform64.readthedocs.io/en/latest/roles/app_tilix)             | Manage provisioning of the Tilix application         |
| [app_vscode](https://aplatform64.readthedocs.io/en/latest/roles/app_vscode)           | Manage provisioning of the VSCode application        |
| [app_xmind](https://aplatform64.readthedocs.io/en/latest/roles/app_xmind)             | Manage provisioning of the XMind application         |
| [app_zoom](https://aplatform64.readthedocs.io/en/latest/roles/app_zoom)               | Manage provisioning of the Zoom application          |

## Deployment

### Dependencies

- Ansible Collections:
  - serdigital64.backup
  - serdigital64.system

### Installation Procedure

Manually install Ansible Collections from the Ansible Galaxy repository:

```shell
ansible-galaxy collection install --upgrade serdigital64.application
```

Automatic installation is also available by deploying [A:Platform64](https://aplatform64.readthedocs.io/en/latest/#deployment)

## Contributing

Help on implementing new features and maintaining the code base is welcomed.

Please see the [guidelines](https://aplatform64.readthedocs.io/en/latest/contributing/guidelines) for further details.

## Author

- [SerDigital64](https://serdigital64.github.io/)

## License

[GPL-3.0-or-later](https://www.gnu.org/licenses/gpl-3.0.txt)
