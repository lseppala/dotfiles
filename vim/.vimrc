"Created Mar 5, 2010
"Stolen from http://vi-improved.org/vimrc.php
"And from http://spf13.com/post/ultimate-vim-config (Sept 14, 2010)

set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" Personal bundles

Bundle 'ervandew/supertab'
Bundle 'git://git.wincent.com/command-t.git'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'gregsexton/gitv'
Bundle 'vim-scripts/Gundo'
Bundle 'vim-scripts/camelcasemotion'
Bundle 'vim-scripts/delimitMate.vim'
Bundle 'vim-scripts/localrc.vim'
Bundle 'vim-scripts/scratch.vim'
Bundle 'vim-scripts/taglist.vim'
Bundle 'vim-scripts/tlib'
Bundle 'vim-scripts/vimwiki'
Bundle 'vim-scripts/AutoComplPop'
Bundle 'msanders/snipmate.vim'
Bundle 'vim-scripts/mru.vim'
Bundle 'duff/vim-bufonly'
Bundle 'fontzoom.vim'
Bundle 'majutsushi/tagbar'
Bundle 'molokai'
Bundle 'bronson/vim-trailing-whitespace'
Bundle 'myusuf3/numbers.vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'rociiu/scala'
Bundle 'ack.vim'
Bundle 'ag.vim'
Bundle('https://bitbucket.org/madevgeny/yate.git')
Bundle 'mikewest/vimroom'
"Bundle 'hallison/vim-markdown'
Bundle 'fs111/pydoc.vim'
"Bundle 'suan/vim-instant-markdown'
"Bundle 'vim-pandoc/vim-pandoc'
Bundle 'airblade/vim-gitgutter'
Bundle 'nanotech/jellybeans.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'vim-ruby/vim-ruby'
" Make vim and tmux play nicely together
Bundle 'christoomey/vim-tmux-navigator'


colo solarized
"let g:solarized_termtrans=1
"let g:solarized_termcolors=16

set bg=dark
noremap ;; :%s:\v::<Left><Left>
noremap ;l :%s:::<Left>
nnoremap <silent> <F2> :TagbarOpen j<CR>
nnoremap <space> :
let g:tagbar_autofocus = 1
map <F3> :NERDTreeToggle<CR>
set noexrc
set wildignore=*.swp,*.pyc,*.tmp
set t_Co=256

let g:CommandTAcceptSelectionSplitMap=['<C-g>']

set cpo+=J

au BufNewFile,BufRead *.page   set filetype=pandoc
let NERDTreeShowBookmarks=1
let NERDTreeWinSize=40
let Tlist_WinWidth=50
let Tlist_GainFocus_On_ToggleOpen=1
let Tlist_Ctags_Cmd='/usr/bin/ctags'
let Tlist_Compact_Format = 1
let Tlist_Show_One_File = 1

let g:ackprg = 'ag --nogroup --nocolor --column'

"let g:SuperTabMappingForward='<s-tab>'
"let g:SuperTabMappingBackward='<tab>'

" Syntastic settings
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1

syntax off
filetype plugin indent on
set hidden
set nobackup
set noswapfile

"set grepprg=grep\ -nH\ $*   "Added For LaTex Suite
let g:tex_flavor='latex'
set linebreak

set backspace=indent,eol,start
set fileformats=unix,dos,mac
set noerrorbells
if has("gui_running")
    set guioptions=-t
    set guifont=DejaVu\ Sans\ Mono\ 8
else
    set t_Co=256
endif
set novb

set nojoinspaces "Makes it so that two spaces after a period are not inserted on a join. Feb 28, 2011

set history=1000
set wildmode=list:longest,full  "comand <Tab> completion, list matches, then longest common part, then all. 14/09/10
set cursorline
set incsearch
set laststatus=2
set matchtime=5
set hlsearch
set nostartofline
set ruler
set scrolloff=5
set showmatch
set sidescrolloff=10
set showcmd

set tildeop

set ignorecase
set infercase
set nowrap
set smartcase
set expandtab
set formatoptions=rq
set softtabstop=2
set shiftwidth=2
set tabstop=2
set smarttab

"set undofile

nnoremap / /\v
vnoremap / /\v
set gdefault
nnoremap <CR> :noh<CR>
inoremap jj <esc>
inoremap <expr> <C-n> pumvisible() ? "\<Down>" : "\<C-n>"
inoremap <expr> <C-p> pumvisible() ? "\<Up>" : "\<C-p>"
nnoremap <leader>rc <C-w><C-v><C-l>:e $MYVIMRC<cr>
nnoremap <leader>rr :so $MYVIMRC<cr>
nnoremap <leader>wv <C-w>v<C-w>l
nnoremap <leader>cd :cd %:p:h<cr>
nnoremap <leader>bd :set bg=dark<cr>
nnoremap <leader>bl :set bg=light<cr>
nnoremap <leader>ss :%s/\v\s+$//<cr><C-o>:noh<cr>
nnoremap <leader>rb :!ruby %<cr>
nnoremap <leader><leader> <C-^>
nnoremap <leader><space> :echo "NO!"<CR>
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
vmap > >gv
vmap < <gv
nnoremap Y y$



nnoremap <leader><tab> <C-w><C-v><C-w>w:Scratch<cr>
nmap <silent> <leader>nu :NumbersToggle<CR>

nmap SS <ESC>:mksession! ~/.vim/Session.vim<CR>
nmap SO <ESC>:so ~/.vim/Session.vim<CR>

ca w!! w !sudo tee > /dev/null "%"
nnoremap <leader>v :vsp<CR>:exec("tag ".expand("<cword>"))<CR>
nnoremap <leader>s :sp<CR>:exec("tag ".expand("<cword>"))<CR>
nnoremap <leader>ag :exec("Ag ".expand("<cword>"))<CR>
"let g:vimwiki_list = [{'maxhi': 0, 'css_name': 'style.css', 'auto_export': 0, 'diary_index': 'diary', 'template_default': '', 'nested_syntaxes': {}, 'diary_sort': 'desc', 'path': '~/Dropbox/vimwiki/', 'diary_link_fmt': '%Y-%m-%d', 'template_ext': '', 'syntax': 'default', 'custom_wiki2html': '', 'index': 'index', 'diary_header': 'Diary', 'ext': '.md', ' path_html': '/home/lseppala/vimwiki_html/', 'temp': 0, 'template_path': '/', 'list_margin': -1, 'diary_rel_path': 'diary/'}]

let g:is_posix = 1


"" From DAS
set winwidth=84
" We have to have a winheight bigger than we want to set winminheight. But if
" we set winheight to be huge before winminheight, the winminheight set will
" fail.
set winheight=10
set winminheight=10
set winheight=999


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RENAME CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <leader>rn :call RenameFile()<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OPEN FILES IN DIRECTORY OF CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e :edit %%
map <leader>v :view %%

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MAPS TO JUMP TO SPECIFIC COMMAND-T TARGETS AND FILES
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>gv :CommandTFlush<cr>\|:CommandT app/views<cr>
map <leader>gc :CommandTFlush<cr>\|:CommandT app/controllers<cr>
map <leader>gm :CommandTFlush<cr>\|:CommandT app/models<cr>
map <leader>gh :CommandTFlush<cr>\|:CommandT app/helpers<cr>
map <leader>gl :CommandTFlush<cr>\|:CommandT lib<cr>
map <leader>gp :CommandTFlush<cr>\|:CommandT public<cr>
map <leader>gs :CommandTFlush<cr>\|:CommandT public/stylesheets<cr>
map <leader>gf :CommandTFlush<cr>\|:CommandT features<cr>
map <leader>gg :topleft 100 :split Gemfile<cr>
map <leader>gt :CommandTFlush<cr>\|:CommandTTag<cr>
map <leader>f :CommandTFlush<cr>\|:CommandT<cr>
map <leader>t :CommandTFlush<cr>\|:CommandT %%<cr>


"for ruby, autoindent with two spaces, always expand tabs
autocmd FileType ruby,haml,eruby,yaml,html,javascript,sass,cucumber set ai sw=2 sts=2 et

set splitright
set splitbelow

nnoremap <leader>ct :silent !ctags -R . <CR><CR>


