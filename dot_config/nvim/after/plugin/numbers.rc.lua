-- local status, numbers = pcall(require, 'numbers')
-- if (not status) then return end

-- numbers.setup({})
vim.cmd([[
  let g:numbers_exclude = ['tagbar', 'gundo', 'minibufexpl', 'nerdtree', 'alpha']
]])
