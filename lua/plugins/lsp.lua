-- LSP configuration for Go, Python, Java, TypeScript, Scala

return {
  -- LSP Configuration
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "gopls",        -- Go
          "pyright",      -- Python
          "jdtls",        -- Java
          "tsserver",     -- TypeScript/JavaScript
          "metals",       -- Scala
          "lua_ls",       -- Lua
        },
        automatic_installation = true,
      })

      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local on_attach = function(client, bufnr)
        local opts = { buffer = bufnr, noremap = true, silent = true }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gy", vim.lsp.buf.type_definition, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "gx", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
        vim.keymap.set("n", "[c", vim.diagnostic.goto_prev, opts)
        vim.keymap.set("n", "]c", vim.diagnostic.goto_next, opts)
      end

      lspconfig.gopls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          gopls = {
            gofumpt = true,
            usePlaceholders = true,
          },
        },
      })

      lspconfig.pyright.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      lspconfig.jdtls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      lspconfig.tsserver.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      lspconfig.metals.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
      })
    end,
  },

  -- Show function signature
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    config = function()
      require("lsp_signature").setup()
    end,
  },

  -- Diagnostics display
  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("trouble").setup()
    end,
  },
}
