" Install vundle with 
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" then run 
" vim +PluginInstall +qall
set nocompatible			" prevent vim from emulating the original vi's bugs and limitations.
" Required Vundle setup
filetype off
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'
Bundle 'plasticboy/vim-markdown.git'
Bundle 'tpope/vim-sensible.git'
Bundle 'tpope/vim-surround.git'
Plugin 'ConradIrwin/vim-bracketed-paste'
Plugin 'pearofducks/ansible-vim'
Plugin 'fatih/vim-go'
Bundle 'airblade/vim-gitgutter.git'
Plugin 'vim-airline/vim-airline'
Bundle 'altercation/vim-colors-solarized.git'
Bundle 'sheerun/vim-wombat-scheme'
Plugin 'junegunn/seoul256.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" here comes the defaults 
syntax on					" enable syntax highlighting
set bs=2					" allow backspacing over everything in insert mode
set wildmode=longest,list	" file search
set showmatch				" make a quick jump to the opening bracket when writing the closing.
set tabstop=4				" makes tabs consume 4 spaces
set shiftwidth=4			" makes automatic indents consume 4 spaces
set ignorecase				" ignore case when searching in documents
set title icon				" change the terminal title to the document name
set ruler					" show the cursor position all the time
set laststatus=2			" use a 2 row statusline (always show filename)
set hlsearch				" highlight searching
set autoindent				" automatically keep the current lines indent level for new lines.
set smartindent				" intelligently try to guess the a new lines indent level.
set winminheight=1			" ok to squash windows

"set backup                 " enable creation of backup files
set incsearch				" makes vim search as soon as you start typing (can be slow)
set expandtab				" converts tabs/indents to normal spaces
set bg=dark                 " make colors more visible on dark themes

"set listchars=eol:$,tab:>-,trail:•,extends:»,precedes:«,nbsp:%
:let mapleader = "\<Space>"
map <silent> <Leader>p :set invpaste<CR>
map <silent> <Leader>l :set invlist<CR>
noremap <silent> <Space> :silent noh<Bar>echo<CR>

hi SpecialKey ctermfg=7
hi NonText ctermfg=7

au BufNewFile,BufRead /etc/httpd/conf.d/* setf apache
" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

map <silent> <C-t> :NERDTreeToggle<CR>
map <leader>ff :NERDTreeFind<CR>

let g:vim_markdown_folding_disabled = 1

set mousemodel=extend
set pastetoggle=<F10>

" remove search with leader c
map <leader>c :nohl<CR>

" fix edit crontab in osx
autocmd filetype crontab setlocal nobackup nowritebackup

"fix hilight color
hi Visual term=reverse cterm=reverse guibg=Grey

if filereadable("$HOME/.vimrc.local")
  source $HOME/.vimrc.local
endif

"duplicate line cmd-d
map <D-d> yyp

" cmd + number for switching tabs
map <D-1> 1gt
map <D-2> 2gt
map <D-3> 3gt
map <D-4> 4gt
map <D-5> 5gt
map <D-6> 6gt
map <D-7> 7gt
map <D-8> 8gt
map <D-9> 9gt
map <D-0> 0gt

"toggle_comment to use CMD-/
map <D-/> q

" auto paste 
" Thanks to https://www.supertechcrew.com/extra-characters-paste-ssh-bracketed-paste/
if !exists("g:bracketed_paste_tmux_wrap")
  let g:bracketed_paste_tmux_wrap = 1
endif

function! WrapForTmux(s)
  if !g:bracketed_paste_tmux_wrap || !exists('$TMUX')
    return a:s
  endif

  let tmux_start = "\<Esc>Ptmux;"
  let tmux_end = "\<Esc>\\"

  return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction

let &t_ti .= WrapForTmux("\<Esc>[?2004h")
let &t_te .= WrapForTmux("\<Esc>[?2004l")

function! XTermPasteBegin(ret)
  set pastetoggle=<f29>
  set paste
  return a:ret
endfunction

execute "set <f28>=\<Esc>[200~"
execute "set <f29>=\<Esc>[201~"
map <expr> <f28> XTermPasteBegin("i")
imap <expr> <f28> XTermPasteBegin("")
vmap <expr> <f28> XTermPasteBegin("c")
cmap <f28> <nop>
cmap <f29> <nop>
" end auto paste

" fix yaml
autocmd filetype yaml setlocal tabstop=2 expandtab shiftwidth=2 indentkeys-=<:>

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" use 256 colors in terminal
if !has("gui_running")
    set t_Co=256
    set term=screen-256color
endif

" fix fonts as well
if &t_Co >= 256 || has("gui_running")
    let g:solarized_termcolors=256
    colorscheme seoul256
    set guifont=Inconsolata-dz\ for\ Powerline:h12
    " remove the annoying different color of colorcolumn
    :set colorcolumn=
endif
set listchars=tab:▷\ ,trail:.,extends:#,nbsp:.
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
set ruler        " show the ruler
set cursorline   " highlight cursor line

