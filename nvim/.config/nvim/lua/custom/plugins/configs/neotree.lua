vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

vim.keymap.set({ 'n' }, '<leader>et', '<cmd>Neotree show toggle left<cr>', { desc = 'Neotree [E]xplorer [T]oggle window' })
vim.keymap.set({ 'n' }, '<leader>ee', '<cmd>Neotree focus left<cr>', { desc = 'Neotree [E]xplorer [E]nter/open window' })
vim.keymap.set({ 'n' }, '<leader>ef', '<cmd>Neotree focus reveal left<cr>', { desc = 'Neotree [E]xplorer [F]ind file' })
