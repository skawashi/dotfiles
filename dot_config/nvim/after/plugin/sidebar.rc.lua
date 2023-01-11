local status, sidebar = pcall(require, 'sidebar-nvim')
if (not status) then return end

sidebar.setup({
  open = false,
  side = 'right',
  initial_width = 30,
  sections = {
    'datetime',
    'git',
    'diagnostics',
    'todos',
    'buffers',
  },
  datetime = {
    format = '%b/%d(%a) %H:%M:%S',
    clocks = {{ name = 'JPN'}},
  },
})

vim.keymap.set('n', '<leader>l', '<cmd>SidebarNvimToggle<CR>', { silent = true })

