vim.env.NVIM_TUI_ENABLE_TRUE_COLOR = 1
vim.cmd([[syntax enable]])
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.winblend = 0
vim.opt.wildoptions = 'pum'
vim.opt.pumblend = 5
vim.opt.background = 'dark'

vim.cmd [[
" autocmd ColorScheme * highlight NormalFloat guifg=gray guibg=#073642
" autocmd ColorScheme * highlight FloatBorder guifg=gray guibg=#073642
autocmd ColorScheme * highlight! link FloatBorder NormalFloat

" colorscheme xxx
]]
-- local exec = vim.api.nvim_exec
-- exec('highlight SignColumn ctermbg = NONE guibg = NONE', false)
-- exec('highlight Normal ctermbg = NONE guibg = NONE', false)
-- exec('highlight NoneText ctermbg = NONE guibg = NONE', false)
-- exec('highlight LineNr ctermbg = NONE guibg = NONE', false)
-- exec('highlight Folded ctermbg = NONE guibg = NONE', false)
-- exec('highlight EndOfBuffer ctermbg = NONE guibg = NONE', false)
-- exec('highlight FloatBorder ctermbg = NONE guibg = NONE', false)

