# centos-puppet
[![License badge][license-img]](LICENSE)
[![Docker badge][docker-img]][docker-url]

This is a CentOS 7 docker image with puppet.
Linters is also installed in order to work with kitchen
for test purpose.

## Prerequisites

- Docker

##Usage

```text
docker pull yueyehua/centos-puppet
docker run \
  -d \                                          # daemonize
  --privileged \                                # for systemd
  -v /sys/fs/cgroup:/sys/fs/cgroup:ro \         # for systemd
  --name puppet \                               # container name
  -h puppet \                                   # hostname
  yueyehua/centos-puppet
docker exec -ti puppet bash
[Do something here]
docker stop puppet
docker rm puppet
```

[license-img]: https://img.shields.io/badge/license-Apache-blue.svg
[docker-img]: https://img.shields.io/docker/pulls/yueyehua/centos-puppet.svg
[docker-url]: https://registry.hub.docker.com/u/yueyehua/centos-puppet
