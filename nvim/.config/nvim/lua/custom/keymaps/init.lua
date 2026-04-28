-- Keymap initialization

local M = {}

-- Leader key must be set before plugins load
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

function M.setup()
  vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

  require('custom.keymaps.mappings').setup()
  require('custom.keymaps.which-key').setup()
end

return M
