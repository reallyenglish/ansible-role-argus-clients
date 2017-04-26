# ansible-role-argus-clients

Installs `argus-clients`.

## Missing Ubuntu support

`deb` packages for our targeted Ubuntu releases are version 2.x, which has been
officially discouraged.

# Requirements

None

# Role Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `argus_clients_package` | package name of `argus-clients` | `{{ __argus_clients_package }}` |
| `argus_clients_config_dir` | the directory where `ra.conf` resides | `{{ __argus_clients_config_dir }}` |
| `argus_clients_config` | a dict of `ra.conf` (see below) | `{}` |

## `argus_clients_config`

The variable is a dict, its key is variables name of `ra.conf`, and their values. Example:


```yaml
argus_clients_config:
    RA_MIN_SSF: 40
    RA_MAX_SSF: 128
```

## FreeBSD

| Variable | Default |
|----------|---------|
| `__argus_clients_package` | `net-mgmt/argus3-clients` |

## OpenBSD

| Variable | Default |
|----------|---------|
| `__argus_clients_package` | `argus-clients` |

## RedHat

| Variable | Default |
|----------|---------|
| `__argus_clients_package` | `argus-clients` |

# Dependencies

None

# Example Playbook

```yaml
- hosts: localhost
  roles:
    - reallyenglish.redhat-repo
    - ansible-role-argus-clients
  vars:
    redhat_repo_extra_packages:
      - epel-release
    redhat_repo:
      epel:
        mirrorlist: "http://mirrors.fedoraproject.org/mirrorlist?repo=epel-{{ ansible_distribution_major_version }}&arch={{ ansible_architecture }}"
        gpgcheck: yes
        enabled: yes
    argus_clients_config:
      RA_MIN_SSF: 40
      RA_MAX_SSF: 128
```

# License

```
Copyright (c) 2017 Tomoyuki Sakurai <tomoyukis@reallyenglish.com>

Permission to use, copy, modify, and distribute this software for any
purpose with or without fee is hereby granted, provided that the above
copyright notice and this permission notice appear in all copies.

THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
```

# Author Information

Tomoyuki Sakurai <tomoyukis@reallyenglish.com>

This README was created by [qansible](https://github.com/trombik/qansible)
