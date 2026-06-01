-- Neovim Configuration
-- Migrated from init.vim with modern tools (lazy.nvim, LSP, DAP)
-- All custom keybindings and options preserved

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Load configuration modules in order
require("config.options")
require("config.autocmds")
require("config.keymaps")

-- Setup lazy.nvim with plugins
require("lazy").setup("plugins", {
  defaults = { lazy = false },
  change_detection = { notify = false },
})
