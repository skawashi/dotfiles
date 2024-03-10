local cmp = require("cmp")
local lspkind = require("lspkind")
local ls = require("luasnip")

cmp.setup({
	snippet = {
		expand = function(args)
			ls.lsp_expand(args.body)
		end,
	},

	sources = {
		{ name = "nvim_lsp" },
		-- { name = "nvim_lsp_signature_help", priority = 80 },
		-- { name = "nvim_lua", priority = 50 },
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "path" },
		{ name = "treesitter" },
		-- { name = "mocword" },
		-- { name = "cmp_tabnine", priority = 30 },
		{
			name = "dictionary",
			keyword_length = 2,
			priority = 10
		},
		{
			name = "spell",
			priority = 40,
			option = {
				keep_all_entries = false,
				enable_in_context = function()
					return true
				end,
			}
		},
	},

	mapping = cmp.mapping.preset.insert({
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<C-l>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<C-y>"] = cmp.mapping.confirm({ select = true }),
	}),

	formatting = {
		format = lspkind.cmp_format({
			mode = 'symbol',
			maxwidth = 50,
			ellipsis_char = '...',
			before = function(entry, vim_item)
				-- vim_item.abbr = string.sub(vim_item.abbr, 1, 20) -- 補完メニューで表示するサジェストの文字数制限
				-- vim_item.kind = lspkind.presets.default[vim_item.kind]
				vim_item.menu = ({
					nvim_lsp		= "[LSP]",
					nvim_lua		= "[NeoVimLua]",
					luasnip			= "[LuaSnip]",
					dictionary	= "[Dictionary]",
					buffer			= "[Buffer]",
					cmp_tabnine = "[TabNine]",
					look				= "[Look]",
					path				= "[Path]",
					mocword			= "[mocword]",
					spell				= "[Spell]",
					treesitter	= "[TS]",
				})[entry.source.name]
				return vim_item
			end,
		})
	},

	experimental = {
		ghost_text = true,
	},

	enabled = function()
		-- disable completion in comments
		local context = require("cmp.config.context")
		-- keep command mode completion enabled when cursor is in a comment
		if vim.api.nvim_get_mode().mode == "c" then
			return true
		else
			return not context.in_treesitter_capture("comment") and not context.in_syntax_group("comment")
		end
	end,
})

cmp.setup.cmdline("/", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "nvim_lsp_document_symbol" },
	}, {
		{ name = "buffer" },
	}),
})

cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "path" },
		{ name = "cmdline" },
	},
})

-- cmp.event:on(
--   'confirm_done',
--   cmp_autopairs.on_confirm_done()
-- )
