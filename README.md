[![CircleCI](https://circleci.com/gh/noosenergy/neptune-kube-logs.svg?style=svg&circle-token=8658731bfa70cd9619d715b982fc3f4684760beb)](https://circleci.com/gh/noosenergy/neptune-kube-logs)

# Neptune Kube Logs
Logs monitoring boilerplate for the Neptune platform.

This project regroups quite a few ideas gathered along blogs, threads, repositories and other documentations. To give back to the community, Noos Energy open-sourced the deployment of such a service to help other developpers to jump-start building their cloud-native infrastructure.

## Quickstart

### Kubernetes and Helm installation

On Mac OSX, make sure [Homebrew](https://brew.sh/) has been pre-configured, then install Kubernetes and Helm CLI,

    $ brew install awscli kubectl helm

### Local development

The development workflows of this project can be managed by [noos-invoke](https://github.com/noosenergy/noos-invoke), a ready-made CLI for common CI/CD tasks.

``` shell
~$ noosinv
Usage: noosinv [--core-opts] <subcommand> [--subcommand-opts]

...

Subcommands:
  docker.build       Build Docker image locally.
  helm.lint          Check compliance of Helm charts / values.
  helm.test          Test local deployment in Minikube.
  local.dotenv       Create local dotenv file.
```
