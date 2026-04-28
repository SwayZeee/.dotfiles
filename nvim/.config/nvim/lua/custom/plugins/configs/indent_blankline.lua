-- Indentation guides on blank lines

local M = {}

function M.setup()
  require('ibl').setup {
    indent = {
      char = '┊',
    }
  }
end

return M
