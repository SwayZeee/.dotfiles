-- Which-key group definitions
-- Visual guides for leader key bindings

local M = {}

function M.setup()
  require('which-key').add({
    -- Code & Search
    { '<leader>c', group = '[C]ode' },
    { '<leader>d', group = '[D]ocument' },
    { '<leader>g', group = '[G]it' },
    { '<leader>h', group = 'More git' },
    { '<leader>r', group = '[R]ename' },
    { '<leader>s', group = '[S]earch' },
    { '<leader>w', group = '[W]orkspace' },

    -- AI
    { '<leader>a', group = '[A]I' },
    { '<leader>ai', desc = '[A]I: Toggle Claude Code' },
    { '<leader>as', desc = '[A]I: [S]end to Claude' },
    { '<leader>af', desc = '[A]I: [F]ocus Claude Code' },
  })
end

return M
