
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
Plugin 'fatih/vim-go'


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
"set expandtab				" converts tabs/indents to normal spaces
"set bg=dark				" make colors more visible on dark themes

"set listchars=eol:$,tab:>-,trail:•,extends:»,precedes:«,nbsp:%
:let mapleader = ';'
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

let g:vim_markdown_folding_disabled = 1

autocmd FileType yaml setl indentkeys-=<:>

:set mousemodel=extend
set mouse=a
set pastetoggle=<F10>


" remove search with leader c
map <leader>c :nohl<CR>

autocmd filetype crontab setlocal nobackup nowritebackup
