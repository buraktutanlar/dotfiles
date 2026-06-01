-- Vim options migrated from init.vim
-- Using vim.opt for modern Lua-based configuration

-- Appearance
vim.opt.encoding = "utf-8"
vim.opt.number = true
vim.opt.ruler = true
vim.opt.showcmd = true
vim.opt.showmode = true
vim.opt.visualbell = true
vim.opt.ttyfast = true
vim.opt.termguicolors = true

-- Behavior
vim.opt.nocompatible = true
vim.opt.hidden = true
vim.opt.modelines = 0
vim.opt.backspace = "indent,eol,start"
vim.opt.autoindent = true

-- Tabs and indentation (default: 3 spaces)
vim.opt.expandtab = true
vim.opt.tabstop = 3
vim.opt.softtabstop = 3
vim.opt.shiftwidth = 3

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.gdefault = true

-- Display
vim.opt.scrolloff = 3
vim.opt.wrap = true
vim.opt.textwidth = 79
vim.opt.formatoptions = "qrn1"
vim.opt.listchars = "tab:>-"

-- Status line and UI
vim.opt.laststatus = 2
vim.opt.wildmenu = true
vim.opt.wildmode = "list:longest"
vim.opt.shortmess:append("c")

-- Files
vim.opt.undofile = true

-- Folding (for Python)
vim.opt.foldmethod = "indent"
vim.opt.foldnestmax = 1
vim.opt.foldenable = false

-- Colors
vim.opt.background = "light"
vim.cmd.colorscheme("gruvbox")
