# Contributing

## Prepare Development Environment

- Prepare your local environment with recommended tools:
  - GIT
  - Docker
  - DevContainer compatible IDE (e.g.: VSCode)

- Clone GIT repository

```shell
# Create the main repository
cd <YOUR_PROJECTS_PATH>
git clone https://github.com/aplatform64/aplatform64
# Clone additional collection repositories as needed under <YOUR_PROJECTS_PATH>/collections/serdigital64
```

- Adjust environment variables to reflect your configuration:

```shell
# Copy environment definition files from templates:
cp dot.local .local
cp dot.secrets .secrets
# Review and update content for both files
```

- The environment is now ready. From now use the following script to load environment variables:

```shell
source ./bin/dev-set
```

## Update source code

- CLI:
  - Add/Edit source code in: `src/cli`
- Ansible Collections
  - Work on the collection repository using it's own development branch
- Buildin and test: use included devcontainer: `ubuntu-22.04-dev-ansible`

## Repositories

- Project GIT repository
  - Main: [https://github.com/aplatform64/aplatform64](https://github.com/aplatform64/aplatform64)
  - Submodules: [https://github.com/aplatform64](https://github.com/aplatform64)
- Project Ansible Galaxy repository: [https://galaxy.ansible.com/serdigital64](https://galaxy.ansible.com/serdigital64)
- Project Documentation: [https://aplatform64.readthedocs.io](https://aplatform64.readthedocs.io)
