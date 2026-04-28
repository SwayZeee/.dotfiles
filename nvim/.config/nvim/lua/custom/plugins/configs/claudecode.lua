-- Claude Code configuration

local M = {}

function M.setup()
  require('claudecode').setup({
    terminal = {
      split_side = 'right',
      split_width_percentage = 0.4,
    },
  })

  -- Claude Code keymaps
  vim.keymap.set('n', '<leader>ai', '<cmd>ClaudeCode<cr>', { desc = '[A]I: Toggle Claude Code' })
  vim.keymap.set('v', '<leader>as', '<cmd>ClaudeCodeSend<cr>', { desc = '[A]I: [S]end to Claude' })
  vim.keymap.set('n', '<leader>af', '<cmd>ClaudeCodeFocus<cr>', { desc = '[A]I: [F]ocus Claude Code' })
end

return M
