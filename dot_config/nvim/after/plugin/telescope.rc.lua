local status, telescope = pcall(require, 'telescope')
if (not status) then return end

local actions = require('telescope.actions')
local builtin = require('telescope.builtin')
local function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

local fb_actions = require 'telescope'.extensions.file_browser.actions

-- local themes = require('telescope.themes')
-- builtin.find_files(themes.get_dropdown())

telescope.setup({
  defaults = {
    mappings = {
      n = {
        ['q'] = actions.close
      },
    },
  },
  pickers = {
    find_files = {
      -- -- theme = 'dropdown',
      -- -- hijack_netrw = true,
      -- previewer = false,
      -- layout_config = { height = 40 },
    },
    live_grep = {
      --   theme = 'dropdown',
      --   hijack_netrw = true,
      -- previewer = false,
      --   layout_config = { height = 40 },
    },
  },
  extensions = {
    file_browser = {
      theme = 'dropdown',
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        -- your custom insert mode mappings
        ['i'] = {
          ['<C-w>'] = function() vim.cmd('normal vbd') end,
        },
        ['n'] = {
          -- your custom normal mode mappings
          ['N'] = fb_actions.create,
          ['h'] = fb_actions.goto_parent_dir,
          ['/'] = function()
            vim.cmd('startinsert')
          end
        },
      },
    },
    frecency = {
      theme = 'dropdown',
      hijack_netrw = true,
      previewer = false,
      layout_config = { height = 40 },
    },
  },
})

telescope.load_extension('file_browser')
telescope.load_extension('frecency')
telescope.load_extension('lazygit')
telescope.load_extension('packer')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fu', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<Leader>fo', builtin.oldfiles, {})
vim.keymap.set('n', '<Leader>fm', builtin.marks, {})
vim.keymap.set('n', '<Leader>fd', builtin.diagnostics, {})
vim.api.nvim_set_keymap('n', '<leader>fr', "<Cmd>lua require('telescope').extensions.frecency.frecency()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>fp', "<Cmd>lua require('telescope').extensions.packer.packer()<CR>", {noremap = true, silent = true})
vim.keymap.set('n', '<leader>fb', function()
  telescope.extensions.file_browser.file_browser({
    path = '%:p:h',
    cwd = telescope_buffer_dir(),
    respect_gitignore = false,
    hidden = true,
    grouped = true,
    previewer = false,
    initial_mode = 'normal',
    layout_config = { height = 40 }
  })
end,
  { silent = true })
