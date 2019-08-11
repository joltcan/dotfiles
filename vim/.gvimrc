if filereadable("$HOME/.vimrc")
  source $HOME/.vimrc
endif

set gfn=monoid:h12
set bg=light
au! BufWritePost .vimrc so %
au! BufWritePost .gvimrc so %


au VimEnter * highlight clear SignColumn 
