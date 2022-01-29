# Project Design

## Role Structure

### Defaults

- Used as an interface to expose role end-state attributes and action parameters

  | Path                                   | Purpose                                                                                           |
  | -------------------------------------- | ------------------------------------------------------------------------------------------------- |
  | defaults/                              | Root directory where Ansible will look for defaults                                               |
  | defaults/main/                         | Allow Ansible to use individual default definition files instead of a single main.yml entry point |
  | defaults/main/end_state_definition.yml | Declare what are the end-state attributes that the role will set.                                 |
  | defaults_main/action_parameters.yml    | Declare what parameters are available to define how role actions will behave.                     |

- All role attributes and parameters must be declared. If the variable doesn't have a default value then it must be initialized to the empty value associated to the variable type (number, string, dictionary, list)
- Complex variables (dictionaries, lists) must be further documented in the vars/dictionary.yml file
- State definition attributes are permanent and are intended to represent the desired state. Non-default values must be defined as `host_variables` or `group_variables` and are the main component for implementing the _infrastructure-as-code_ strategy
- Action parameter variables are dynamic and are reset every time the role is executed. This allows common roles to be executed several times without inheriting default settings from previous iterations.

## Role Actions

### Action: Prepare

- Purpose: prepare the role runtime environment.
- Common tasks:
  - Create users.
  - Create directory structures.

### Action: Deploy

- Purpose: install application packages used by the role.
- Common tasks:
  - Install native operating system application packages.
  - Install application packages distributed as single archives.
  - Install application packages from GIT.
  - Install application packages from Snap.
  - Install application packages from FlatHub.

### Action: Setup

- Purpose: setup configuration files used by the role.
- Common tasks:
  - Create configuration files
  - Update configuration files

### Action: Control

- Purpose: control the execution of services managed by the role.
- Common tasks:
  - Star/Stop the service.
  - Refresh/Reload the service.

### Action: Provision

- Purpose: perform provisioning tasks for content managed by the role.
- Common tasks: tasks are dependant on the role.

## Services

Services are logic structures used to configure a set of roles to implement use-cases.

The use-case is defined in one or more playbooks that will use a dedicated inventory and end-state definition files:

```markmap

# Automation Service

## Inventory: `inventories/<SITE>/`

- File: `<SERVICE_NAME>_nodes.ini`
  - Group Name: `[<SERVICE_NAME>_nodes]`
- File: `<SERVICE_NAME>_service.ini`
  - Group Name: `[<SERVICE_NAME>_service]`

## Playbooks: `playbooks/<SITE>/`

- File: `manage_<SERVICE_NAME>_service.yml`
- File: `manage_<SERVICE_NAME>_nodes.yml`

## End-States: `inventories/<SITE>/group_vars/`

### `<SERVICE_NAME>_nodes`
- File for roles: `<ROLE_NAME1>.yml`
- File for roles: `<ROLE_NAMEX>.yml`
- File for Playbooks: `manage_<SERVICE_NAME>_nodes.yml`

### `<SERVICE_NAME>_service`
- File for roles: `<ROLE_NAME1>.yml`
- File for roles: `<ROLE_NAMEX>.yml`
- File for Playbooks: `manage_<SERVICE_NAME>_service.yml`
```
