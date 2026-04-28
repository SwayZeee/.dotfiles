-- Editor options and settings

local M = {}

function M.setup()
  -- Highlight on yank
  local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
  vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
      vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = '*',
  })

  -- Search highlighting
  vim.o.hlsearch = false

  -- Line numbers
  vim.wo.number = true
  vim.wo.relativenumber = true

  -- Mouse mode
  vim.o.mouse = 'a'

  -- Clipboard
  vim.o.clipboard = 'unnamedplus'

  -- Indentation
  vim.o.breakindent = true

  -- Undo history
  vim.o.undofile = true

  -- Case-insensitive search
  vim.o.ignorecase = true
  vim.o.smartcase = true

  -- Sign column
  vim.wo.signcolumn = 'yes'

  -- Performance
  vim.o.updatetime = 250
  vim.o.timeoutlen = 300

  -- Completion
  vim.o.completeopt = 'menuone,noselect'

  -- Colors
  vim.o.termguicolors = true

  -- Cursor and splits
  vim.o.cursorline = true
  vim.o.splitright = true
  vim.o.splitbelow = true
end

return M 
