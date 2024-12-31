return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- add NvimTreeOpen to cmd, because workspaces plugin use this command
  -- if not, the workspaces will throw exception on nvim startup, because tree plugin is not loaded, so command is not found
  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus", "NvimTreeOpen" },
    opts = function()
      return require "nvchad.configs.nvimtree"
    end,
  },
  -- override default lazy=false
  {
    "folke/which-key.nvim",
    lazy = false,
    opts = function()
      dofile(vim.g.base46_cache .. "whichkey")
      return {}
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "go",
      },
    },
  },
}
