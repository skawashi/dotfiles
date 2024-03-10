local lspsaga = require("lspsaga")

lspsaga.setup({
	border_style = "double",
	-- symbol_in_winbar = {
	--   enable = true,
	-- },
	implement = {
		enable = false,
	},
	ui = {
		code_action = "",
		diagnostic = "",
		border = "double",
	},
	lightbulb = {
		enable = true,
	},
	outline = {
		win_width = 90,
		auto_preview = false,
	},
	symbol_in_winbar = {
		enable = false,
		show_file = false,
	},
})

-- lspsaga.init_lsp_saga({
--   border_style = "double",
--   -- symbol_in_winbar = {
--   --   enable = true,
--   -- },
--   code_action_lightbulb = {
--     enable = true,
--   },
--   show_outline = {
--     win_width = 90,
--     auto_preview = false,
--   },
-- })
--
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "K", "<Cmd>Lspsaga hover_doc<CR>", opts)
vim.keymap.set("n", "gF", "<Cmd>Lspsaga finder<CR>", opts)
-- vim.keymap.set('i', '<C-k>', '<Cmd>Lspsaga signature_help<CR>', opts)
vim.keymap.set("n", "gd", "<Cmd>Lspsaga peek_definition<CR>", opts)
vim.keymap.set("n", "gr", "<Cmd>Lspsaga rename ++project<CR>", opts)
vim.keymap.set("n", "g]", "<Cmd>Lspsaga diagnostic_jump_next<CR>", opts)
vim.keymap.set("n", "g[", "<Cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
vim.keymap.set("n", "<C-w>f", "<cmd>Lspsaga open_floaterm<CR>")
vim.keymap.set("t", "<C-w>f", [[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]])
