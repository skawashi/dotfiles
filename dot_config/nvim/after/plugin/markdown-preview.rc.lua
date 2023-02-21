vim.api.nvim_create_user_command("Hoge", function()
	vim.cmd("e" .. "~/_/hoge.markdown")
end, {})

vim.keymap.set('n', '<leader>m', '<Cmd>MarkdownPreviewToggle<CR>')
vim.keymap.set('n', '<leader><leader>m', ':e ~/memo/')
