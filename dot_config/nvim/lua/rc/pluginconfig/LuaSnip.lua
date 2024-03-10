local ls = require("luasnip")
local types = require("luasnip.util.types")
local snip = ls.snippet
local text = ls.text_node
local insert = ls.insert_node

-- Every unspecified option will be set to the default.
ls.setup({
	keep_roots = true,
	link_roots = true,
	link_children = true,
	history = true,
	-- Update more often, :h events for more info.
	updateevents = "TextChanged,TextChangedI",
	-- Snippets aren't automatically removed if their text is deleted.
	-- `delete_check_events` determines on which events (:h events) a check for
	-- deleted snippets is performed.
	-- This can be especially useful when `history` is enabled.
	delete_check_events = "TextChanged",
	ext_opts = { [types.choiceNode] = { active = { virt_text = { { "choiceNode", "Comment" } } } } },
	-- treesitter-hl has 100, use something higher (default is 200).
	ext_base_prio = 300,
	-- minimal increase in priority.
	ext_prio_increase = 1,
	enable_autosnippets = true,

	ft_func = function()
		return vim.split(vim.bo.filetype, ".", true)
	end,
})

-- in a lua file: search lua-, then c-, then all-snippets.
ls.filetype_extend("lua", { "c" })

-- in a cpp file: search c-snippets, then all-snippets only (no cpp-snippets!!).
ls.filetype_set("cpp", { "c" })
ls.filetype_extend("javascript", { "javascriptreact" })
ls.filetype_extend("javascript", { "html" })

-- oss library snippet
require("luasnip.loaders.from_vscode").lazy_load({
	paths = { vim.fn.stdpath("data") .. "/lazy/friendly-snippets" },
})
require("luasnip.loaders.from_vscode").lazy_load({
	paths = { vim.fn.stdpath("data") .. "/lazy/simple-react-snippets" },
}) -- You can pass { paths = "./my-snippets/"} as well

ls.filetype_extend("all", { "_" })

vim.keymap.set({"i"}, "<C-y>", function() ls.expand() end, { silent = true })
vim.keymap.set({"i", "s"}, "<c-n>", function() ls.jump(1) end, { silent = true })
vim.keymap.set({"i", "s"}, "<c-p>", function() ls.jump(-1) end, { silent = true })
