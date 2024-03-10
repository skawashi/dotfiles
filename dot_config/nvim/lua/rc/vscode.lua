---- base
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

---- keymapping
-- Reset highlihgt
vim.keymap.set("n", "<Esc><Esc>", "<Cmd>noh<CR>", { silent = true })

-- VSCode function
vim.keymap.set("n", "gf", "<Cmd>call VSCodeNotify('workbench.action.quickOpen')<CR>")
vim.keymap.set("n", "gd", "<Cmd>call VSCodeNotify('editor.action.goToDeclaration')<CR>")
vim.keymap.set("n", "gF", "<Cmd>call VSCodeNotify('editor.action.peekDefinition')<CR>")
vim.keymap.set("n", "gb", "<Cmd>call VSCodeNotify('workbench.action.navigateBack')<CR>")
vim.keymap.set("n", "g]", "<Cmd>call VSCodeNotify('editor.action.marker.nextInFiles')<CR>")
vim.keymap.set("n", "g[", "<Cmd>call VSCodeNotify('editor.action.marker.prevInFiles')<CR>")
vim.keymap.set({ "n", "v" }, "gc", "<Cmd>call VSCodeNotify('editor.action.commentLine')<CR>")

-- plugin
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local plugins

plugins = {
	{ "folke/lazy.nvim" },
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {},
		config = function()
			require("flash").setup({
				modes = {
					-- options used when flash is activated through
					-- `f`, `F`, `t`, `T`, `;` and `,` motions
					char = {
						enabled = true,
						multi_line = false,
						search = { wrap = false },
						highlight = { backdrop = true, groups = { label = "", backdrop = "" } },
						jump = { register = false },
					},
				},
			})

			vim.keymap.set({ "n", "x" }, "SS", function()
				require("flash").jump({
					search = { forward = false, wrap = false, multi_window = false },
				})
			end)

			vim.keymap.set({ "n", "x" }, "Ss", function()
				require("flash").jump({
					search = { forward = true, wrap = false, multi_window = false },
				})
			end)
		end,
	},
	{
		"kylechui/nvim-surround",
		event = "VeryLazy",
		config = true,
	},
}

require("lazy").setup(plugins, {
	defaults = {
		lazy = true, -- should plugins be lazy-loaded?
	},
})
