local status, portal = pcall(require, 'portal')
if (not status) then return end

portal.setup({})
vim.keymap.set("n", "<leader><leader>o", require("portal").jump_backward, {})
vim.keymap.set("n", "<leader><leader>i", require("portal").jump_forward, {})
