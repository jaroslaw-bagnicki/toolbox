# SSH cheatsheet

## Online tutorials
---

<iframe width="560" height="315" src="https://www.youtube.com/embed/hQWRp-FdTpc" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

<iframe width="560" height="315" src="https://www.youtube.com/embed/YS5Zh7KExvE" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## Command
---

`ssh` - opens secured Shell conection with remote host  

`ssh-keygen` - tool for generating private/public key pairs  

`ssh-copy-id` - util to send pub key to remote host (server)



## `config` file
----
`config` file can simplify establising SSH connection. Especially if you works with many hosts. File is located in user home dircetory: `~/.ssh/config`.
Useful links:

- [`ssh_config` man page](https://man.openbsd.org/OpenBSD-current/man5/ssh_config.5)

- [Article about config](https://linuxize.com/post/using-the-ssh-config-file/)

Sample config entry

```
Host aws.web1
    HostName 192.168.10.50
    User ubuntu
    Port 22
    IdentityFile ~/.ssh/aws_web1_id_rsa
```

## Good practices

1. To authenticate use auth key over password. If possible disable password authentication on remote host.
2. Don't share keys beetween hosts. Always use unique key per host.
3. Protect your private keys with **passphrase** [[more](https://www.ssh.com/academy/ssh/passphrase)]
4. Favoritize more sophisticated algorithms than RSA (e.g. `ed25519`) [[more](https://www.ssh.com/academy/ssh/keygen#choosing-an-algorithm-and-key-size)]

## Usful links

- [SSH Academy](https://www.ssh.com/academy)
- [SSH Academy - generating key](https://www.ssh.com/academy/ssh/keygen)
- [SSH Academy - `passpharse`](https://www.ssh.com/academy/ssh/passphrase)
- [SSH Academy - `ssh-copy-d`](https://www.ssh.com/academy/ssh/copy-id)