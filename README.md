[![CircleCI](https://circleci.com/gh/noosenergy/neptune-kube-logs.svg?style=svg&circle-token=8658731bfa70cd9619d715b982fc3f4684760beb)](https://circleci.com/gh/noosenergy/neptune-kube-logs)

# Neptune Kube Logs
Neptune logs monitoring boilerplate.

## Quickstart

### Kubernetes and Helm installation

On Mac OSX, make sure [Homebrew](https://brew.sh/) has been pre-configured, then install Kubernetes and Helm CLI,

    $ brew install awscli kubectl helm

### Local development

The development workflows of this project can be managed by [noos-invoke](https://github.com/noosenergy/noos-invoke), a ready-made CLI for common CI/CD tasks.

```
$ noosinv
Usage: noosinv [--core-opts] <subcommand> [--subcommand-opts] ...
```
