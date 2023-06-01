vim.keymap.set({ "n", "x" }, "SS", function()
	require("leap").leap({
		targets = require("leap-word").get_backward_words(1), -- 1 means search word from one line up
	})
end)

vim.keymap.set({ "n", "x" }, "Ss", function()
	require("leap").leap({
		targets = require("leap-word").get_forward_words(1), -- 1 means search word from one line down
	})
end)
