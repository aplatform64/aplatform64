# Contributing

## Development Environment

- Dev environment variables are set in the dot.env file: `.env`
- Before sourcing the script modify the `APLATFORM64_ROOT` variable to the project root

## Development Tools

The project requires additional python modules on top of the present Ansible version

- molecule
- yamllint
- ansible-lint
- mkdocs
- mdx-truly-sane-lists

Required modules and dependencies are available in the python requirements file: `$APLATFORM64_ROOT/requirements-aplatform64.txt`

## Code Templates

Use the following code templates from the project [CodeSkel64](https://github.com/serdigital64/codeskel64) for adding content to the project:

- [Collections](https://github.com/serdigital64/codeskel64/tree/main/Ansible/skeletons/collections/aplatform64)
- [Roles](https://github.com/serdigital64/codeskel64/tree/main/Ansible/skeletons/roles/aplatform64-full)
- [Tests](https://github.com/serdigital64/codeskel64/tree/main/Ansible/skeletons/molecule/aplatform64)

## Licensing

- [GPL-3.0-or-later](https://www.gnu.org/licenses/gpl-3.0.txt)

## Versioning Strategy

- [Semantic Versioning 2](https://semver.org/)

## Branching Model

- [Git-Flow](https://nvie.com/posts/a-successful-git-branching-model/)

## Linting

- Ansible Lint definition: `$APLATFORM64_ROOT/.ansible-lint`
- YAML Lint definition: `$APLATFORM64_ROOT/.yamllint`

## Testing

- Tool: Molecule
- Scenarios:
  - Initialize: create an scenario for running the role with no parameters (defaults)
  - Role Actions: create scenarios for each role action
  - Use Cases: create scenarios for each key use case

## Documentation

- Main documentation is located in path `/docs`
- Documentation is created using **MkDocs** and published in the [https://readthedocs.org/](https://readthedocs.org/)] site.
- Roles are documented in `/docs/roles` and must have a symlink to `<ROLE_NAME>/README.md` file.
- Collections are documented in `/docs/collections` and must have a symlink to `<COLLECTION_NAME>/README.md` file.

## Commit Message Strategy

- [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/)
- Subject Format: `Type(Scope): Summary`
- Subject Max Length: 50 characters
- Types:
  - build
  - docs
  - feat
  - fix
  - refactor
  - style
  - test
- Scope Templates:
  - collectionXX
  - roleYYY
  - project
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
