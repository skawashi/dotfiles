local status, lasterisk = pcall(require, 'lasterisk')
if (not status) then return end

vim.keymap.set({ "n", "x" }, "*", function()
	lasterisk.search({ is_whole = false })
	require('hlslens').start()
end)
vim.keymap.set({ "n", "x" }, "g*", function()
	lasterisk.search()
	require('hlslens').start()
end)
