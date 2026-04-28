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
        on_attach = function(bufnr)
          vim.keymap.set('n', '<leader>hp', require('gitsigns').preview_hunk, { buffer = bufnr, desc = 'Preview git hunk' })

          local gs = package.loaded.gitsigns
          vim.keymap.set({'n', 'v'}, ']c', function()
            if vim.wo.diff then return ']c' end
            vim.schedule(function() gs.next_hunk() end)
            return '<Ignore>'
          end, {expr=true, buffer = bufnr, desc = "Jump to next hunk"})
          vim.keymap.set({'n', 'v'}, '[c', function()
            if vim.wo.diff then return '[c' end
            vim.schedule(function() gs.prev_hunk() end)
            return '<Ignore>'
          end, {expr=true, buffer = bufnr, desc = "Jump to previous hunk"})
        end,
      },
    },

    -- Auto-load plugin specs
    { import = 'custom.plugins' }
  }, {
    rocks = { enabled = false }
  })
end

return M
