return {
  -- Set lualine as statusline
  'nvim-lualine/lualine.nvim',
  config = function()
    require('custom.plugins.configs.lualine')
  end,
}
