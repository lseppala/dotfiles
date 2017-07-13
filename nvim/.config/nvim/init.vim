call plug#begin('~/.config/nvim/plugged')

" Processes
Plug 'Shougo/vimproc.vim', { 'do': 'make' }

" Async build
Plug 'neomake/neomake'
Plug 'tpope/vim-dispatch'
Plug 'skywind3000/asyncrun.vim'

" tmux
Plug 'christoomey/vim-tmux-navigator'
Plug 'lord-garbage/vimtux'

"" Colorschemes
Plug 'morhetz/gruvbox'
Plug 'mhartington/oceanic-next'
Plug 'romainl/flattened'
Plug 'molokai'

"" Auto-commenting
Plug 'scrooloose/nerdcommenter'

"" File navigation
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'FelikZ/ctrlp-py-matcher'
Plug 'ag.vim'

"" Editing
"" Auto-complete
Plug 'Shougo/deoplete.nvim'

"" C-do
Plug 'Peeja/vim-cdo'

"" Repeat commands
Plug 'tpope/vim-repeat'

"" Smart replacing
Plug 'tpope/vim-abolish'

"" Git
Plug 'tpope/vim-fugitive'
Plug 'gregsexton/gitv'
Plug 'airblade/vim-gitgutter'

"" Parenthetical editing
Plug 'tpope/vim-surround'

"" Pair-wise mappings
Plug 'tpope/vim-unimpaired'

"" Undo tree
Plug 'vim-scripts/Gundo'

"" Dash
Plug 'rizzatti/dash.vim'

"" Github
Plug 'mattn/gist-vim'
""requires
Plug 'mattn/webapi-vim'

"" Ansible
Plug 'pearofducks/ansible-vim'

"" Haskell
Plug 'neovimhaskell/haskell-vim'
Plug 'eagletmt/ghcmod-vim'
Plug 'ndmitchell/ghcid', { 'rtp': 'plugins/nvim' }

"" Markdown
Plug 'suan/vim-instant-markdown'

"" Live coding
Plug 'metakirby5/codi.vim'

"" Terraform
Plug 'hashivim/vim-terraform'


"" Typescript
Plug 'leafgarland/typescript-vim'

"" Local RC
Plug 'embear/vim-localvimrc'

"" HTML
" Matches HTML tags
Plug 'Valloric/MatchTagAlways'


call plug#end()
" Stupid fix because nvim is getting <BS> for C-h
" due to terminfo issues
if has('nvim')
    nmap <BS> :TmuxNavigateLeft<cr>
endif

""""""""""""""""""""
" General settings "
""""""""""""""""""""


set nobackup
set noswapfile
set number
set relativenumber
set noexrc
set nowrap
set tildeop
set history=1000
set ruler
set laststatus=2
set hidden


set nottimeout " Don't wait for a byte sequence

" Tab and shift
set incsearch
set expandtab
set softtabstop=4
set shiftwidth=4
set tabstop=4
set smarttab

"Set split preference
set splitright
set splitbelow

" Searching
set hlsearch
set gdefault
set ignorecase
set infercase
set smartcase
nnoremap / /\v
vnoremap / /\v

" Window Height, taken from Destroy All Software
set winwidth=84
" We have to have a winheight bigger than we want to set winminheight. But if
" we set winheight to be huge before winminheight, the winminheight set will
" fail.
set winheight=10
set winminheight=10
set winheight=999

" From Damian Conway's OSCON talk
"http://www.youtube.com/watch?v= Hm36-na4-4
"
exec "set listchars=tab:\uBB\uA0,trail:\uB7"
set list

highlight ColorColumn ctermbg=red
call matchadd('ColorColumn', '\%82v', 100)


" Colorscheme
if (has("termguicolors"))
 set termguicolors
endif

colorscheme OceanicNext



""""""""""
" REMAPS "
""""""""""
nmap , \

" Normal mode
nnoremap <CR> :noh<CR>
nnoremap <space> :
nnoremap Y y$
nnoremap <leader>ss :%s/\v\s+$//<cr><C-o>:noh<cr>
noremap ;; :%s:\v::<Left><Left>
noremap ;l :%s:::<Left>
nnoremap <leader><leader> <C-^>
nnoremap <leader>s :w<CR>

" Visual mode
vmap > >gv
vmap < <gv
vmap <silent> <leader>[ :w !tmux load-buffer -<CR><CR>

" Insert mode
inoremap jj <esc>


""""""""""""""""""""""""""""""""""""""""""
" OPEN FILES IN DIRECTORY OF CURRENT FILE"
""""""""""""""""""""""""""""""""""""""""""
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e :edit %%
map <leader>n :new %%
map <leader>v :view %%

"""""""""""""""""""""""
" PLUG-IN CONFIGURATION
"""""""""""""""""""""""

" Vimtux
vmap <leader>st <Plug>SendSelectionToTmux
map <leader>sr <Plug>SetTmuxVars

" Ag
nnoremap <leader>ag :exec("Ag! '\\b".expand("<cword>")."\\b'")<CR>

"" Ctrl-P
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
      \ --ignore .git
      \ --ignore .DS_Store
      \ -g ""'

let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }

nnoremap <leader>p :CtrlPBuffer<cr>

" Dash
nmap <silent> <leader>d <Plug>DashSearch
let g:dash_map = {  'haskell' : ['snapboard', 'haskell'] }


"" NERD Tree
map <F3> :NERDTreeFind<CR>

" Fugitive
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gs :Gstatus<cr>

""""""""""""
" FILETYPE "
""""""""""""

" Haskell
au FileType haskell nmap <leader>sh :%!stylish-haskell<CR>

" TypeScript
autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript

" Ruby
autocmd! Filetype ruby autocmd! BufWritePost * Neomake
autocmd Filetype ruby setlocal softtabstop=2 shiftwidth=2 tabstop=2

" Javascript
autocmd! Filetype javascript autocmd! BufWritePost * Neomake

" HTML
autocmd! Filetype html autocmd! BufWritePost * Neomake
"""""""""""""
" FANCINESS "
"""""""""""""



" Find and replace with Ag

function! AgFindReplace()
    let find = input('Find: ')
    let replace = input('Replacement: ')
    exec "Ag! '\\b" . find . "\\b'"
    exec "Cdo s:" . find . ":" . replace
    Cdo write
    cclose
endfunction
map <leader>gr :call AgFindReplace()<cr>



let g:codi#interpreters = {
		   \ 'haskell': {
		       \ 'bin': '/Users/lsep/.nix-profile/bin/ghci',
		       \ 'prompt': '^> ',
		       \ },
		   \ }

