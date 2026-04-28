-- Core keybindings

local M = {}

-- Leader key must be set before plugins load
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

function M.setup()
  vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

  vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
  vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })

  vim.keymap.set("n", "<S-h>", ":bprevious<CR>", { noremap = true, silent = true })
  vim.keymap.set("n", "<S-l>", ":bnext<CR>", { noremap = true, silent = true })

  require('custom.keymaps.which-key').setup()
end

return M
