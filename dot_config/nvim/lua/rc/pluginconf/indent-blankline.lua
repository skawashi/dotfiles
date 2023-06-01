local indent = require("indent_blankline")

vim.cmd([[highlight IndentBlanklineChar guifg=#586e75 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineContextChar guifg=#93a1a1 gui=nocombine]])
-- vim.cmd [[highlight IndentBlanklineIndent1 guifg=#dc322f gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent2 guifg=#d33682 gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent3 guifg=#b58900 gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent4 guifg=#859900 gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent5 guifg=#2aa198 gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent6 guifg=#268bd2 gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent7 guifg=#6c71c4 gui=nocombine]]

indent.setup({
	space_char_blankline = " ",
	show_current_context = true,
	show_current_context_start = true,
	use_treesitter = false,
	-- char_highlight_list = {
	--   "IndentBlanklineIndent1",
	--   "IndentBlanklineIndent2",
	--   "IndentBlanklineIndent3",
	--   "IndentBlanklineIndent4",
	--   "IndentBlanklineIndent5",
	--   "IndentBlanklineIndent6",
	-- },
	buftype_exclude = {
		"terminal",
	},

	filetype_exclude = {
		"help",
		"neo-tree",
		"alpha",
		"packer",
		"lspinfo",
		"checkhealth",
		"mason",
		"null-ls-info",
		"log",
		"SidebarNvim",
		"yaml",
		"noice",
		"neo-tree-popup"
	},
})
vim.cmd("let g:indent_blankline_char = '▏'") -- indent char
vim.cmd("let g:indent_blankline_context_char = '▏'") -- emphasis indent char
vim.cmd("let g:indent_blankline_char_blankline = '▏'") -- char behind space
vim.cmd("let g:indent_blankline_show_first_indent_level = v:true")
-- vim.cmd("let g:indent_blankline_use_treesitter = v:true")
-- vim.cmd("let g:indent_blankline_show_current_context = v:true")
-- vim.cmd("let g:indent_blankline_show_current_context_start = v:true")
