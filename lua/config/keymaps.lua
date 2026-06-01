-- Keymaps migrated from init.vim
-- All custom keybindings preserved with their original functionality

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Leader key
vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"

-- ============ Search Navigation ============
-- Make search use regex by default
map("n", "/", "/\\v", opts)
map("v", "/", "/\\v", opts)

-- Clear search highlighting
map("n", "<leader><space>", ":noh<cr>", opts)

-- ============ Basic Navigation ============
-- Tab to jump between matching brackets
map("n", "<tab>", "%", opts)
map("v", "<tab>", "%", opts)

-- Simpler window navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Window management
map("n", "<leader>v", "<C-w>v<C-w>l", opts) -- Vertical split
map("n", "<leader>h", "<C-w>s<C-w>l", opts) -- Horizontal split

-- ============ Insert Mode ============
-- F1 to ESC (avoid accidental F1)
map("i", "<F1>", "<ESC>", opts)
map("n", "<F1>", "<ESC>", opts)
map("v", "<F1>", "<ESC>", opts)

-- jj to ESC
map("i", "jj", "<ESC>", opts)

-- ; to :
map("n", ";", ":", opts)

-- ============ Text Manipulation ============
-- Space for macro execution (auto-macro @q)
map("n", "<Space>", "@q", opts)

-- Spell check toggle
map("n", "<leader>s", ":setlocal spell!<CR>", opts)

-- Clean trailing whitespaces
map("n", "<leader>W", ":%s/\\s\\+$//<cr>:let @/=''<CR>", opts)

-- Reselect pasted text
map("n", "<leader>p", "V`]", opts)

-- Subvert/Find and Replace (using vim-abolish)
map("v", "<leader>w", '"hy:%Subvert/<C-r>h//gc<left><left><left>', { noremap = true })
map("n", "<leader>w", '"hyiw:%Subvert/<C-r>h//gc<left><left><left>', { noremap = true })

-- ============ File/Project Navigation ============
-- Neo-tree toggle (was NERDTree)
map("n", "<leader>n", ":Neotree toggle<CR>", opts)

-- Telescope - Fuzzy finder (replaces fzf)
map("n", "<leader>f", "<cmd>Telescope find_files<CR>", opts)
map("n", "<leader>g", "<cmd>Telescope git_files<CR>", opts)

-- ============ YankRing ============
map("n", "<F3>", ":YRShow<cr>", opts)
map("i", "<F3>", "<ESC>:YRShow<cr>", opts)

-- ============ Rainbow Parentheses ============
map("n", "<leader>r", ":RainbowParenthesesToggle<CR>", opts)
