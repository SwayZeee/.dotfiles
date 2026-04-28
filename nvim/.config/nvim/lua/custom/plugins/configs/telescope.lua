-- Telescope fuzzy finder configuration

local M = {}

function M.setup()
  require('telescope').setup {
    defaults = {
      mappings = {
        i = {
          ['<C-u>'] = false,
          ['<C-d>'] = false,
        },
      },
    },
    pickers = {
      find_files = {
        previewer = false,
      },
      live_grep = {
        previewer = false,
      },
    },
  }

  pcall(require('telescope').load_extension, 'fzf')
end

return M
