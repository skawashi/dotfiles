vim.cmd([[
  nmap <C-o> <Plug>(milfeulle-prev)
  nmap <C-i> <Plug>(milfeulle-next)

  " 保持単位をウィンドウに
	let g:milfeulle_default_kind = "buffer"

	" バッファ番号と位置を保存する
	" 別のバッファへ移動する場合、そのウィンドウでバッファを開く
	" let g:milfeulle_default_jumper_name = "bufnr_pos"
]])
