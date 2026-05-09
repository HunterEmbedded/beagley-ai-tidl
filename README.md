


On the target we have dropbear SSH and so openssh options do not work.

convert openssh key to dropbear format

```
dropbearconvert openssh dropbear \
  /root/.ssh/id_ed25519_github_new \
  /root/.ssh/id_ed25519_github_new.db
chmod 600 /root/.ssh/id_ed25519_github_new.db
```

set up git to use dropbear

```
 git config core.sshCommand 'ssh -i /root/.ssh/id_ed25519_github_new.db'
```




and they clone with

```
GIT_SSH_COMMAND='ssh -i /root/.ssh/id_ed25519_github_new.db' \
git clone git@github.com:HunterEmbedded/beagley-ai-tidl.git
```
