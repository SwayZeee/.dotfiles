-- All keybindings organized by plugin, ordered alphabetically

local M = {}

function M.setup()
  -- [[ Buffer Navigation ]]
  vim.keymap.set("n", "<S-h>", ":bprevious<CR>", { noremap = true, silent = true })
  vim.keymap.set("n", "<S-l>", ":bnext<CR>", { noremap = true, silent = true })

  -- [[ Claude Code (deferred) ]]
  vim.schedule(function()
    vim.keymap.set('n', '<leader>af', '<cmd>ClaudeCodeFocus<cr>', { desc = '[A]I: [F]ocus Claude Code' })
    vim.keymap.set('n', '<leader>ai', '<cmd>ClaudeCode<cr>', { desc = '[A]I: Toggle Claude Code' })
    vim.keymap.set('v', '<leader>as', '<cmd>ClaudeCodeSend<cr>', { desc = '[A]I: [S]end to Claude' })
  end)

  -- [[ Core Navigation ]]
  vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
  vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

  -- [[ Diagnostics ]]
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })

  -- [[ Gitsigns (deferred until plugin loads) ]]
  vim.schedule(function()
    local gs = package.loaded.gitsigns
    if not gs then return end

    vim.keymap.set({'n', 'v'}, '[c', function()
      if vim.wo.diff then return '[c' end
      vim.schedule(function() gs.prev_hunk() end)
      return '<Ignore>'
    end, {expr=true, desc = "Jump to previous hunk"})
    vim.keymap.set({'n', 'v'}, ']c', function()
      if vim.wo.diff then return ']c' end
      vim.schedule(function() gs.next_hunk() end)
      return '<Ignore>'
    end, {expr=true, desc = "Jump to next hunk"})
    vim.keymap.set('n', '<leader>hp', gs.preview_hunk, { desc = 'Preview git hunk' })
  end)

  -- [[ Neotree (deferred) ]]
  vim.schedule(function()
    vim.keymap.set({ 'n' }, '<leader>ee', '<cmd>Neotree focus left<cr>', { desc = 'Neotree [E]xplorer [E]nter/open window' })
    vim.keymap.set({ 'n' }, '<leader>ef', '<cmd>Neotree focus reveal left<cr>', { desc = 'Neotree [E]xplorer [F]ind file' })
    vim.keymap.set({ 'n' }, '<leader>et', '<cmd>Neotree show toggle left<cr>', { desc = 'Neotree [E]xplorer [T]oggle window' })
  end)

  -- [[ Telescope (deferred) ]]
  vim.schedule(function()
    local builtin = require('telescope.builtin')
    local themes = require('telescope.themes')

    vim.keymap.set('n', '<leader>/', function()
      builtin.current_buffer_fuzzy_find(themes.get_dropdown {
        winblend = 10,
        previewer = false,
      })
    end, { desc = '[/] Fuzzily search in current buffer' })
    vim.keymap.set('n', '<leader>?', builtin.oldfiles, { desc = '[?] Find recently opened files' })
    vim.keymap.set('n', '<leader><space>', builtin.buffers, { desc = '[ ] Find existing buffers' })
    vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = 'Search [G]it [F]iles' })
    vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
    vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
    vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
    vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
    vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
    vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
  end)
end

return M
