set expandtab
set shiftwidth=4
set tabstop=4
":set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
":set list
set ls=2
syntax on
" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %
