---
title: "Shell"
description: "Common configuration, useful command and so on..."
date: 2020-09-29
sidebar: "ture"
weight: "30"
---

This page focuses on configuration of the terminal, useful commands and scripting.
Command-line tools I used (e.g. git) are described in the [Tools page](../tools/).


## External links

- [The Art of Command Line](https://github.com/jlevy/the-art-of-command-line)
- [Terminals Are Sexy](https://terminalsare.sexy/)

## SSH login 

I would like it simple when I have to log in remote servers using terminal shell:

- *do not* have to remember all the various remote addresses and usernames.
- enable X11 forwarding and SSH agent forwarding, which allows running graphical applications remotely
- *do not* have to enter various passwords for different servers.

The solution is to edit `~/.ssh/config`(*user-specific configuration file*) or `/ect/ssh/ssh_config`(*global configuration file*):

```sh
# for all ssh connection
Host *
    ForwardAgent yes
    ForwardX11 yes
    ForwardX11Trusted yes
    XauthLocation /opt/X11/bin/xauth 
    PubkeyAuthentication yes
    AddKeysToAgent yes #authentication
    UseKeychain yes
    IdentityFile ~/.ssh/id_rsa
# example course server
Host course1
  HostName course.example.com
  User student
  Port 22
  IdentitiesOnly yes

Host group
  HostName group.nju.edu.cn
  User me
  Port 22
```
Now I can log in the server by identifiers that I set, e.g. `ssh group`.

### Configuring Passwordless Authentication

|![How does this work?](/images/ssh_login.png "SSH Authentication")|
|:--:| 
| *How does this work?* |

1. First, make sure that you have `id_rsa` and `id_rsa.pub` public/private keypairs in the directory `~/.ssh/`, or you can generate `rsa` key by 
```sh
ssh-keygen -t rsa
```
2. Second, copy the public key `id_rsa.pub` from ssh client to server `~/.ssh/authorized_keys`. Using `scp` command could be tedious, so we use `ssh-copy-id` command.
```sh
ssh-copy-id -i ~/.ssh/id_rsa.pub username@server -p 22
```
Then you are prompted to enter the password or complete other authentication for the server. Note that the private key should never be copied to another machine.

3. Change the permission of authorized key file to 600
```sh
chmod -f 600 ~/.ssh/authorized_keys
```
4. Then you can test the new key.
```sh
ssh -v username@server
```
The login should now complete without asking for a password. If the test fails, read the output to see what it says about whether the key is tried and what authentication methods the server is willing to accept.

Note that the command might ask for the **passphrase** you specified for the keypairs. You can easily add/remove passphrase of your keypairs by using the following command

```sh
ssh-keygen -p
```

1. On the first prompt, enter the file path (or press Enter to use the default)
2. Second prompt, enter the old passphrase
3. Next prompt, just press enter to unset the passphrase

*Note: I still failed and after googling around, I found trying the following could help.*

```sh
#Change the permision of user directory
chmod 700 /home/username
#.Change the permision of .ssh directory
chmod 700 ~/.ssh/
```
