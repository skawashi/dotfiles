vim.cmd('autocmd!')

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.opt.shell = '/bin/zsh'
vim.opt.title = false
vim.opt.mouse = 'a'
vim.opt.updatetime = 500

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = 'yes:2'

vim.opt.laststatus = 3
vim.opt.cmdheight = 1
vim.opt.showcmd = true
vim.opt.showmatch = true

vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.smartcase = true
vim.opt.wrapscan = true
vim.opt.backup = false

vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.expandtab = true
vim.opt.ai = true -- Auto indent
vim.opt.si = true -- Smart indent
vim.opt.wrap = true -- Wrap lines
vim.opt.whichwrap = 'b,s,h,l,<,>,[,],~'
vim.opt.backspace = 'start,eol,indent'
vim.opt.breakindent = true

vim.opt.wildmenu = true
vim.opt.wildmode = 'longest,list,full'

vim.cmd([[
if has('persistent_undo')
  set undodir=~/.config/nvim/undo
  set undofile
endif
]])

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Italics
vim.cmd([[let &t_ZH="\e[3m"]])
vim.cmd([[let &t_ZR="\e[23m"]])

-- Cursor type (Not working)
vim.cmd([[let &t_SI = "\e[1 q"]]) -- SI = INSERT mode
vim.cmd([[let &t_SR = "\e[1 q"]]) -- SR = REPLACE mode
vim.cmd([[let &t_EI = "\e[1 q"]]) -- EI = NORMAL mode (ELSE)

local autocmd = vim.api.nvim_create_autocmd
-- Turn off paste mode when leaving insert
autocmd('InsertLeave', {
  pattern = '*',
  command = 'set nopaste'
})

-- Don't auto commenting new lines
autocmd('BufEnter', {
	pattern = '*',
	command = 'set fo-=c fo-=r fo-=o',
})

-- Restore cursor location when file is opened
autocmd('BufReadPost' , {
	pattern = '*',
	callback = function()
		vim.api.nvim_exec('silent! normal! g`"zv', false)
	end,
})

-- Auto execute "chezmoi apply"
vim.cmd([[autocmd BufWritePost ~/.local/share/chezmoi/* ! chezmoi apply --source-path "%"]])
vim.cmd([[autocmd BufWritePost ~/.local/share/chezmoi/dot_tmux.conf ! chezmoi apply --source-path "%"]])
vim.cmd([[autocmd BufWritePost ~/.local/share/chezmoi/dot_zshrc ! chezmoi apply --source-path "%"]])
