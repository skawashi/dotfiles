local status, context_vt = pcall(require, 'nvim_context_vt')
if (not status) then return end

context_vt.setup({
  enabled = false,
})
vim.api.nvim_set_keymap("n", "<Leader>v", ":NvimContextVtToggle<CR>", { noremap = true, silent = true })
