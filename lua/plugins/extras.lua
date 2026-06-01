-- Extra utilities and development tools

return {
  -- Markdown preview
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    ft = "markdown",
  },

  -- Slime for sending code to tmux
  {
    "jpalardy/vim-slime",
    config = function()
      vim.g.slime_target = "tmux"
      vim.g.slime_paste_file = vim.fn.expand("$HOME") .. "/.local/share/nvim/slime/.slime_paste"
      vim.g.slime_default_config = {
        socket_name = string.match(vim.fn.getenv("TMUX"), "[^,]+") or "",
        target_pane = ":.1",
      }
      vim.g.slime_dont_ask_default = 1
    end,
  },

  -- YankRing for clipboard history
  {
    "vim-scripts/YankRing.vim",
  },

  -- Ack/ag for searching
  {
    "mileszs/ack.vim",
    cmd = { "Ack", "Ag" },
    config = function()
      if vim.fn.executable("ag") == 1 then
        vim.g.ackprg = "ag --vimgrep --smart-case"
      end
    end,
  },

  -- fzf integration
  {
    "junegunn/fzf.vim",
    dependencies = { "junegunn/fzf" },
  },

  -- Language-aware formatting
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          json = { "prettier" },
          lua = { "stylua" },
          python = { "black" },
          go = { "gofumpt" },
          typescript = { "prettier" },
          javascript = { "prettier" },
        },
        format_on_save = {
          timeout_ms = 500,
          lsp_fallback = true,
        },
      })
    end,
  },
}
