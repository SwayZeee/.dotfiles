-- Onedark color scheme

local M = {}

function M.setup()
  require('onedark').setup({
    options = {
      style = 'cool',
    }
  })

  vim.cmd.colorscheme 'onedark'
end

return M
