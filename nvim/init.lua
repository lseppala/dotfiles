
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Plugin setup
require("lazy").setup({

  -- Processes
  { "Shougo/vimproc.vim", build = "make" },

  -- Fuzzy finder
  { "junegunn/fzf", build = function() vim.fn['fzf#install']() end },
  "junegunn/fzf.vim",

  -- Async build
  "neomake/neomake",
  "tpope/vim-dispatch",
  "skywind3000/asyncrun.vim",
  "janko-m/vim-test",

  -- tmux
  "christoomey/vim-tmux-navigator",
  "lord-garbage/vimtux",

  -- Colorschemes
  "mhartington/oceanic-next",
  "romainl/flattened",
  "junegunn/seoul256.vim",
  "arcticicestudio/nord-vim",
  "jonathanfilip/vim-lucius",
  "artanikin/vim-synthwave84",
  "folke/tokyonight.nvim",

  -- Auto-commenting
  "scrooloose/nerdcommenter",
  "tpope/vim-commentary",

  -- File navigation
  { "scrooloose/nerdtree", cmd = "NERDTreeFind" },
  "nvim-treesitter/nvim-treesitter-context",
  "stevearc/oil.nvim",

  -- Find and replace
  "mhinz/vim-grepper",

  -- Editing
  -- Auto-complete
  { "Shougo/deoplete.nvim", build = ":UpdateRemotePlugins" },
  { "neoclide/coc.nvim", branch = "release" },
  "github/copilot.vim",

  -- Tag List
  "liuchengxu/vista.vim",

  -- C-do
  "Peeja/vim-cdo",

  -- Repeat commands
  "tpope/vim-repeat",

  -- Smart replacing
  "tpope/vim-abolish",

  -- Git
  "tpope/vim-fugitive",
  "tpope/vim-rhubarb",
  "gregsexton/gitv",
  "airblade/vim-gitgutter",

  -- Parenthetical editing
  "tpope/vim-surround",

  -- Pair-wise mappings
  "tpope/vim-unimpaired",

  -- Undo tree
  "simnalamburt/vim-mundo",

  -- Dash
  "rizzatti/dash.vim",

  -- Github
  "mattn/gist-vim",
  "pwntester/octo.nvim",

  -- requires
  "mattn/webapi-vim",

  -- Ansible
  "pearofducks/ansible-vim",
  "rodjek/vim-puppet",

  -- Haskell
  { "neovimhaskell/haskell-vim", ft = "haskell" },
  { "eagletmt/ghcmod-vim", ft = "haskell" },
  { 
    "ndmitchell/ghcid", 
    ft = "haskell", 
    config = function()
      vim.opt.rtp:append(vim.fn.stdpath("data") .. "/lazy/ghcid/plugins/nvim")
    end
  },

  -- Markdown
  { "iamcco/markdown-preview.nvim", build = "cd app & yarn install" },

  -- Live coding
  "metakirby5/codi.vim",

  -- File types
  "sheerun/vim-polyglot",
  "google/vim-jsonnet",

  -- Local RC
  "embear/vim-localvimrc",

  -- HTML
  -- Matches HTML tags
  { "Valloric/MatchTagAlways", ft = { "html", "javascript.jsx", "typescript.tsx" } },
  -- Auto-closes tags
  { "alvan/vim-closetag", ft = { "html", "javascript.jsx", "typescript.tsx" } },

  "AndrewRadev/deleft.vim",

  -- Aligning
  { "godlygeek/tabular", cmd = "Tabularize" },
  "junegunn/vim-easy-align",

  -- Code Formatting
  "sbdchd/neoformat",

  -- CTags
  "fntlnz/atags.vim",

  -- Perl
  { "vim-perl/vim-perl", ft = "perl" },

  -- Go
  { "fatih/vim-go", ft = "go", build = ":GoUpdateBinaries" },
  { "sebdah/vim-delve", ft = "go" },

  -- Distraction-free writing
  "junegunn/goyo.vim",

  -- Plugin for hard and soft wrapping
  "reedes/vim-pencil",

  -- UNIX shell commands
  "tpope/vim-eunuch",

  -- Scratch buffer
  "mtth/scratch.vim",

  -- Quake-style terminal window
  "Lenovsky/nuake",

  -- Wrapper around terminal functions
  "kassio/neoterm",

  -- Split resize mode
  "simeji/winresizer",

  -- Generate JsDoc from function signature with :JsDoc
  {
    "heavenshell/vim-jsdoc",
    ft = { "javascript", "javascript.jsx", "typescript" },
    build = "make install"
  },

  -- Drawing boxes
  "gyim/vim-boxdraw",

  -- Devicons
  "kyazdani42/nvim-web-devicons",

  -- Fuzzy finder
  "nvim-lua/plenary.nvim",
  "nvim-telescope/telescope.nvim",

  -- Search and jump anywhere on the screen
  "ggandor/leap.nvim",

  -- Errors and diagnostics
  "folke/trouble.nvim",

  -- Viewing nvim startup time files generated with --startuptime <filename>
  "dstein64/vim-startuptime",

  -- Plugin for getting PR under cursor
  "lseppala/praise.nvim",
})

-- General settings
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.exrc = false
vim.opt.wrap = false
vim.opt.tildeop = true
vim.opt.history = 1000
vim.opt.ruler = true
vim.opt.laststatus = 2
vim.opt.hidden = true
vim.opt.lazyredraw = true -- Do not redraw screen in the middle of a macro
vim.opt.undofile = true -- Persistent undo
vim.opt.timeout = false -- Don't wait for a byte sequence

-- Tab and shift
vim.opt.incsearch = true
vim.opt.expandtab = false
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.smarttab = true

-- Set split preference
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Searching
vim.opt.hlsearch = true
vim.opt.gdefault = true
vim.opt.ignorecase = true
vim.opt.infercase = true
vim.opt.smartcase = true

-- List characters
vim.opt.listchars = { tab = '▎ ', trail = '·' }
vim.opt.list = true

-- Set highlight group
vim.api.nvim_set_hl(0, 'ColorColumn', { ctermbg = 'red' })

-- Add match (still need to use vim.fn for matchadd)
vim.fn.matchadd('ColorColumn', '\\%82v', 100)

-- Colorscheme
vim.opt.termguicolors = true
vim.cmd('colorscheme tokyonight-night')

vim.opt.clipboard:append('unnamedplus')
vim.opt.mouse = '' -- disable mouse
vim.opt.conceallevel = 0 -- don't hide any text

-- Window settings
vim.opt.winwidth = 84

-- Nvim-specific setup
if vim.fn.has('nvim') == 1 then
  require('leap').add_default_mappings()
  require('oil').setup()
end

-- Praise setup
require('praise').setup({ keymap = '<leader>pr' })

-- Browse command
vim.api.nvim_create_user_command(
  'Browse',
  function(opts)
    vim.fn.system({ 'open', opts.fargs[1] })
  end,
  { nargs = 1 }
)

-- Key mappings
local keymap = vim.keymap.set

-- Normal mode
keymap('n', '<BS>', ':TmuxNavigateLeft<CR>', { noremap = true })
keymap('n', '<CR>', ':noh<CR>', { noremap = true })
keymap('n', '<space><tab>', '<C-^>', { noremap = true })
keymap('n', '<space>', ':', { noremap = true })
keymap('n', 'Y', 'y$', { noremap = true })
keymap('n', '<leader>ss', ':%s/\\v\\s+$//<CR><C-o>:noh<CR>', { noremap = true })
keymap('n', ';;', ':%s:\\v::<Left><Left>', { noremap = true })
keymap('n', ';l', ':%s:::<Left>', { noremap = true })
keymap('n', '<leader><leader>', '<C-^>', { noremap = true })
keymap('n', ';w', ':w<CR>', { noremap = true })
keymap('n', ';q', ':wq<CR>', { noremap = true })

-- Visual mode
keymap('v', ';;', ':s:\\v::<Left><Left>', { noremap = true })
keymap('v', ';l', ':s:::<Left>', { noremap = true })
keymap('v', '>', '>gv')
keymap('v', '<', '<gv')
keymap('v', '<leader>[', ':w !tmux load-buffer -<CR><CR>', { silent = true })

-- Insert mode
keymap('i', 'jj', '<esc>', { noremap = true })
keymap('i', ';;', ';<esc>', { noremap = true })
keymap('i', '<leader>w', '<C-o>:w<CR>', { noremap = true })

-- Search mappings
keymap('n', '/', '/\\v', { noremap = true })
keymap('v', '/', '/\\v', { noremap = true })

-- Open files in directory of current file
vim.cmd([[
cnoremap %% <C-R>=expand('%:h').'/'<cr>
]])
keymap('n', '<leader>e', ':edit %%')
keymap('n', '<leader>n', ':new %%')
keymap('n', '<leader>v', ':view %%')

-- Plugin-specific configurations

-- Vimtux
keymap('v', '<leader>st', '<Plug>SendSelectionToTmux')
keymap('n', '<leader>sr', '<Plug>SetTmuxVars')

-- Ag/Rg
keymap('n', '<leader>ag', ':exec("Rg \\\\b".expand("<cword>")."\\\\b")<CR>', { noremap = true })

-- Python host programs
local uname = vim.fn.system("uname -m"):gsub("%s+", "")
if uname == "arm64" then
  vim.g.python2_host_prog = '/opt/homebrew/bin/python'
  vim.g.python3_host_prog = '/opt/homebrew/bin/python3'
else
  vim.g.python2_host_prog = '/usr/local/bin/python'
  vim.g.python3_host_prog = '/usr/local/bin/python3'
end

-- fzf
keymap('n', '<C-p>', ':Files<CR>', { noremap = true })
keymap('n', '<leader>p', ':Files<CR>', { noremap = true })
keymap('n', '<leader>b', ':Buffers<CR>', { noremap = true })
keymap('n', '<leader>rg', ':exec("Rg \\\\b".expand("<cword>")."\\\\b")<CR>', { noremap = true })

-- Dash
keymap('n', '<leader>d', '<Plug>DashSearch', { silent = true })
vim.g.dash_map = { haskell = { 'snapboard', 'haskell' } }

-- NERD Tree
keymap('n', '<F3>', ':NERDTreeFind<CR>')

-- Fugitive
keymap('n', '<leader>gd', ':Gdiff<CR>', { noremap = true })
keymap('n', '<leader>gs', ':Gstatus<CR>', { noremap = true })
keymap('v', '<leader>gb', ':GBrowse!<CR>', { noremap = true })

-- Nuake
keymap('n', '<F5>', ':Nuake<CR>', { noremap = true })
keymap('i', '<F5>', '<C-\\><C-n>:Nuake<CR>', { noremap = true })
keymap('t', '<F5>', '<C-\\><C-n>:Nuake<CR>', { noremap = true })

-- vim-easy-align
keymap('x', 'ga', '<Plug>(EasyAlign)')
keymap('n', 'ga', '<Plug>(EasyAlign)')

-- Local vimrc
vim.g.localvimrc_persistent = 1

-- atags build commands
vim.g.atags_build_commands_list = {
  'ag -g "" | ctags -L - --fields=+l -f tags.tmp',
  'awk "length($0) < 400" tags.tmp > tags',
  'rm tags.tmp'
}

-- vim-test
vim.g['test#strategy'] = "neoterm"
vim.g.neoterm_default_mod = "botright 30"
vim.g.neoterm_autoscroll = 1

keymap('n', '<leader>tt', ':TestNearest<CR>', { silent = true, noremap = true })
keymap('n', '<leader>tf', ':TestFile<CR>', { silent = true, noremap = true })
keymap('n', '<leader>ts', ':TestSuite<CR>', { silent = true, noremap = true })
keymap('n', '<leader>td', ':TestLast<CR>', { silent = true, noremap = true })
keymap('n', '<leader>tg', ':TestVisit<CR>', { silent = true, noremap = true })

-- Debug function
local function debug_nearest()
  vim.g['test#go#runner'] = 'delve'
  vim.cmd('TestNearest')
  vim.g['test#go#runner'] = nil
end

keymap('n', '<leader>t<C-d>', debug_nearest, { silent = true, noremap = true })

-- MatchTagAlways
vim.g.mta_filetypes = {
  html = 1,
  xhtml = 1,
  xml = 1,
  jinja = 1,
  ['javascript.jsx'] = 1,
  ['typescript.tsx'] = 1,
}

-- autoclose
vim.g.closetag_emptyTags_caseSensitive = 1
vim.g.closetag_regions = {
  ['typescript.tsx'] = 'jsxRegion,tsxRegion',
  ['javascript.jsx'] = 'jsxRegion',
}

-- scratch.vim
vim.g.scratch_persistence_file = '.scratch.vim'
vim.g.scratch_no_mappings = 1

keymap('n', '<leader>gs', '<plug>(scratch-insert-reuse)', { noremap = true })
keymap('n', '<leader>gS', '<plug>(scratch-insert-clear)', { noremap = true })
keymap('x', '<leader>gs', '<plug>(scratch-selection-reuse)', { noremap = true })
keymap('x', '<leader>gS', '<plug>(scratch-selection-clear)', { noremap = true })

-- vim-pencil
vim.g['pencil#textwidth'] = 74
vim.g['pencil#wrapModeDefault'] = 'soft'

-- Auto commands
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Pencil autogroup
local pencil_group = augroup('pencil', { clear = true })
autocmd('FileType', {
  group = pencil_group,
  pattern = { 'markdown', 'mkd' },
  callback = function()
    vim.fn['pencil#init']()
  end
})
autocmd('FileType', {
  group = pencil_group,
  pattern = 'text',
  callback = function()
    vim.fn['pencil#init']()
  end
})

-- Filetype configurations

-- Haskell
autocmd('FileType', {
  pattern = 'haskell',
  callback = function()
    keymap('n', '<leader>sh', ':%!stylish-haskell<CR>', { buffer = true, noremap = true })
  end
})

-- TypeScript
autocmd({ 'BufNewFile', 'BufRead' }, {
  pattern = '*.ts',
  callback = function()
    vim.bo.filetype = 'typescript'
  end
})
autocmd('FileType', {
  pattern = 'typescript',
  callback = function()
    vim.bo.expandtab = true
    vim.bo.softtabstop = 2
    vim.bo.shiftwidth = 2
    vim.bo.tabstop = 2
  end
})

-- Ruby
autocmd('FileType', {
  pattern = 'ruby',
  callback = function()
    autocmd('BufWritePost', {
      buffer = 0,
      command = 'Neomake'
    })
    vim.bo.softtabstop = 2
    vim.bo.shiftwidth = 2
    vim.bo.tabstop = 2
  end
})

-- Perl
autocmd('FileType', {
  pattern = 'perl',
  callback = function()
    autocmd('BufWritePost', {
      buffer = 0,
      command = 'Neomake'
    })
    vim.bo.keywordprg = ':sp | :te perldoc'
    vim.bo.expandtab = false
  end
})
vim.g.perl_sub_signatures = 1

-- HTML
autocmd('FileType', {
  pattern = 'html',
  callback = function()
    autocmd('BufWritePost', {
      buffer = 0,
      command = 'Neomake'
    })
  end
})

-- YAML
autocmd('FileType', {
  pattern = 'yaml',
  callback = function()
    vim.bo.softtabstop = 2
    vim.bo.shiftwidth = 2
    vim.bo.tabstop = 2
    vim.bo.expandtab = true
  end
})

autocmd('FileType', {
  pattern = 'ansible',
  callback = function()
    vim.bo.softtabstop = 2
    vim.bo.shiftwidth = 2
    vim.bo.tabstop = 2
    vim.bo.expandtab = true
    vim.bo.smartindent = false
  end
})

-- Golang
autocmd('FileType', {
  pattern = 'go',
  callback = function()
    autocmd('BufWritePost', {
      buffer = 0,
      command = 'Neomake'
    })
    vim.bo.keywordprg = ':GoDoc'
  end
})
vim.g.go_auto_type_info = 1
vim.g.go_fmt_command = "goimports"

-- React JavaScript & TypeScript fixes for coc-tsserver
autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = '*.jsx',
  callback = function()
    vim.bo.filetype = 'javascript.jsx'
  end
})
autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = '*.tsx',
  callback = function()
    vim.bo.filetype = 'typescript.tsx'
  end
})

-- Find and replace with Ag function
local function ag_find_replace()
  local find = vim.fn.input('Find: ')
  local replace = vim.fn.input('Replacement: ')
  vim.cmd("Grepper -tool rg '" .. find .. "'")
  vim.cmd("Cdo s:" .. find .. ":" .. replace)
  vim.cmd("Cdo write")
  vim.cmd("cclose")
end

keymap('n', '<leader>gr', ag_find_replace)

-- Codi interpreters
vim.g['codi#interpreters'] = {
  haskell = {
    bin = '/Users/lsep/.nix-profile/bin/ghci',
    prompt = '^> ',
  },
}

-- Navigation in terminal windows
keymap('t', '<C-h>', '<C-\\><C-n><C-w>h', { noremap = true })
keymap('t', '<C-j>', '<C-\\><C-n><C-w>j', { noremap = true })
keymap('t', '<C-k>', '<C-\\><C-n><C-w>k', { noremap = true })
keymap('t', '<C-l>', '<C-\\><C-n><C-w>l', { noremap = true })

-- Snippet mappings
keymap('i', '<C-f>', '<C-y>', { noremap = true })
keymap('s', '<C-f>', '<C-y>', { noremap = true })
keymap('x', '<C-f>', '<C-y>', { noremap = true })

-- Vista config
vim.g.vista_default_executive = 'coc'
keymap('n', '<F2>', ':Vista<CR>')
vim.g['vista#renderer#icons'] = {
  ["function"] = "\u{f794}",
  ["variable"] = "\u{f71b}",
}
vim.g.vista_icon_indent = { "╰─▸ ", "├─▸ " }
vim.g.vista_fzf_preview = { 'right:50%' }

-- COC configuration
vim.g.coc_global_extensions = {
  'coc-json',
  'coc-snippets',
  'coc-highlight',
  'coc-styled-components',
  'coc-tsserver',
  'coc-solargraph',
}

-- Better display for messages
vim.opt.cmdheight = 2
-- Smaller updatetime for CursorHold & CursorHoldI
vim.opt.updatetime = 300
-- don't give |ins-completion-menu| messages
vim.opt.shortmess:append('c')
-- always show signcolumns
vim.opt.signcolumn = 'yes:2'

-- Tab completion function
local function check_backspace()
  local col = vim.fn.col('.') - 1
  return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

-- Use tab for trigger completion with characters ahead and navigate
keymap('i', '<TAB>', function()
  if vim.fn['coc#pum#visible']() == 1 then
    return vim.fn['coc#pum#next'](1)
  elseif check_backspace() then
    return '<Tab>'
  else
    return vim.fn['coc#refresh']()
  end
end, { expr = true, silent = true })

keymap('i', '<S-TAB>', function()
  if vim.fn['coc#pum#visible']() == 1 then
    return vim.fn['coc#pum#prev'](1)
  else
    return '<C-h>'
  end
end, { expr = true })

-- Use <c-space> to trigger completion
keymap('i', '<c-space>', 'coc#refresh()', { silent = true, expr = true })

-- Navigate diagnostics
keymap('n', '[c', '<Plug>(coc-diagnostic-prev)', { silent = true })
keymap('n', ']c', '<Plug>(coc-diagnostic-next)', { silent = true })

-- Remap keys for gotos
keymap('n', 'gd', '<Plug>(coc-definition)', { silent = true })
keymap('n', 'gy', '<Plug>(coc-type-definition)', { silent = true })
keymap('n', 'gi', '<Plug>(coc-implementation)', { silent = true })
keymap('n', 'ge', '<Plug>(coc-references)', { silent = true })

-- Show documentation function
local function show_documentation()
  local cw = vim.fn.expand('<cword>')
  if vim.fn.index({ 'vim', 'help' }, vim.bo.filetype) >= 0 then
    vim.cmd('h ' .. cw)
  elseif vim.fn['coc#rpc#ready']() then
    vim.fn.CocActionAsync('doHover')
  else
    vim.cmd('!' .. vim.bo.keywordprg .. ' ' .. cw)
  end
end

keymap('n', '<localleader>k', function() vim.fn.CocAction('doHover') end, { silent = true, noremap = true })
keymap('n', 'K', show_documentation, { silent = true, noremap = true })

-- COC actions
keymap('n', '<leader>rn', '<Plug>(coc-rename)')
keymap('n', '<leader>rr', '<Plug>(coc-refactor)')
keymap('n', '<leader>do', '<Plug>(coc-codeaction)')

-- Format mappings
keymap('v', '<leader>f', '<Plug>(coc-format-selected)')
keymap('n', '<leader>f', '<Plug>(coc-format)')

-- COC lists
keymap('n', '<leader><space>a', ':<C-u>CocList diagnostics<CR>', { silent = true, noremap = true })
keymap('n', '<leader><space>e', ':<C-u>CocList extensions<CR>', { silent = true, noremap = true })
keymap('n', '<leader><space>c', ':<C-u>CocList commands<CR>', { silent = true, noremap = true })
keymap('n', '<leader><space>o', ':<C-u>CocList outline<CR>', { silent = true, noremap = true })
keymap('n', '<leader><space>s', ':<C-u>CocList -I symbols<CR>', { silent = true, noremap = true })
keymap('n', '<leader><space>p', ':<C-u>CocListResume<CR>', { silent = true, noremap = true })

-- Disable vim-go :GoDef short cut (gd)
vim.g.go_def_mapping_enabled = 0

-- Show signature help on placeholder jump
autocmd('User', {
  pattern = 'CocJumpPlaceholder',
  callback = function()
    vim.fn.CocActionAsync('showSignatureHelp')
  end
})
