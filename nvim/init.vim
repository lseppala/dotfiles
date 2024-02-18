if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.config/nvim/plugged')

"" Processes
Plug 'Shougo/vimproc.vim', { 'do': 'make' }

" Fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Async build
Plug 'neomake/neomake'
Plug 'tpope/vim-dispatch'
Plug 'skywind3000/asyncrun.vim'
Plug 'janko-m/vim-test'

" tmux
Plug 'christoomey/vim-tmux-navigator'
Plug 'lord-garbage/vimtux'

"" Colorschemes
Plug 'mhartington/oceanic-next'
Plug 'romainl/flattened'
Plug 'junegunn/seoul256.vim'
Plug 'arcticicestudio/nord-vim' " https://www.nordtheme.com
Plug 'jonathanfilip/vim-lucius' " https://twitter.com/garybernhardt/status/1298307925861994497
Plug 'artanikin/vim-synthwave84'
Plug 'folke/tokyonight.nvim'

"" Auto-commenting
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-commentary'

"" File navigation
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeFind' }
"Plug 'kien/ctrlp.vim'
"Plug 'FelikZ/ctrlp-py-matcher'
"Plug 'rking/ag.vim'

" Find and replace
Plug 'mhinz/vim-grepper'

" Editing
" Auto-complete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'github/copilot.vim'

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
Plug 'tpope/vim-rhubarb'
Plug 'gregsexton/gitv'
Plug 'airblade/vim-gitgutter'

"" Parenthetical editing
Plug 'tpope/vim-surround'

"" Pair-wise mappings
Plug 'tpope/vim-unimpaired'

"" Undo tree
Plug 'simnalamburt/vim-mundo'

"" Dash
Plug 'rizzatti/dash.vim'

"" Github
Plug 'mattn/gist-vim'
Plug 'pwntester/octo.nvim'

""requires
Plug 'mattn/webapi-vim'

"" Ansible
Plug 'pearofducks/ansible-vim'

Plug 'rodjek/vim-puppet'

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
Plug 'google/vim-jsonnet'

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
Plug 'sebdah/vim-delve', { 'for': 'go'}
"" requires gocode executable. go get -u github.com/stamblerre/gocode
"Plug 'deoplete-plugins/deoplete-go', { 'do': 'make' }

"" Distraction-free writing
Plug 'junegunn/goyo.vim'

" Plugin for hard and soft wrapping
" https://github.com/reedes/vim-pencil
Plug 'reedes/vim-pencil'

" UNIX shell commands
Plug 'tpope/vim-eunuch'

" auto-close and pair parens, brackets, etc
"Plug 'jiangmiao/auto-pairs'

" Scratch buffer
Plug 'mtth/scratch.vim'

" Quake-style terminal window
Plug 'Lenovsky/nuake'

" Wrapper around terminal functions
Plug 'kassio/neoterm'

" Auto layout
"
"Plug 'zhaocai/GoldenView.Vim'
"
" Split resize mode
Plug 'simeji/winresizer'

" Generate JsDoc from function signature with :JsDoc
Plug 'heavenshell/vim-jsdoc', {
  \ 'for': ['javascript', 'javascript.jsx','typescript'], 
  \ 'do': 'make install'
\}


" Vimwiki

"Plug 'vimwiki/vimwiki'

" Drawing boxes
Plug 'gyim/vim-boxdraw'

" Devicons
Plug 'kyazdani42/nvim-web-devicons'

" Fuzzy finder
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Search and jump anywhere on the screen (in buffer, between splits, etc)
Plug 'ggandor/leap.nvim'

"lua require('leap').add_default_mappings()





call plug#end()


""""""""""""""""""""
" General settings "
""""""""""""""""""""

" Stupid fix because nvim is getting <BS> for C-h
" due to terminfo issues
if has('nvim')
    nmap <BS> :TmuxNavigateLeft<cr>
	lua require('leap').add_default_mappings()
endif


set nobackup
set noswapfile
set number
"set relativenumber
set noexrc
set nowrap
set tildeop
set history=1000
set ruler
set laststatus=2
set hidden

" Do not redraw screen in the middle of a macro. Makes them complete faster.
set lazyredraw

set undofile "Persistent undo


set nottimeout " Don't wait for a byte sequence

" Tab and shift
set incsearch
set noexpandtab
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

"colorscheme OceanicNext
"colorscheme flattened_dark
"colorscheme nord
"colorscheme synthwave84
"let g:lucius_contrast="high"
"colorscheme lucius
colorscheme tokyonight-night

set clipboard+=unnamedplus
" disable mouse
set mouse=
" enable mouse in normal, insert, and command line modes
"set mouse=nic


""""""""""
" REMAPS "
""""""""""
" Normal mode
nnoremap <CR> :noh<CR>
nnoremap <space><tab> <C-^>
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
nnoremap <leader>ag :exec("Rg \\b".expand("<cword>")."\\b")<CR>


" Python

"let g:python2_host_prog = '/usr/local/bin/python'
if filereadable('/usr/local/bin/python3')
	let g:python3_host_prog = '/usr/local/bin/python3'
end

"" Ctrl-P
"let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
      "\ --ignore .git
      "\ --ignore .DS_Store
      "\ -g ""'

"let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }

"nnoremap <leader>p :CtrlPBuffer<cr>

" fzf
nnoremap <C-p> :Files<CR>
nnoremap <leader>p :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>rg :exec("Rg \\b".expand("<cword>")."\\b")<CR>

" Dash
nmap <silent> <leader>d <Plug>DashSearch
let g:dash_map = {  'haskell' : ['snapboard', 'haskell'] }


"" NERD Tree
map <F3> :NERDTreeFind<CR>

" Fugitive
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gs :Gstatus<cr>

" Nuake
nnoremap <F5> :Nuake<CR>
inoremap <F5> <C-\><C-n>:Nuake<CR>
tnoremap <F5> <C-\><C-n>:Nuake<CR>

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
let test#strategy = "neoterm"
let g:neoterm_default_mod = "botright 30"
let g:neoterm_autoscroll = 1

nmap <silent> <leader>tt :TestNearest<CR>
nmap <silent> <leader>tf :TestFile<CR>
nmap <silent> <leader>ts :TestSuite<CR>
nmap <silent> <leader>td :TestLast<CR>
nmap <silent> <leader>tg :TestVisit<CR>

function! DebugNearest()
  let g:test#go#runner = 'delve'
  TestNearest
  unlet g:test#go#runner
endfunction
nmap <silent> <leader>t<C-d> :call DebugNearest()<CR>

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

" scratch.vim
let g:scratch_persistence_file = '.scratch.vim'

let g:scratch_no_mappings = 1
nmap <leader>gs <plug>(scratch-insert-reuse)
nmap <leader>gS <plug>(scratch-insert-clear)
xmap <leader>gs <plug>(scratch-selection-reuse)
xmap <leader>gS <plug>(scratch-selection-clear)

" vim-pencil
let g:pencil#textwidth = 74

""""""""""""
" FILETYPE "
""""""""""""

" Generate ctags on save
" autocmd BufWritePost * call atags#generate()

" Haskell
au FileType haskell nmap <leader>sh :%!stylish-haskell<CR>

" TypeScript
autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript
autocmd Filetype typescript setlocal expandtab softtabstop=2 shiftwidth=2 tabstop=2

" Ruby
autocmd! Filetype ruby autocmd! BufWritePost * Neomake
autocmd Filetype ruby setlocal softtabstop=2 shiftwidth=2 tabstop=2

" Javascript
"autocmd! Filetype javascript autocmd! BufWritePre * Neoformat

" Markdown
"autocmd! Filetype markdown autocmd! BufWritePre * Neoformat

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
    exec "Grepper -tool rg '" . find . "'"
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
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l


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

" GoldenView config
"let g:goldenview__enable_default_mapping = 0
"nmap <silent> <C-S> <Plug>GoldenViewSplit
"nmap <silent> <C-M> <Plug>GoldenViewSwitchMain
"nmap <silent> <C-N>  <Plug>GoldenViewNext
"nmap <silent> <C-P>  <Plug>GoldenViewPrevious

 "autocmd FileType vista,vista_kind nnoremap <buffer> <silent> / :<c-u>call vista#finder#fzf#Run()<CR>

" -------------------------------------------------------------------------------------------------
" coc.nvim default settings
" -------------------------------------------------------------------------------------------------
"
let g:coc_global_extensions = [
	\'coc-json',
	\'coc-snippets',
	\'coc-highlight',
	\'coc-styled-components',
	\'coc-tsserver',
	\'coc-solargraph',
	\]


" Better display for messages
set cmdheight=2
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes:2

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

function! CheckBackspace() abort
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

" Use <leader>k to show documentation in preview window
nnoremap <silent> <localleader>k :call CocAction('doHover')<CR>

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>rr <Plug>(coc-refactor)

" take an action under cursor
nmap <leader>do <Plug>(coc-codeaction)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format)
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
