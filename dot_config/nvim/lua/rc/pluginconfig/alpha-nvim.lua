local status, alpha = pcall(require, 'alpha')
if (not status) then return end

local dashboard = require('alpha.themes.dashboard')
dashboard.section.header.val = {
    "                                                     ",
    "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
    "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
    "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
    "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
    "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
    "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
    "                                                     ",
}

-- dashboard.section.header.val = {
--     [[                                    ██████                                    ]],
--     [[                                ████▒▒▒▒▒▒████                                ]],
--     [[                              ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                              ]],
--     [[                            ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                            ]],
--     [[                          ██▒▒▒▒▒▒▒▒    ▒▒▒▒▒▒▒▒                              ]],
--     [[                          ██▒▒▒▒▒▒  ▒▒▓▓▒▒▒▒▒▒  ▓▓▓▓                          ]],
--     [[                          ██▒▒▒▒▒▒  ▒▒▓▓▒▒▒▒▒▒  ▒▒▓▓                          ]],
--     [[                        ██▒▒▒▒▒▒▒▒▒▒    ▒▒▒▒▒▒▒▒    ██                        ]],
--     [[                        ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                        ]],
--     [[                        ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                        ]],
--     [[                        ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                        ]],
--     [[                        ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                        ]],
--     [[                        ██▒▒██▒▒▒▒▒▒██▒▒▒▒▒▒▒▒██▒▒▒▒██                        ]],
--     [[                        ████  ██▒▒██  ██▒▒▒▒██  ██▒▒██                        ]],
--     [[                        ██      ██      ████      ████                        ]],
-- }

dashboard.section.buttons.val = {
    dashboard.button("SPC f o", "  > Recent files"),
    dashboard.button("SPC f r", "  > Frecency/MRU"),
    dashboard.button("SPC f f", "  > Find file"),
    dashboard.button("SPC f g", "  > Find word"),
    -- dashboard.button("SPC   c", "  > Configuration",":lua require('telescope').extensions.file_browser.file_browser({path='$NVIMCONF', previewer = false,initial_mode = 'normal', layout_config = { height = 40 }})<CR>"),
    -- dashboard.button("SPC   i", "  > Plugin Install", ":PackerInstall<CR>"),
    dashboard.button("e", "  > New file" , ":ene <BAR> startinsert <CR>"),
    dashboard.button("q", "  > Quit", ":qa<CR>"),
}
alpha.setup(dashboard.opts)

-- local theta = require('alpha.themes.theta')
--
-- theta.section.buttons.val = {
--     theta.button("SPC f f", "  > Find file"),
--     theta.button("SPC f o", "  > Recent files"),
--     theta.button("SPC f r", "  > Frecency/MRU"),
--     theta.button("SPC f g", "  > Find word"),
--     theta.button("e", "  > New file" , ":ene <BAR> startinsert <CR>"),
--     theta.button("q", "  > Quit NeoVim", ":qa<CR>"),
-- }
-- alpha.setup(theta.opts)
