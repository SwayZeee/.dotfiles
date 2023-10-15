-- See `:help lualine.txt`
local options = {
  icons_enabled = true,
  theme = 'onedark',
  component_separators = '|',
  section_separators = '',
}
require('lualine').setup({
  options = options
})
