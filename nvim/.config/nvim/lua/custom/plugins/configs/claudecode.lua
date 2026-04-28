-- Claude Code configuration

local M = {}

function M.setup()
  require('claudecode').setup({
    terminal = {
      split_side = 'right',
      split_width_percentage = 0.4,
    },
  })
end

return M
