local nvim_tmux_nav = require("nvim-tmux-navigation")
nvim_tmux_nav.setup({
	disable_when_zoomed = false, -- defaults to false
})

vim.keymap.set("n", "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft, { silent = true })
vim.keymap.set("n", "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight, { silent = true })
vim.keymap.set("n", "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp, { silent = true })
vim.keymap.set("n", "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown, { silent = true })
-- vim.keymap.set("n", "<C-q>", nvim_tmux_nav.NvimTmuxNavigateNext, { silent = true })
