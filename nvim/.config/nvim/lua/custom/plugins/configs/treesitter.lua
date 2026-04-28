-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`

local ok, ts = pcall(require, 'nvim-treesitter.config')
if ok then
  ts.setup {
    ensure_installed = { 'lua', 'vim', 'vimdoc' },
    auto_install = false,
    highlight = {
      enable = false, -- Disable for now due to compatibility issue
    },
  }
end
