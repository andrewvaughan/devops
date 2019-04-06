# Andrew Vaughan DevOps

[![Version][version-image]][github-release]
[![License][license-image]][github-license]
[![Build Status][build-image]][travis-detail]
[![Coverage][coverage-image]][codecov-detail]

This project contains scripts and tools used by Andrew Vaughan to maintain his HomeLab and cloud servers. This
ensures that InfoSec, OpsSec, and other operational standards are followed while automating configuration and
deployment of DevOps tools

## Installation

As this project is intended for personal use, it is only made available from this repository. The `develop` branch
is the default, and used as the development release branch with latest features. It can be cloned from GitHub:

```bash
git clone https://github.com/andrewvaughan/devops
```

The latest, stable release can be checked out on the `master` branch:

```bash
git clone https://github.com/andrewvaughan/devops
git checkout master
```

### Dependencies

This project assumes that both [Python][python] and [Ansible][ansible] are installed on the controlling machine.
Scripts are provided to install dependencies on remote machines, if needed.

## Usage

A Makefile is provided for normal use. You may be asked to enter various vault passwords, depending on the request.
To use the service, simply use one of the following commands:

```bash
make
```

The default command will run the full playbook.

```bash
make ping
```

This will ping each of the servers, ensuring they are both accessible and the `devops` user is configured correctly.

### Playbook Usage

In addition to the Makefile, the Ansible playbook can be run directly with as many or as few options as needed. These
options can be run on any of the host groups.

For example, to run only the playbook on DigitalOcean hosts:

```bash
ansible-playbook --limit "digital-ocean" playbook.yml
```

These host groups can be narrowed with Ansible's pattern tools. For example, to only configure client servers:

```bash
ansible-playbook --limit "datacenter:&digital-ocean" playbook.yml
```

### Playbook Tags

A number of tags are available to more-finely control what actions are taken on remote servers. Available tags are as
follows:

| Tag      | Action                                                                                  |
|:--------:|-----------------------------------------------------------------------------------------|
| `common` | Hardens servers and configures them to the basic minimums required across all platforms |

These tags can be individually run. For instance, to simply ensure the servers meet minimum, common configuration
requirements and run no other scripts, the `common` tag can be run, alone:

```bash
ansible-playbook --tags=common playbook.yml
```

You can select multiple tags by comma-separating them in the `--tags` argument.

Alternatively, you can run all tags *except* for one (or more) by skipping them:

```bash
ansible-playbook --skip-tags=wiki,www playbook.yml
```

## Contributing

There are many ways to contribute to this project! If you have an idea, or have discovered a bug, please
[open an issue][github-issue] so it can be addressed.

If you are interested in contributing to the project through design or development, please read our
[Contribution Guidelines][github-contribute].

### Testing

A `Makefile` is provided to assist with linting, testing, and code coverage generation. Dependencies will be managed
automatically during testing:

```bash
make test      # Runs linting and test suites
make coverage  # Runs linting, tests, and generates an HTML coverage report
```

*Please note that full tests must be provided when making contributions to this project.*

## Release Policy

Releases of this project follow [Semantic Versioning][semver] standards in a `MAJOR.MINOR.PATCH` versioning scheme of
the following format:

* `MAJOR` - modified when major, incompatible changes are made to the application,
* `MINOR` - modified when functionality is added in a backwards-compatible manner, and
* `PATCH` - patches to existing functionality, such as documentation and bug fixes.

## License

This project is made available under the [Apache 2.0 License][github-license].

```
Copyright 2019 Andrew Vaughan

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```


[version-image]:     http://img.shields.io/badge/release-0.1.0-blue.svg?style=flat
[license-image]:     http://img.shields.io/badge/license-Apache_2.0-blue.svg?style=flat

[build-image]:       https://travis-ci.org/andrewvaughan/devops.svg?branch=master
[travis-detail]:     https://travis-ci.org/andrewvaughan/devops

[coverage-image]:    https://codecov.io/gh/andrewvaughan/devops/branch/develop/graph/badge.svg
[codecov-detail]:    https://codecov.io/gh/andrewvaughan/devops/branch/develop

[github-contribute]: https://github.com/andrewvaughan/devops/blob/master/.github/CONTRIBUTING.md
[github-issue]:      https://github.com/andrewvaughan/devops/issues
[github-license]:    https://github.com/andrewvaughan/devops/blob/master/LICENSE
[github-release]:    https://github.com/andrewvaughan/devops/releases

[ansible]:           https://www.ansible.com/
[python]:            https://www.python.org/
[semver]:            http://semver.org/
