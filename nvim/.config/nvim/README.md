# Neovim Configuration

A fully modularized Neovim setup using lazy.nvim for plugin management.

## Directory Structure

```
~/.config/nvim/
├── init.lua                           # Main entry point (~10 lines)
├── README.md                          # This file
├── .luarc.json                        # Lua LSP configuration
└── lua/
    └── custom/
        ├── keymaps/
        │   ├── init.lua              # Core keymaps, leader key setup
        │   └── which-key.lua         # Leader key group definitions
        ├── options/
        │   └── init.lua              # Vim settings (search, splits, mouse, etc.)
        ├── lsp/
        │   └── init.lua              # LSP setup, on_attach, servers, which-key groups
        ├── lazy.lua                  # lazy.nvim bootstrap
        └── plugins/
            ├── init.lua              # Plugin directory (auto-imported)
            ├── *.lua                 # Individual plugin specs (autocompletion, telescope, etc.)
            └── configs/
                ├── lazy.lua          # lazy.nvim setup and plugin specs
                └── *.lua             # Plugin configurations (separate from specs)
```

## How It Works

1. **init.lua** — Simple entry point that loads modules in order:
   ```lua
   require('custom.keymaps')      # Set leader key, basic keymaps
   require('custom.options')      # Vim settings
   require('custom.lazy')         # Plugin manager bootstrap
   require('custom.lsp').setup()  # LSP configuration (after plugins load)
   ```

2. **lazy.lua** — Bootstraps lazy.nvim and loads all plugins from `lua/custom/plugins/`

3. **plugins/** — Each plugin file is a spec that lazy.nvim processes:
   ```lua
   -- lua/custom/plugins/telescope.lua
   return {
     'nvim-telescope/telescope.nvim',
     dependencies = { 'nvim-lua/plenary.nvim' },
     config = function()
       require('custom.plugins.configs.telescope').setup()
     end
   }
   ```

4. **plugins/configs/** — Plugin-specific configuration kept separate from specs

## Adding a New Plugin

### 1. Create a plugin spec

Create a file in `lua/custom/plugins/`:

```lua
-- lua/custom/plugins/example.lua
return {
  'owner/example.nvim',
  dependencies = { 'some/dependency' },
  config = function()
    require('custom.plugins.configs.example').setup()
  end,
  keys = {
    { '<leader>ex', function() require('example').do_something() end, desc = 'Do something' }
  }
}
```

### 2. Create a config file (optional)

If the plugin needs configuration, create:

```lua
-- lua/custom/plugins/configs/example.lua
local M = {}

function M.setup()
  require('example').setup({
    option1 = true,
    option2 = 'value'
  })
end

return M
```

### 3. Lazy.nvim auto-loads it

Since `lua/custom/lazy.lua` has `{ import = 'custom.plugins' }`, any file in `lua/custom/plugins/` is automatically loaded.

## Adding Keybindings

### For LSP keybindings
Add to `lua/custom/lsp/init.lua` in the `on_attach` function:
```lua
nmap('<leader>xy', vim.lsp.buf.some_action, 'Description')
```

### For general keybindings
Add to `lua/custom/keymaps/init.lua`:
```lua
vim.keymap.set('n', '<leader>xy', function() ... end, { desc = 'Description' })
```

### For which-key groups
Add to `lua/custom/keymaps/which-key.lua`:
```lua
{ '<leader>x', group = '[X] Group Name' }
```

## Current Plugins

See `lua/custom/plugins/` for the full list. Some key ones:

- **telescope** — Fuzzy finder (search files, buffers, etc.)
- **nvim-lspconfig** — Language server configuration
- **blink.cmp** — AI-powered completion
- **treesitter** — Syntax highlighting and AST utilities
- **neotree** — File explorer sidebar
- **lualine** — Status bar
- **onedark** — Color scheme
- **which-key** — Keymap helper popup

## Modifying vim Options

Edit `lua/custom/options/init.lua` to change settings like:
- `hlsearch`, `number`, `mouse`, `clipboard`
- `splitright`, `splitbelow`, `cursorline`
- `completeopt`, `termguicolors`

## Modifying LSP Servers

To add/remove language servers, edit `lua/custom/lsp/init.lua`:

```lua
local servers = {
  lua_ls = { ... },
  rust_analyzer = { ... },  -- Add new server
  -- tsserver = { ... },     -- Comment out to disable
}
```

Mason will automatically install servers listed here.

## Tips

- **Fast reload**: `:source %` while editing config files
- **Check LSP**: `:LspInfo` to see attached servers
- **Lazy status**: `:Lazy` to open the plugin manager UI
- **Health check**: `:checkhealth` for diagnostics
- **Performance**: Run `:Lazy profile` to see startup time per plugin

## Structure Benefits

- **Modular**: Each concern has its own file
- **Maintainable**: Easy to find what you're looking for
- **Scalable**: Add plugins without cluttering init.lua
- **Clean**: Specs and configs are separated
