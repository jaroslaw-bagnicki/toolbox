# SSH cheatsheet

## Online tutorials

<iframe width="560" height="315" src="https://www.youtube.com/embed/hQWRp-FdTpc" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

<iframe width="560" height="315" src="https://www.youtube.com/embed/YS5Zh7KExvE" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## Commands

`ssh` - opens secured Shell conection with remote host  

`ssh-keygen` - tool for private/public key pairs  

`ssh-copy-id` - util to send pub key to remote host  



## `config` file
----
Useful links:

- [`ssh_config` man page](https://man.openbsd.org/OpenBSD-current/man5/ssh_config.5)

- [Article about config](https://linuxize.com/post/using-the-ssh-config-file/)

Sample config entry

```
Host web1
    HostName 192.168.10.50
    User ubuntu
    Port 22
    IdentityFile ~/.ssh/aws_web1_id_rsa
```

## Good practices

1. To authenticate use keys over password. If possible disable password authentication on remote host.
2. Don't share keys beetween hosts. Always use uniq key per host.
3. Protect your private keys with **passphrase** [[more](https://www.ssh.com/academy/ssh/passphrase)]
4. Favoritise more sophistaicated algoritms (e.g. `ed25519`) [[more](https://www.ssh.com/academy/ssh/keygen#choosing-an-algorithm-and-key-size)]

## Usful links

- [SSH Academy](https://www.ssh.com/academy)
- [SSH Academy - generating key](https://www.ssh.com/academy/ssh/keygen)
- [SSH Academy - passpharse](https://www.ssh.com/academy/ssh/passphrase)