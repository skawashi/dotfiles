-- Modes
--   normal_mode = 'n',
--   insert_mode = 'i',
--   visual_mode = 'v',
--   visual_block_mode = 'x',
--   term_mode = 't',
--   command_mode = 'c',
--

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Do not yank with x
-- vim.keymap.set('n', 'x', ''_x')

-- Replace
vim.keymap.set("n", "<C-h>", "<BS>")

-- Increment/decrement
vim.keymap.set("n", "+", "<C-a>")
vim.keymap.set("n", "-", "<C-x>")

-- New tab
vim.keymap.set("n", "te", ":tabedit<Return>", { silent = true })

-- Split Window
vim.keymap.set("n", "<C-w>-", ":split<Return><C-w>w", { silent = true })
vim.keymap.set("n", "<C-w>\\", ":vsplit<Return><C-w>w", { silent = true })

-- Move Window
vim.keymap.set("n", "<C-w>q", "<C-w>w")
vim.keymap.set("n", "<C-w><left>", "<C-w>h")
vim.keymap.set("n", "<C-w><right>", "<C-w>l")
vim.keymap.set("n", "<C-w><up>", "<C-w>k")
vim.keymap.set("n", "<C-w><down>", "<C-w>j")
vim.keymap.set("n", "<C-w>h", "<C-w>h")
vim.keymap.set("n", "<C-w>l", "<C-w>l")
vim.keymap.set("n", "<C-w>k", "<C-w>k")
vim.keymap.set("n", "<C-w>j", "<C-w>j")
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-j>", "<C-w>j")

-- Resize Window
vim.keymap.set("n", "<C-w><left>", "<C-w><")
vim.keymap.set("n", "<C-w><right>", "<C-w>>")
vim.keymap.set("n", "<C-w><up>", "<C-w>+")
vim.keymap.set("n", "<C-w><down>", "<C-w>-")
vim.keymap.set("n", "<C-w>H", "<C-w><")
vim.keymap.set("n", "<C-w>L", "<C-w>>")
vim.keymap.set("n", "<C-w>K", "<C-w>+")
vim.keymap.set("n", "<C-w>J", "<C-w>-")

-- Reset highlihgt
vim.keymap.set("n", "<Esc><Esc>", "<Cmd>noh<CR>", { silent = true })

-- Emacs like key bind
vim.keymap.set({ "i", "c" }, "<C-b>", "<left>")
vim.keymap.set({ "i", "c" }, "<C-f>", "<right>")

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
