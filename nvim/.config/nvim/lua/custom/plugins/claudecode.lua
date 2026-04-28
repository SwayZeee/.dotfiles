-- Claude Code integration for Neovim
return {
  'coder/claudecode.nvim',
  config = function()
    require('custom.plugins.configs.claudecode').setup()
  end,
}
