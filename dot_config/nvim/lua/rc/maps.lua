local keymap = vim.keymap

--Remap C-w as leader key
-- keymap.set('', '<C-w>', '<Nop>', opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Modes
--   normal_mode = 'n',
--   insert_mode = 'i',
--   visual_mode = 'v',
--   visual_block_mode = 'x',
--   term_mode = 't',
--   command_mode = 'c',
--

-- Do not yank with x
-- keymap.set('n', 'x', ''_x')

-- Replace
keymap.set('', '<C-h>', '<BS>')

-- Increment/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- New tab
keymap.set('n', 'te', ':tabedit<Return>', { silent = true })

-- Split Window
keymap.set('n', '<C-w>s', ':split<Return><C-w>w', { silent = true })
keymap.set('n', '<C-w>v', ':vsplit<Return><C-w>w', { silent = true })

-- Move Window
keymap.set('n', '<C-w>q', '<C-w>w')
keymap.set('n', '<C-w><left>', '<C-w>h')
keymap.set('n', '<C-w><right>', '<C-w>l')
keymap.set('n', '<C-w><up>', '<C-w>k')
keymap.set('n', '<C-w><down>', '<C-w>j')
keymap.set('n', '<C-w>h', '<C-w>h')
keymap.set('n', '<C-w>l', '<C-w>l')
keymap.set('n', '<C-w>k', '<C-w>k')
keymap.set('n', '<C-w>j', '<C-w>j')

-- Resize Window
keymap.set('n', '<C-w><left>', '<C-w><')
keymap.set('n', '<C-w><right>', '<C-w>>')
keymap.set('n', '<C-w><up>', '<C-w>+')
keymap.set('n', '<C-w><down>', '<C-w>-')
keymap.set('n', '<C-w>H', '<C-w><')
keymap.set('n', '<C-w>L', '<C-w>>')
keymap.set('n', '<C-w>K', '<C-w>+')
keymap.set('n', '<C-w>J', '<C-w>-')

-- Reset highlihgt
keymap.set('n', '<Esc><Esc>', '<Cmd>noh<CR>', { silent = true })

-- Emacs like key bind
keymap.set({'i', 'c'}, '<C-b>', '<left>')
keymap.set({'i', 'c'}, '<C-f>', '<right>')

-- Space + o or O でノーマルモードのまま空行挿入
vim.cmd([[
  function! s:blank_above(type = '') abort
    if a:type == ''
      set operatorfunc=function('s:blank_above')
      return 'g@ '
    endif

    put! =repeat(nr2char(10), v:count1)
    normal! '[
  endfunction

  function! s:blank_below(type = '') abort
    if a:type == ''
      set operatorfunc=function('s:blank_below')
      return 'g@ '
    endif

    put =repeat(nr2char(10), v:count1)
  endfunction

  nnoremap <expr> <Space>o <sid>blank_below()
  nnoremap <expr> <Space>O <sid>blank_above()
]])
