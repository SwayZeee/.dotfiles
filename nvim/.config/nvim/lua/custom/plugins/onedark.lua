-- Theme inspired by Atom
return {
  'navarasu/onedark.nvim',
  priority = 1000,
  config = function()
    require('custom.plugins.configs.onedark')
  end,
}
