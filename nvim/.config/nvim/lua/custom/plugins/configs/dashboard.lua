local dashboard = require('alpha.themes.dashboard')
local logo = [[
  ______                                 ________                            
 /      \                               |        \                           
|  ▓▓▓▓▓▓\__   __   __  ______  __    __ \▓▓▓▓▓▓▓▓ ______   ______   ______  
| ▓▓___\▓▓  \ |  \ |  \|      \|  \  |  \   /  ▓▓ /      \ /      \ /      \ 
 \▓▓    \| ▓▓ | ▓▓ | ▓▓ \▓▓▓▓▓▓\ ▓▓  | ▓▓  /  ▓▓ |  ▓▓▓▓▓▓\  ▓▓▓▓▓▓\  ▓▓▓▓▓▓\
 _\▓▓▓▓▓▓\ ▓▓ | ▓▓ | ▓▓/      ▓▓ ▓▓  | ▓▓ /  ▓▓  | ▓▓    ▓▓ ▓▓    ▓▓ ▓▓    ▓▓
|  \__| ▓▓ ▓▓_/ ▓▓_/ ▓▓  ▓▓▓▓▓▓▓ ▓▓__/ ▓▓/  ▓▓___| ▓▓▓▓▓▓▓▓ ▓▓▓▓▓▓▓▓ ▓▓▓▓▓▓▓▓
 \▓▓    ▓▓\▓▓   ▓▓   ▓▓\▓▓    ▓▓\▓▓    ▓▓  ▓▓    \\▓▓     \\▓▓     \\▓▓     \
  \▓▓▓▓▓▓  \▓▓▓▓▓\▓▓▓▓  \▓▓▓▓▓▓▓_\▓▓▓▓▓▓▓\▓▓▓▓▓▓▓▓ \▓▓▓▓▓▓▓ \▓▓▓▓▓▓▓ \▓▓▓▓▓▓▓
                               |  \__| ▓▓                                    
                                \▓▓    ▓▓                                    
                                 \▓▓▓▓▓▓                                     
]]

dashboard.section.header.val = vim.split(logo, '\n')
dashboard.section.header.opts.hl = 'AlphaHeader'
dashboard.opts.layout[1].val = 8

dashboard.section.buttons.val = {
  dashboard.button("n", " " .. " New file", ":ene <BAR> startinsert <CR>"),
  dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
  dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
  dashboard.button("g", " " .. " Find text", ":Telescope live_grep <CR>"),
  dashboard.button("c", " " .. " Config", ":e $MYVIMRC <CR>"),
--  dashboard.button("s", " " .. " Restore Session", [[:lua require("persistence").load() <cr>]]),
  dashboard.button("l", "󰒲 " .. " Lazy", ":Lazy<CR>"),
  dashboard.button("m", "M " .. " Mason", ":Mason<CR>"),
  dashboard.button("h", "H " .. " Healthcheck", ":checkhealth<CR>"),
  dashboard.button("q", " " .. " Quit", ":qa<CR>"),
}
for _, button in ipairs(dashboard.section.buttons.val) do
  button.opts.hl = "AlphaButtons"
  button.opts.hl_shortcut = "AlphaShortcut"
end

require('alpha').setup({
  config = dashboard.config,
  layout = dashboard.config.layout
})
