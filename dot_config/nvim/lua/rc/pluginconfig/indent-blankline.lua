local ibl = require("ibl")
local hooks = require("ibl.hooks")

local highlight = {
	"SolarizedYellow",
	"SolarizedOrange",
	"SolarizedRed",
	"SolarizedMagenta",
	"SolarizedGreen",
	"SolarizedCyan",
	"SolarizedBlue",
	"SolarizedViolet",
}

local base_color = {
	"SolarizedGray",
}

local rainbow_highlight = {
	"SolarizedYellow",
	-- "SolarizedRed",
	"SolarizedOrange",
	"SolarizedViolet",
	"SolarizedBlue",
	"SolarizedCyan",
	"SolarizedGreen",
}

hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
	vim.api.nvim_set_hl(0, "SolarizedYellow", { fg = "#b58900" })
	vim.api.nvim_set_hl(0, "SolarizedOrange", { fg = "#cb4b16" })
	vim.api.nvim_set_hl(0, "SolarizedRed", { fg = "#dc322f" })
	vim.api.nvim_set_hl(0, "SolarizedMagenta", { fg = "#d33682" })
	vim.api.nvim_set_hl(0, "SolarizedGreen", { fg = "#859900" })
	vim.api.nvim_set_hl(0, "SolarizedCyan", { fg = "#2aa198" })
	vim.api.nvim_set_hl(0, "SolarizedBlue", { fg = "#268bd2" })
	vim.api.nvim_set_hl(0, "SolarizedViolet", { fg = "#6c71c4" })
	vim.api.nvim_set_hl(0, "SolarizedGray", { fg = "#fdf6e3" })
end)

vim.g.rainbow_delimiters = { highlight = rainbow_highlight }

ibl.setup({
	indent = {
		char = { "▏" },
		tab_char = { "▏" },
		-- char = { '│' },
		-- tab_char = { '│' },
	},
	whitespace = {
		highlight = { "whitespace", "NonText" },
	},
	scope = {
		enabled = true,
		highlight = rainbow_highlight,
		include = {
			node_type = {
				["*"] = { "*" },
			},
		},
	},

	exclude = {
		filetypes = {
			-- default start
			"lspinfo",
			"packer",
			"help",
			"checkhealth",
			"man",
			"gitcommit",
			"TelescopePrompt",
			"TelescopeResults",
			-- default end
			"SidebarNvim",
			"alpha",
			"log",
			"mason",
			"neo-tree",
			"neo-tree-popup",
			"noice",
			"null-ls-info",
			"yaml",
		},

		buftypes = {
			-- default start
			"terminal",
			"nofile",
			"quickfix",
			"prompt",
			-- default end
		},
	},
})

hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
-- hooks.register(
-- 	hooks.type.WHITESPACE,
-- 	hooks.builtin.hide_first_space_indent_level,
-- 	hooks.builtin.hide_first_tab_indent_level
-- )

--------------------------------------------
-- v2 setting
--------------------------------------------
-- vim.cmd([[highlight IndentBlanklineChar guifg=#586e75 gui=nocombine]])
-- vim.cmd([[highlight IndentBlanklineContextChar guifg=#93a1a1 gui=nocombine]])
-- vim.cmd [[highlight IndentBlanklineIndent1 guifg=#dc322f gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent2 guifg=#d33682 gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent3 guifg=#b58900 gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent4 guifg=#859900 gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent5 guifg=#2aa198 gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent6 guifg=#268bd2 gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent7 guifg=#6c71c4 gui=nocombine]]

-- ibl.setup({
-- 	space_char_blankline = " ",
-- 	show_current_context = true,
-- 	show_current_context_start = true,
-- 	use_treesitter = true,
-- 	-- char_highlight_list = {
-- 	--   "IndentBlanklineIndent1",
-- 	--   "IndentBlanklineIndent2",
-- 	--   "IndentBlanklineIndent3",
-- 	--   "IndentBlanklineIndent4",
-- 	--   "IndentBlanklineIndent5",
-- 	--   "IndentBlanklineIndent6",
-- 	-- },
-- 	buftype_exclude = {
-- 		"terminal",
-- 	},
--
-- 	exclude = {
-- 		"help",
-- 		"neo-tree",
-- 		"alpha",
-- 		"packer",
-- 		"lspinfo",
-- 		"checkhealth",
-- 		"mason",
-- 		"null-ls-info",
-- 		"log",
-- 		"SidebarNvim",
-- 		"yaml",
-- 		"noice",
-- 		"neo-tree-popup"
-- 	},
-- })
-- vim.cmd("let g:indent_blankline_char = '▏'") -- indent char
-- vim.cmd("let g:indent_blankline_context_char = '▏'") -- emphasis indent char
-- vim.cmd("let g:indent_blankline_char_blankline = '▏'") -- char behind space
-- vim.cmd("let g:indent_blankline_show_first_indent_level = v:true")

-- vim.cmd("let g:indent_blankline_use_treesitter = v:true")
-- vim.cmd("let g:indent_blankline_show_current_context = v:true")
-- vim.cmd("let g:indent_blankline_show_current_context_start = v:true")
