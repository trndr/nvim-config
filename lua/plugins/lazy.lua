local utils = require("utils")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- check if firenvim is active
local firenvim_not_active = function()
  return not vim.g.started_by_firenvim
end

require("lazy").setup {
--    {
--      'uloco/bluloco.nvim',
--      lazy = false,
--      priority = 1000,
--      dependencies = { 'rktjmp/lush.nvim' },
--      config = function()
--        -- your optional config goes here, see below.
--          require("config.bluloco")
--      end,
--    },
  {
      'navarasu/onedark.nvim',
      lazy = false,
      config = function()
          require("config.onedark")
      end,
  },
  -- auto-completion engine
  {
    "hrsh7th/nvim-cmp",
    -- event = 'InsertEnter',
    event = 'VeryLazy',
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "onsails/lspkind-nvim",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-omni",
      "hrsh7th/cmp-emoji",
      "quangnguyen30192/cmp-nvim-ultisnips",
    },
    config = function()
      require("config.nvim-cmp")
    end,
  },

  {
    "neovim/nvim-lspconfig",
    event = { 'BufRead', 'BufNewFile' },
    config = function()
      require("config.nvim-lspconfig")
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    enabled = function()
      if vim.g.is_mac then
        return true
      end
      return false
    end,
    event = "VeryLazy",
    build = ":TSUpdate",
    config = function()
      require("config.treesitter")
    end
  },
{
    'freddiehaddad/feline.nvim',
    opts = {},
    config = function(_, opts)
        require('feline').setup()
        require('feline').winbar.setup()       -- to use winbar
        require('feline').statuscolumn.setup() -- to use statuscolumn

--        require('feline').use_theme()          -- to use a custom theme
    end
}

}
