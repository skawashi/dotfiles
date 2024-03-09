local bufferline = require("bufferline")

vim.opt.mousemoveevent = true
bufferline.setup({
	options = {
		mode = "tabs",
		separator_style = "slant",
		always_show_bufferline = false,
		show_buffer_close_icons = false, -- a tab is closed
		show_close_icon = false, -- all tags are closed
		color_icons = true,
		buffer_close_icon = "󰅖",
		indicator = {
			style = "underline",
		},
		hover = {
			enabled = true,
			delay = 10,
			reveal = { "close" },
		},
		numbers = function(opts)
			return string.format("%s.%s", opts.ordinal, opts.lower(opts.id))
			-- return string.format("%s", opts.ordinal, opts.lower(opts.id))
		end,
		diagnostics = "nvim_lsp",
		diagnostics_indicator = function(count, level, diagnostics_dict, context)
			return "(" .. count .. ")"
		end,
		-- enforce_regular_tabs = true,
		-- sort_by = function(buffer_a, buffer_b)
		-- 	if not buffer_a and buffer_b then
		-- 		return true
		-- 	elseif buffer_a and not buffer_b then
		-- 		return false
		-- 	end
		-- 	return buffer_a.ordinal < buffer_b.ordinal
		-- end,
	},
	highlights = {
		separator = {
			fg = "#073642",
			bg = "#002b36",
		},
		separator_selected = {
			fg = "#073642",
		},
		background = {
			fg = "#657b83",
			bg = "#002b36",
		},
		buffer_selected = {
			fg = "#fdf6e3",
			bold = true,
		},
		fill = {
			bg = "#073642",
		},
		-- indicator_visible = {
		-- 	fg = "#fdf6e3",
		-- 	bg = "#fdf6e3",
		-- },
		-- indicator_selected = {
		-- 	fg = "#fdf6e3",
		-- 	bg = "#fdf6e3",
		-- },
	},
})

vim.keymap.set("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", {})
vim.keymap.set("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", {})
-- vim.keymap.set("n", "#", "<Cmd>BufferLineMoveNext<CR>", {})
-- vim.keymap.set("n", "@", "<Cmd>BufferLineMovePrev<CR>", {})

vim.keymap.set("n", "<Leader>1", function()
	require("bufferline").go_to_buffer(1, true)
end, { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>2", function()
	require("bufferline").go_to_buffer(2, true)
end, { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>3", function()
	require("bufferline").go_to_buffer(3, true)
end, { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>4", function()
	require("bufferline").go_to_buffer(4, true)
end, { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>5", function()
	require("bufferline").go_to_buffer(5, true)
end, { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>6", function()
	require("bufferline").go_to_buffer(6, true)
end, { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>7", function()
	require("bufferline").go_to_buffer(7, true)
end, { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>8", function()
	require("bufferline").go_to_buffer(8, true)
end, { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>9", function()
	require("bufferline").go_to_buffer(9, true)
end, { noremap = true, silent = true })
