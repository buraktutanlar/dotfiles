-- LSP configuration for Go, Python, Java, TypeScript, Scala
-- Using modern vim.lsp.config API (nvim 0.11+)

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
          "ts_ls",        -- TypeScript/JavaScript (updated from tsserver)
          "metals",       -- Scala
          "lua_ls",       -- Lua
        },
        automatic_installation = true,
      })

      local lsp = vim.lsp
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Global keymaps for LSP
      local on_attach = function(client, bufnr)
        local opts = { buffer = bufnr, noremap = true, silent = true }
        lsp.buf.inlay_hint(bufnr, true)
        
        vim.keymap.set("n", "gd", lsp.buf.definition, opts)
        vim.keymap.set("n", "gy", lsp.buf.type_definition, opts)
        vim.keymap.set("n", "gi", lsp.buf.implementation, opts)
        vim.keymap.set("n", "gr", lsp.buf.references, opts)
        vim.keymap.set("n", "gx", lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>ca", lsp.buf.code_action, opts)
        vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
        vim.keymap.set("n", "[c", vim.diagnostic.goto_prev, opts)
        vim.keymap.set("n", "]c", vim.diagnostic.goto_next, opts)
      end

      -- Setup servers using vim.lsp.config
      local servers = {
        gopls = {
          settings = {
            gopls = {
              gofumpt = true,
              usePlaceholders = true,
            },
          },
        },
        pyright = {},
        jdtls = {},
        ts_ls = {},
        metals = {},
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = {
                globals = { "vim" },
              },
            },
          },
        },
      }

      for server, config in pairs(servers) do
        local merged_config = vim.tbl_deep_extend("force", {
          capabilities = capabilities,
          on_attach = on_attach,
        }, config or {})
        
        lsp.enable(server)
        for key, value in pairs(merged_config) do
          vim.lsp.config(server, {
            [key] = value,
          })
        end
      end
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
