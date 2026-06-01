-- Autocommands and filetype-specific configurations
-- Migrated from init.vim au commands

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Java: use 4-space tabs (google-java-format compatibility)
augroup("java_config", { clear = true })
autocmd("FileType", {
  group = "java_config",
  pattern = "java",
  callback = function()
    vim.opt.tabstop = 4
    vim.opt.softtabstop = 4
    vim.opt.shiftwidth = 4
  end,
})

-- Python: setup folding
augroup("python_config", { clear = true })
autocmd("FileType", {
  group = "python_config",
  pattern = "python",
  callback = function()
    vim.opt_local.foldmethod = "indent"
    vim.opt_local.foldnestmax = 1
    vim.opt_local.foldenable = false
  end,
})

-- Scala/Rainbow Parentheses
augroup("rainbow_parens", { clear = true })
autocmd("Syntax", {
  group = "rainbow_parens",
  pattern = "*",
  callback = function()
    vim.cmd("RainbowParenthesesLoadRound")    -- ()
    vim.cmd("RainbowParenthesesLoadSquare")   -- []
    vim.cmd("RainbowParenthesesLoadBraces")   -- {}
    vim.cmd("RainbowParenthesesLoadChevrons") -- <>
  end,
})
