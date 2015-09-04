To have hosts completion, put all your hosts in ~/.ssh/config or edit /etc/ssh/ssh_config
```
HashKnownHosts yes
```

Clone in $HOME/stow/ directory, and use GNU stow to put the files in place:

```bash
stow  -d $HOME/stow -t $HOME/ dotfiles
```
