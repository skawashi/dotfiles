local status, noice = pcall(require, 'noice')
if (not status) then return end

noice.setup({
	popupmenu = {
		backend = "cmp", -- backend to use to show regular cmdline completions
	},
	lsp = {
		progress = {
			enabled = false,
		},
		-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
			["cmp.entry.get_documentation"] = true,
		},
	},
	messages = {
		view_search = false,
	},
})
