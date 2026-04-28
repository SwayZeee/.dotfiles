-- Highlight, edit, and navigate code
return {
  'nvim-treesitter/nvim-treesitter',
  enabled = true,
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  build = ':TSUpdate',
  lazy = false,
  config = function()
    require('custom.plugins.configs.treesitter')
  end
}
