-- require('leap').add_default_mappings()
-- vim.keymap.set({"n", "x", "o"}, "Ss", "<Plug>(leap-forward-to)")
-- vim.keymap.set({"n", "x", "o"}, "SS", "<Plug>(leap-backward-to)")

-- vim.api.nvim_set_hl(0, "LeapBackdrop", { link = "Comment" }) -- or some grey
vim.api.nvim_set_hl(0, "LeapMatch", {
	-- For light themes, set to 'black' or similar.
	fg = "white",
	bold = true,
	nocombine = true,
})
-- Of course, specify some nicer shades instead of the default "red" and "blue".
vim.api.nvim_set_hl(0, "LeapLabelPrimary", {
	fg = "#d33682",
	bold = true,
	nocombine = true,
})
vim.api.nvim_set_hl(0, "LeapLabelSecondary", {
	fg = "#fdf6e3",
	bold = true,
	nocombine = true,
})
-- Try it without this setting first, you might find you don't even miss it.
require("leap").opts.highlight_unlabeled_phase_one_targets = true
require("leap").opts.max_highlighted_traversal_targets = 500
require("leap").opts.case_sensitive = true
require("leap").opts.max_phase_one_targets = 3
require("leap").opts.safe_labels = {}
require("leap").opts.max_aot_targets = true
--
-- vim.keymap.set("n", "<Leader>s", function()
-- 	local current_window = vim.fn.win_getid()
-- 	require("leap").leap({ target_windows = { current_window } })
-- end)

-- stylua: ignore
require("leap").opts.labels = {
	"a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z",
	"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z",
	"0", "1", "2", "3", "4", "5", "6", "7", "8", "9",
	"!", '"', "#", "$", "%", "&", "'", "(", ")", "*", "+", ",", "-", ".", "/", ":", ";", "<", "=", ">", "?", "@",
	"[", "\\", "]", "^", "_", "`", "{", "|", "}", "~",
}

