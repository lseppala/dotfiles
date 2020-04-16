if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.config/nvim/plugged')

" Processes
Plug 'Shougo/vimproc.vim', { 'do': 'make' }

" Fuzzy finder
Plug '/usr/local/opt/fzf'

" Async build
Plug 'neomake/neomake', { 'on': 'Neomake' }
Plug 'tpope/vim-dispatch'
Plug 'skywind3000/asyncrun.vim'
Plug 'janko-m/vim-test'

" tmux
Plug 'christoomey/vim-tmux-navigator'
Plug 'lord-garbage/vimtux'

"" Colorschemes
Plug 'morhetz/gruvbox'
Plug 'mhartington/oceanic-next'
Plug 'romainl/flattened'
Plug 'junegunn/seoul256.vim'

"" Auto-commenting
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-commentary'

"" File navigation
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeFind' }
Plug 'kien/ctrlp.vim'
Plug 'FelikZ/ctrlp-py-matcher'
Plug 'rking/ag.vim'

"" Editing
"" Auto-complete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"" Tag List
Plug 'liuchengxu/vista.vim'

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
Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }
Plug 'eagletmt/ghcmod-vim', { 'for': 'haskell' }
Plug 'ndmitchell/ghcid', { 'for': 'haskell', 'rtp': 'plugins/nvim' }

"" Markdown
"Plug 'suan/vim-instant-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

"" Live coding
Plug 'metakirby5/codi.vim'


" File types
Plug 'sheerun/vim-polyglot'

"" Terraform
"Plug 'hashivim/vim-terraform'


"" Typescript
"Plug 'leafgarland/typescript-vim'

"" Local RC
Plug 'embear/vim-localvimrc'

"" HTML
" Matches HTML tags
Plug 'Valloric/MatchTagAlways', { 'for': ['html', 'javascript.jsx', 'typescript.tsx'] }
" Auto-closes tags
Plug 'alvan/vim-closetag', { 'for': ['html', 'javascript.jsx', 'typescript.tsx'] }

"" Aligning
Plug 'godlygeek/tabular', { 'on': 'Tabularize' }
Plug 'junegunn/vim-easy-align'

"" Code Formatting
"Plug 'w0rp/ale'
Plug 'sbdchd/neoformat'

"" Snippets
"Plug 'Shougo/neosnippet.vim'
"Plug 'Shougo/neosnippet-snippets'
"Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'
"" CTags
Plug 'fntlnz/atags.vim'

"" Perl
Plug 'vim-perl/vim-perl', { 'for': 'perl' }

"" Go
Plug 'fatih/vim-go', { 'for': 'go', 'do': ':GoUpdateBinaries' }
"" requires gocode executable. go get -u github.com/stamblerre/gocode
"Plug 'deoplete-plugins/deoplete-go', { 'do': 'make' }

"" Distraction-free writing
Plug 'junegunn/goyo.vim'

" UNIX shell commands
Plug 'tpope/vim-eunuch'

" auto-close and pair parens, brackets, etc
"Plug 'jiangmiao/auto-pairs'

" Scratch buffer
Plug 'mtth/scratch.vim'

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
"set winheight=10
"set winminheight=10
"set winheight=999

" From Damian Conway's OSCON talk
"http://www.youtube.com/watch?v= Hm36-na4-4
"
set listchars=tab:▎\ ,trail:·
"exec "set listchars=tab:\uBB\uA0,trail:\uB7"
set list

highlight ColorColumn ctermbg=red
call matchadd('ColorColumn', '\%82v', 100)


" Colorscheme
if (has("termguicolors"))
 set termguicolors
endif

colorscheme flattened_light

set clipboard+=unnamedplus


""""""""""
" REMAPS "
""""""""""
" Normal mode
nnoremap <CR> :noh<CR>
nnoremap <space> :
nnoremap Y y$
nnoremap <leader>ss :%s/\v\s+$//<cr><C-o>:noh<cr>
noremap ;; :%s:\v::<Left><Left>
noremap ;l :%s:::<Left>
nnoremap <leader><leader> <C-^>
nnoremap ;w :w<CR>
nnoremap ;q :wq<CR>

" Visual mode
vmap > >gv
vmap < <gv
vmap <silent> <leader>[ :w !tmux load-buffer -<CR><CR>

" Insert mode
inoremap jj <esc>
inoremap ;; ;<esc>
inoremap <leader>w <C-o>:w<CR>


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


" Python

let g:python2_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

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


"" vim-easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


" Local vimrc
let g:localvimrc_persistent=1


" only build tags for files not in .gitignore
let g:atags_build_commands_list = [
    \ 'ag -g "" | ctags -L - --fields=+l -f tags.tmp',
    \ 'awk "length($0) < 400" tags.tmp > tags',
    \ 'rm tags.tmp'
    \ ]

" vim-test
let test#strategy = "dispatch"

nmap <silent> <leader>tt :TestFile<CR>
nmap <silent> <leader>td :TestLast<CR>
nmap <silent> <leader>tg :TestVisit<CR>


" MatchTagAlways
let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'jinja' : 1,
    \ 'javascript.jsx' : 1,
    \ 'typescript.tsx' : 1,
    \}

" autoclose
let g:closetag_emptyTags_caseSensitive = 1
"" close tags in jsx/tsx files
let g:closetag_regions =  {
\ 'typescript.tsx': 'jsxRegion,tsxRegion',
\ 'javascript.jsx': 'jsxRegion',
\ }

""""""""""""
" FILETYPE "
""""""""""""

" Generate ctags on save
" autocmd BufWritePost * call atags#generate()

" Haskell
au FileType haskell nmap <leader>sh :%!stylish-haskell<CR>

" TypeScript
autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript

" Ruby
autocmd! Filetype ruby autocmd! BufWritePost * Neomake
autocmd Filetype ruby setlocal softtabstop=2 shiftwidth=2 tabstop=2

" Javascript
autocmd! Filetype javascript autocmd! BufWritePre * Neoformat

" Perl
autocmd! Filetype perl autocmd! BufWritePost * Neomake
autocmd! Filetype perl setlocal keywordprg=:sp\ \|\ :te\ perldoc
autocmd Filetype perl setlocal noexpandtab
let perl_sub_signatures = 1

" HTML
autocmd! Filetype html autocmd! BufWritePost * Neomake

"YAML
autocmd Filetype yaml setlocal softtabstop=2 shiftwidth=2 tabstop=2 expandtab
autocmd Filetype ansible setlocal softtabstop=2 shiftwidth=2 tabstop=2 expandtab nosmartindent

" Golang
autocmd! Filetype go autocmd! BufWritePost * Neomake
autocmd! Filetype go setlocal keywordprg=:GoDoc
let g:go_auto_type_info = 1
let g:go_fmt_command = "goimports"


" React Javscript & Typescript fixes for coc-tsserver
autocmd BufRead,BufNewFile *.jsx set filetype=javascript.jsx
autocmd BufRead,BufNewFile *.tsx set filetype=typescript.tsx

"""""""""""""
" FANCINESS "
"""""""""""""


" Find and replace with Ag

function! AgFindReplace()
    let find = input('Find: ')
    let replace = input('Replacement: ')
    exec "Ag! '" . find . "'"
    exec "Cdo s:" . find . ":" . replace
    Cdo write
    cclose
endfunction
map <leader>gr :call AgFindReplace()<cr>

"let g:deoplete#enable_at_startup = 1
" deoplete tab-complete
"inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

let g:codi#interpreters = {
		   \ 'haskell': {
		       \ 'bin': '/Users/lsep/.nix-profile/bin/ghci',
		       \ 'prompt': '^> ',
		       \ },
		   \ }


"naviation in terminal windows
tnoremap <C-h> <C-\><C-n><C-h>
tnoremap <C-j> <C-\><C-n><C-j>
tnoremap <C-k> <C-\><C-n><C-k>
tnoremap <C-l> <C-\><C-n><C-l>


" neosnippet mappings
"imap <C-f>     <Plug>(neosnippet_expand_or_jump)
"smap <C-f>     <Plug>(neosnippet_expand_or_jump)
"xmap <C-f>     <Plug>(neosnippet_expand_target)
imap <C-f>     <C-y>
smap <C-f>     <C-y>
xmap <C-f>     <C-y>

" Vista config
let g:vista_default_executive = 'coc'
map <F2> :Vista<CR>
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_fzf_preview = ['right:50%']

 "autocmd FileType vista,vista_kind nnoremap <buffer> <silent> / :<c-u>call vista#finder#fzf#Run()<CR>

" -------------------------------------------------------------------------------------------------
" coc.nvim default settings
" -------------------------------------------------------------------------------------------------
"
let g:coc_global_extensions = ['coc-json', 'coc-snippets']

" Better display for messages
set cmdheight=2
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> ge <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> <localleader>k :call CocAction('doHover')<CR>

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>rr <Plug>(coc-refactor)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" Show all diagnostics
nnoremap <silent> <leader><space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <leader><space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <leader><space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <leader><space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <leader><space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
"nnoremap <silent> <leader><space>j  :<C-u>CocNext<CR>
"" Do default action for previous item.
"nnoremap <silent> <leader><space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <leader><space>p  :<C-u>CocListResume<CR>

" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0

" Show signature help on placeholder jump
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
