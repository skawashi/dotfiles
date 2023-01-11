local status, im_select = pcall(require, 'vim-im-select')
if (not status) then return end

vim.cmd([[let g:im_select_default = 'com.apple.keylayout.ABC']])
