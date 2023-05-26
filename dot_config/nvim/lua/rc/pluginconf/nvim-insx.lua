-- require("insx.preset.standard").setup({})
local insx = require("insx")
local esc = require("insx.helper.regex").esc

-- -- quotes
for _, quote in ipairs({ '"', "`", "'" }) do
	-- delete_pair
	insx.add(
		"<c-h>",
		require("insx.recipe.delete_pair")({
			open_pat = esc(quote),
			close_pat = esc(quote),
			ignore_pat = ([[\\%s\%%#]]):format(esc(quote)),
		})
	)
end

-- brackets
for open, close in pairs({
	["("] = ")",
	["["] = "]",
	["{"] = "}",
	-- ["<"] = ">",
}) do
	-- jump_out
	insx.add(
		close,
		require("insx.recipe.jump_next")({
			jump_pat = {
				[[\%#]] .. esc(close) .. [[\zs]],
			},
		})
	)

	-- auto_pair
	insx.add(
		open,
		require("insx.recipe.auto_pair")({
			open = open,
			close = close,
			ignore_pat = [[\%#\w]],
		})
	)

	-- delete_pair
	insx.add(
		"<C-h>",
		require("insx.recipe.delete_pair")({
			open_pat = esc(open),
			close_pat = esc(close),
		})
	)

	-- spacing
	insx.add(
		"<Space>",
		require("insx.recipe.pair_spacing").increase({
			open_pat = esc(open),
			close_pat = esc(close),
		})
	)
	insx.add(
		"<C-h>",
		require("insx.recipe.pair_spacing").decrease({
			open_pat = esc(open),
			close_pat = esc(close),
		})
	)

	-- fast_break
	insx.add(
		"<CR>",
		require("insx.recipe.fast_break")({
			open_pat = esc(open),
			close_pat = esc(close),
			split = true,
		})
	)

	-- fast_wrap
	insx.add(
		"<C-]>",
		require("insx.recipe.fast_wrap")({
			close = close,
		})
	)
end
