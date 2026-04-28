-- Lazy.nvim plugin manager and plugin specs

local M = {}

function M.setup()
  require('lazy').setup({
    -- Git plugins
    'tpope/vim-fugitive',
    'tpope/vim-rhubarb',

    -- Auto-detect indent settings
    'tpope/vim-sleuth',

    -- LSP Configuration
    {
      'neovim/nvim-lspconfig',
      dependencies = {
        { 'williamboman/mason.nvim', config = true },
        'williamboman/mason-lspconfig.nvim',
        { 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },
        'folke/neodev.nvim',
      },
    },

    -- Git signs
    {
      'lewis6991/gitsigns.nvim',
      opts = {
        signs = {
          add = { text = '+' },
          change = { text = '~' },
          delete = { text = '_' },
          topdelete = { text = '‾' },
          changedelete = { text = '~' },
        },
      },
    },

    -- Auto-load plugin specs
    { import = 'custom.plugins' }
  }, {
    rocks = { enabled = false }
  })
end

return M
