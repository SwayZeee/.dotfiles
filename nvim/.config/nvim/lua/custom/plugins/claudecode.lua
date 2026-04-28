-- Claude Code integration for Neovim
return {
  'coder/claudecode.nvim',
  config = function()
    require('claudecode').setup({
      terminal = {
        split_side = 'right',
        split_width_percentage = 0.4,
      },
    })
  end,
  keys = {
    { '<leader>ai', '<cmd>ClaudeCode<cr>', desc = '[A]I: Toggle Claude Code' },
    { '<leader>as', '<cmd>ClaudeCodeSend<cr>', desc = '[A]I: [S]end to Claude', mode = 'v' },
    { '<leader>af', '<cmd>ClaudeCodeFocus<cr>', desc = '[A]I: [F]ocus Claude Code' },
  },
}
