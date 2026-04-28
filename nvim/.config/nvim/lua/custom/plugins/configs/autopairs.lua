-- Auto-pair brackets and quotes

local M = {}

function M.setup()
  local cmp_autopairs = require('nvim-autopairs.completion.cmp')
  local cmp = require('cmp')
  cmp.event:on(
    'confirm_done',
    cmp_autopairs.on_confirm_done()
  )

  require("nvim-autopairs").setup({})
end

return M
