vim.cmd([[
  let g:better_whitespace_operator='_s' " 削除コマンドのprefix変更
  let g:strip_whitespace_on_save=1 " 保存時にスペース削除
  let g:strip_whitespace_confirm=0 " 0:保存時にスペース削除の確認をしない
  let g:better_whitespace_filetypes_blacklist = ['alpha', 'lspsagafinder']
  autocmd FileType * EnableStripWhitespaceOnSave
]])
