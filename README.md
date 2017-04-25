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
    - ansible-role-argus-clients
  vars:
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
