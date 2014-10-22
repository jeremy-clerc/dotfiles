To have hosts completion, put all your hosts in ~/.ssh/config or edit /etc/ssh/ssh_config
```
HashKnownHosts yes
```

Clone in $HOME directory, and use GNU stow to put the files in place:

```bash
stow  -d ~/dotfiles -t ~ bash vim tmux
```
