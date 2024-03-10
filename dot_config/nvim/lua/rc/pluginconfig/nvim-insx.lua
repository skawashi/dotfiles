local insx = require("insx")
local esc = require("insx.helper.regex").esc
local helper = require("insx.helper")

for _, quote in ipairs({ '"', "'", "`" }) do
	require("insx").add(
		"<CR>",
		require("insx.recipe.fast_break")({
			open_pat = esc(quote),
			close_pat = esc(quote),
			html_attrs = true,
			html_tags = true,
		})
	)
end

-- for open, close in pairs({
-- 	["("] = ")",
-- 	["["] = "]",
-- 	["{"] = "}",
-- }) do
-- 	insx.add(
-- 		"<Space>",
-- 		require("insx.recipe.pair_spacing").increase({
-- 			open_pat = esc(open),
-- 			close_pat = esc(close),
-- 		})
-- 	)
-- 	insx.add(
-- 		"<BS>",
-- 		require("insx.recipe.pair_spacing").decrease({
-- 			open_pat = esc(open),
-- 			close_pat = esc(close),
-- 		})
-- 	)
-- 	insx.add(
-- 		"<C-h>",
-- 		require("insx.recipe.pair_spacing").decrease({
-- 			open_pat = esc(open),
-- 			close_pat = esc(close),
-- 		})
-- 	)
-- end
