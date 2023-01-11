-- local status, edge = pcall(require, 'vim-edgemotion')
-- if (not status) then return end

vim.cmd([[
  map <C-j> <Plug>(edgemotion-j)
  map <C-k> <Plug>(edgemotion-k)
]])
