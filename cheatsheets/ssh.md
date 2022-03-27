# SSH cheatsheet

## Command

`ssh` - opens secured Shell conection with remote host  

`ssh-keygen` - tool for generating private/public key pairs  

`ssh-copy-id` - util to send pub key to remote host (server)


## Connecting to remote host
```bash
ssh -i path-to-private-key username@host

# e.g.
ssh -i ~/.ssh/azure-vm.pem azureuser@123.45.67.89
```
The host could be either host IP or host domain.

## Generating new keypair
```bash
ssh-keygen -t ed25519 -f ~/.ssh/key-name

```

## `config` file

The `config` file can simplify establising SSH connection. Especially if you works with many hosts. User-specific config file is located in home directory: `~/.ssh/config`. Entries can be added via `ssh config` command or by manual editing the file.

Sample config entry

```
Host aws.web1
    HostName ec2-38-142-163-234.eu-central-1.compute.amazonaws.com
    User ubuntu
    Port 22
    IdentityFile ~/.ssh/aws.web1.pem
```

Thanks to configuration to open connection you can just type `ssh aws.web1` instead of `ssh -i ~/.ssh/aws.web1.pem ubuntu@ec2-38-142-163-234.eu-central-1.compute.amazonaws.com`

Useful links:
- [`ssh_config` man page](https://man.openbsd.org/OpenBSD-current/man5/ssh_config.5)
- [Linuxize | Using the SSH Config File](https://linuxize.com/post/using-the-ssh-config-file/)


## Using `ssh-agent`

```bash
# Start ssh-agent for a terminal session
eval $(ssh-agent)

# Add publish
ssh-add ~/.ssh/my-private-key

# List identities
ssh-add -l
```


## Get key fingerprint

SHA256 fingerprint
```
ssh-keygen -lf acg-awsdev.pem
# example output: 2048 SHA256:Khbcnwrf+R6SPE/Vf2HpPRjPVirvCqrmAdLgN3bVt9Y no comment (RSA)
```

MD5 fingerprint
```
ssh-keygen -E md5 -lf acg-awsdev.pem
# example output:2048 MD5:5b:ba:21:e4:65:d9:20:51:48:ae:77:97:69:f9:f4:1b no comment (RSA)
```

## Good practices

1. To authenticate use auth key over password. If possible disable password authentication on remote host.
2. Don't share keys beetween hosts. Always use unique key per host.
3. Protect your private keys with **passphrase** [[more](https://www.ssh.com/academy/ssh/passphrase)]
4. Favoritize more sophisticated algorithms than RSA (e.g. `ed25519`) [[more](https://www.ssh.com/academy/ssh/keygen#choosing-an-algorithm-and-key-size)]

## Usful links

- [SSH Academy](https://www.ssh.com/academy)
- [SSH Academy - generating key](https://www.ssh.com/academy/ssh/keygen)
- [SSH Academy - passpharse](https://www.ssh.com/academy/ssh/passphrase)
- [SSH Academy - ssh-copy-id](https://www.ssh.com/academy/ssh/copy-id)

## Online tutorials

[![Traversy Media | SSH Crash Course](https://img.youtube.com/vi/hQWRp-FdTpc/mqdefault.jpg)](https://www.youtube.com/watch?v=hQWRp-FdTpc)

[![LearnLinuxTV | OpenSSH Full Guide](https://img.youtube.com/vi/YS5Zh7KExvE/mqdefault.jpg)](https://www.youtube.com/watch?v=YS5Zh7KExvE)
