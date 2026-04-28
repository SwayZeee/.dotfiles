-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter-intro`

local parsers = { 'bash', 'c', 'lua', 'markdown', 'vim', 'vimdoc', 'javascript', 'typescript' }
require('nvim-treesitter').install(parsers)

---@param buf integer
---@param language string
local function treesitter_try_attach(buf, language)
  -- check if parser exists and load it
  if not vim.treesitter.language.add(language) then return end
  -- enables syntax highlighting and other treesitter features
  vim.treesitter.start(buf, language)

  -- check if treesitter indentation is available for this language
  local has_indent_query = vim.treesitter.query.get(language, 'indents') ~= nil

  -- enables treesitter based indentation
  if has_indent_query then vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()" end
end

local available_parsers = require('nvim-treesitter').get_available()
vim.api.nvim_create_autocmd('FileType', {
  callback = function(args)
    local buf, filetype = args.buf, args.match

    local language = vim.treesitter.language.get_lang(filetype)
    if not language then return end

    local installed_parsers = require('nvim-treesitter').get_installed 'parsers'

    if vim.tbl_contains(installed_parsers, language) then
      -- enable the parser if it is installed
      treesitter_try_attach(buf, language)
    elseif vim.tbl_contains(available_parsers, language) then
      -- if a parser is available auto install it, and enable it after installation
      require('nvim-treesitter').install(language):await(function() treesitter_try_attach(buf, language) end)
    else
      -- try to enable treesitter features in case the parser exists but is not available
      treesitter_try_attach(buf, language)
    end
  end,
})
