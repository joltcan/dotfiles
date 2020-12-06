" Install vundle with 
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim ; vim +PluginInstall +qall
"
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
Plugin 'fatih/vim-go'
Bundle 'airblade/vim-gitgutter.git'
Plugin 'vim-airline/vim-airline'
Bundle 'chase/vim-ansible-yaml'

" themes
" onehalf theme
Bundle 'sonph/onehalf', {'rtp': 'vim/'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" here comes the defaults 
syntax on                   " enable syntax highlighting
set bs=2                    " allow backspacing over everything in insert mode
set wildmode=longest,list   " file search
set showmatch               " make a quick jump to the opening bracket when writing the closing.
set tabstop=4               " makes tabs consume 4 spaces
set shiftwidth=4            " makes automatic indents consume 4 spaces
set ignorecase              " ignore case when searching in documents
set title icon              " change the terminal title to the document name
set ruler                   " show the cursor position all the time
set hlsearch                " highlight searching
set autoindent              " automatically keep the current lines indent level for new lines.
set smartindent             " intelligently try to guess the a new lines indent level.
set winminheight=1          " ok to squash windows
set incsearch               " makes vim search as soon as you start typing (can be slow)
set expandtab               " converts tabs/indents to normal spaces
set list                    " show hidden chars per default
set nofoldenable            " disable folding

:let mapleader = "\<Space>"
map <silent> <Leader>p :set invpaste<CR>
map <silent> <Leader>l :set invlist<CR>
noremap <silent> <Space> :silent noh<Bar>echo<CR>

" fix override options for filetypes
autocmd BufNewFile,BufRead /etc/httpd/conf.d/* setf apache
autocmd BufNewFile,BufRead rsnapshot.conf setlocal noexpandtab
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" fix edit crontab in osx
autocmd filetype crontab setlocal nobackup nowritebackup
" fix yaml
autocmd filetype yaml setlocal tabstop=2 expandtab shiftwidth=2

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

map <silent> <C-t> :NERDTreeToggle<CR>
map <leader>ff :NERDTreeFind<CR>

set mousemodel=extend
set pastetoggle=<F10>

" remove search with leader c
map <leader>c :nohl<CR>

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
 
" use 256 colors
set t_Co=256
set term=screen-256color

" fix fonts as well
set guifont=Inconsolata-dz\ for\ Powerline:h12

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" theme settings
:set background=light
let g:airline_theme='onehalfdark'
colorscheme onehalfdark

" remove the annoying different color of colorcolumn
:set colorcolumn=

" thanks leihog!
set listchars=tab:>\ ,trail:.,extends:#,nbsp:.
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
set ruler        " show the ruler
set cursorline   " highlight cursor line

" git gutter
if exists('&signcolumn')  " Vim 7.4.2201
  set signcolumn=yes
else
  let g:gitgutter_sign_column_always = 1
endif

" map f8 to open file under cursor
map <F8> :vertical wincmd f<CR>

noremap <silent> <Space> :silent noh<Bar>echo<CR>

" https://stackoverflow.com/a/53930943/6148844
nnoremap <Leader>2 :call ToggleSignColumn()<CR>
" Toggle signcolumn. Works only on vim>=8.0 or NeoVim
function! ToggleSignColumn()
    if !exists("b:signcolumn_on") || b:signcolumn_on
        set signcolumn=no
        let b:signcolumn_on=0
    else
        set signcolumn=auto
        let b:signcolumn_on=1
    endif
endfunction


" https://vim.fandom.com/wiki/Make_Vim_completion_popup_menu_work_just_like_in_an_IDE
:set completeopt=longest,menuone
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'


" ansible
autocmd FileType yaml setlocal ai ts=2 sw=2 et
let g:ansible_options = {'documentation_mapping': '<C-K>'}

