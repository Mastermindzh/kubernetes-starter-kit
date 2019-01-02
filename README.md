# kubernetes-starter-kit

This starter helps you set up a kubernetes config.

The idea is that every Kubernetes resource you deploy comes in the form of this repository. This allows you to keep track of your deployments by implementing a standard organization format.

<!-- toc -->

- [Running the scripts](#running-the-scripts)
  - [generate](#generate)
  - [teardown](#teardown)
- [Directory structure](#directory-structure)

<!-- tocstop -->

## Running the scripts

Basically there are 2 steps:

### generate

The generate script ([scripts/generate.sh](./scripts/generate.sh)) should take care of provisioning the resources to kubernetes. You can start the generation with either of the following commands:

- `bash scripts/generate.sh`
- `npm start`

### teardown

The teardown script ([scripts/teardown.sh](./scripts/teardown.sh)) should take care of undoing what the generate script did. Certain steps, like deleting container images, can be made optional. You can start the teardown with either of the following commands:

- `bash scripts/teardown.sh`
- `npm run delete`

## Directory structure

```sh
.
├── assets # assets used in the repo
├── package.json # starter file (allows npm start / other scripts)
│
├── resources # kubernetes resource files / docker files
│   └── example.yaml
│
├── scripts # scripts directory, helps to provision / tear down
│   ├── config.sh # user config file
│   ├── generate.sh # main script
│   └── helpers # helper scripts
│       ├── helpers.sh # useful functions
│       └── init-settings.sh # pre-set settings (overridable in config.sh)
├── secrets # folder to share secrets (secret sync files, erlang cookies, etc.)
│
└── workingdir # temp file directory
```