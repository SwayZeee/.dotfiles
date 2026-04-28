-- Neovim Configuration
-- Modularized setup with LSP, plugins, keymaps, and options

-- [[ Keymaps ]]
require('custom.keymaps')

-- [[ Setting options ]]
require('custom.options')

-- [[ Plugins ]]
require('custom.lazy')

-- [[ Configure LSP ]]
require('custom.lsp').setup()

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
