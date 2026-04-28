-- Neovim Configuration
-- Modularized setup with LSP, plugins, keymaps, and options

-- Leader key must be set before plugins load
require('custom.keymaps')

-- Core setup
require('custom.options').setup()
require('custom.keymaps').setup()
require('custom.lazy').setup()
require('custom.lsp').setup()

-- vim: ts=2 sts=2 sw=2 et
