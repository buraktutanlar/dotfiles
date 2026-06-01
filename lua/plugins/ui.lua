-- UI plugins: appearance, file explorer, fuzzy finder, etc.

return {
  -- Colorscheme (preserve gruvbox from init.vim)
  {
    "morhetz/gruvbox",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("gruvbox")
    end,
  },

  -- Status line (replaces vim-airline)
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = "gruvbox",
          globalstatus = true,
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff" },
          lualine_c = { "filename", "diagnostics" },
          lualine_x = { "encoding", "fileformat", "filetype" },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
        tabline = {
          lualine_a = { "buffers" },
          lualine_z = { "tabs" },
        },
      })
    end,
  },

  -- File explorer (replaces NERDTree)
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup({
        filesystem = {
          follow_current_file = {
            enabled = true,
          },
          use_libuv_file_watcher = true,
        },
        window = {
          width = 30,
        },
      })
    end,
  },

  -- Fuzzy finder (replaces fzf/fzf.vim)
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
      local telescope = require("telescope")
      telescope.setup({
        defaults = {
          layout_strategy = "vertical",
          layout_config = {
            height = 0.4,
          },
        },
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          },
        },
      })
      telescope.load_extension("fzf")
    end,
  },

  -- Which-key for showing keybindings
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      require("which-key").setup()
    end,
  },

  -- Rainbow parentheses (keep from init.vim)
  {
    "kien/rainbow_parentheses.vim",
    config = function()
      vim.g.rbpt_colorpairs = {
        { "brown", "RoyalBlue3" },
        { "Darkblue", "SeaGreen3" },
        { "darkgray", "DarkOrchid3" },
        { "darkgreen", "firebrick3" },
        { "darkcyan", "RoyalBlue3" },
        { "darkred", "SeaGreen3" },
        { "darkmagenta", "DarkOrchid3" },
        { "brown", "firebrick3" },
        { "gray", "RoyalBlue3" },
        { "black", "SeaGreen3" },
        { "darkmagenta", "DarkOrchid3" },
        { "Darkblue", "firebrick3" },
        { "darkgreen", "RoyalBlue3" },
        { "darkcyan", "SeaGreen3" },
        { "darkred", "DarkOrchid3" },
        { "red", "firebrick3" },
      }
      vim.g.rbpt_max = 16
      vim.g.rbpt_loadcmd_toggle = 0
    end,
  },

  -- Git gutter (replaces vim-gitgutter)
  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    config = function()
      require("gitsigns").setup({
        signcolumn = true,
        numhl = false,
        linehl = false,
        word_diff = false,
        watch_gitdir = {
          interval = 100,
          follow_files = true,
        },
      })
    end,
  },
}
