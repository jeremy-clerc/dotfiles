set modeline
set modelines=5
"set expandtab
set shiftwidth=4
set tabstop=4
":set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
":set list
set ls=2
syntax on
filetype on
au BufNewFile,BufRead *.j2 set filetype=jinja
au BufNewFile,BufRead *.sls set filetype=yaml
au BufNewFile,BufRead *.sls.ci set filetype=yaml
" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %
