# Contributing

## Prepare Development Environment

- Prepare dev tools:
  - Install GIT
  - Install Git Flow
  - Install Python

- Clone GIT repositories

```shell
# Create the main repository
cd <YOUR_PROJECTS_PATH>
git clone https://github.com/serdigital64/aplatform64
cd aplatform64
# Init git flow
git flow init
# Create module repositories as git submodules
git submodule init
# Update modules
git submodule update
# Enable main branch on submodules
git submodule foreach "git checkout main"; git submodule foreach "git checkout develop"
# (Optional) Initialize git flow. Production branch:main, use defaults for the remaining branches
git submodule foreach "git flow init"
```

- Adjust environment variables to match your configuration:

  - Copy environment definition files from templates:

  ```shell
  cp dot.local .local
  cp dot.secrets .secrets
  ```

  - Review and update content for both files to match your environment

- Create Python Virtual Environment

```shell
source .local
source .env
python3 -m venv "$DEVAP_PYTHON_VENV"
source ./bin/dev-set
```

- Install Python dev modules

```shell
pip3 install --upgrade -r requirements-aplatform64.txt
```

- The environment is now ready. From now use the following script to load environment variables and set the virtual Python environment:

```shell
source ./bin/dev-set
```

## Update source code

- CLI:
  - Add/Edit source code in: `src/cli`
- Collections
  - Work on the collection repository using it's own development branch

## Design principles

### Role Structure

#### Defaults

- Used as an interface to expose role end-state attributes and action parameters

  | Path                                   | Purpose                                                                                           |
  | -------------------------------------- | ------------------------------------------------------------------------------------------------- |
  | defaults/                              | Root directory where Ansible will look for defaults                                               |
  | defaults/main/                         | Allow Ansible to use individual default definition files instead of a single main.yml entry point |
  | defaults/main/end_state_definition.yml | Declare what are the end-state attributes that the role will set.                                 |
  | defaults/main/action_parameters.yml    | Declare what parameters are available to define how role actions will behave.                     |

- All role attributes and parameters must be declared. If the variable doesn't have a default value then it must be initialized to the empty value associated to the variable type (number, string, dictionary, list)
- Complex variables (dictionaries, lists) must be further documented in the vars/dictionary.yml file
- State definition attributes are permanent and are intended to represent the desired state. Non-default values must be defined as `host_variables` or `group_variables` and are the main component for implementing the _infrastructure-as-code_ strategy
- Action parameter variables are dynamic and are reset every time the role is executed. This allows common roles to be executed several times without inheriting default settings from previous iterations.

#### Actions

##### Action: Prepare

- Purpose: prepare the role runtime environment.
- Common tasks:
  - Create users.
  - Create directory structures.

##### Action: Deploy

- Purpose: install application packages used by the role.
- Common tasks:
  - Install native operating system application packages.
  - Install application packages distributed as single archives.
  - Install application packages from GIT.
  - Install application packages from Snap.
  - Install application packages from FlatHub.

##### Action: Setup

- Purpose: setup configuration files used by the role.
- Common tasks:
  - Create configuration files
  - Update configuration files

##### Action: Control

- Purpose: control the execution of services managed by the role.
- Common tasks:
  - Star/Stop the service.
  - Refresh/Reload the service.

##### Action: Provision

- Purpose: perform provisioning tasks for content managed by the role.
- Common tasks: tasks are dependant on the role.

### Code Templates

Use the following code templates from the project [CodeSkel64](https://github.com/serdigital64/codeskel64) for adding content to the project:

- [Collections](https://github.com/serdigital64/codeskel64/tree/main/src/catalog/Ansible/skeletons/collection-aplatform64)
- [Roles](https://github.com/serdigital64/codeskel64/tree/main/src/catalog/Ansible/skeletons/role-aplatform64-full)

### Operating System Compatibility

- Roles that are sensitive to the underlying operating system version must add version compatibility check
- Code must be prepared to minimize OS specific dependencies
- OS specific dependencies must be encapsulated by either using OS ID keys in yaml dictionary or in stand-alone files
- Typical places where OS compatibility is found:
  - `ROLEID/tasks/ROLEID_initialize.yml`
    - `- name: "ROLEID / Initialize / Check Platform compatibility"`
    - `- name: "ROLEID / Initialize / Set Platform specific variables"`
  - `ROLEID/var/main.yml`
    - `ROLEID_platforms:`
    - `ROLEID_os_family`
  - `ROLEID/var/platform-OSNAME.yml`
  - `auto_aplatform64/templates/roles/*`

## Versioning Strategy

- [Semantic Versioning 2](https://semver.org/)

## Branching Model

- [Git-Flow](https://nvie.com/posts/a-successful-git-branching-model/)

## Change Log Format

- [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),

## Linting

- Global Ansible Lint definition: `$DEVAP_ROOT/.ansible-lint`
- Global YAML Lint definition: `$DEVAP_ROOT/.yamllint`
- Global ShellCheck Lint definition: `$DEVAP_ROOT/.shellcheckrc`

## Test source code

- Build Collection packages:

```shell
bin/dev-build -t
```

## Documentation

- Documentation is created using **MkDocs** and published in the [https://readthedocs.org/](https://readthedocs.org/)] site.
- Each collecttion and role has it's own document (README.md)

## Commit Message Strategy

- [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/)
- Subject Format: `Type: Summary`
- Subject Max Length: 50 characters
- Types:
  - build
  - docs
  - feat
  - fix
  - refactor
  - style
  - test
- Summary Templates:
  - update xxx
  - remove xxx
  - fix xxx
  - set initial structure

## Naming Convention

- Collections
  - definition: represents a technology or service
  - lowercase
  - single word
- Roles
  - definition: represents a component of the technology managed by the collection
  - lowercase
  - words separate by \_
  - combined word: collection name + role name
  - template: collection_role
- Tasks
  - definition: represents a set of actions
  - lowercase
  - words separate by \_
  - combined word: collection name + role name + task name + subtask name
  - templates
    - collection_role_task.yml
    - collection_role_task_subtask.yml
- Defaults
  - main/state_definition.yml
  - main/action_parameters.yml
- Variables
  - lowercase
  - words separate by \_
  - combined word: collection name + role name + variable name
  - templates
    - collection_role_variable
    - collection_role\_\_\_temporary_variable

## Repositories

- Project GIT repository
  - Main: [https://github.com/serdigital64/aplatform64](https://github.com/serdigital64/aplatform64)
  - Submodules: [https://github.com/aplatform64](https://github.com/aplatform64)
- Project Ansible Galaxy repository: [https://galaxy.ansible.com/serdigital64](https://galaxy.ansible.com/serdigital64)
- Project Documentation: [https://aplatform64.readthedocs.io](https://aplatform64.readthedocs.io)
