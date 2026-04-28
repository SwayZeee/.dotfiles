-- Statusline configuration

local M = {}

function M.setup()
  local options = {
    icons_enabled = true,
    theme = 'onedark',
    component_separators = '|',
    section_separators = '',
  }
  require('lualine').setup({
    options = options
  })
end

return M
