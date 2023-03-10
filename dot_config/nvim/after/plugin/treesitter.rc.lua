local status, TS = pcall(require, 'nvim-treesitter.configs')
if (not status) then return end

TS.setup({
  ensure_installed = {
    'php',
    'lua',
    'vim',
  },
  highlight = {
    enable = true,
    disable = {     -- 一部の言語では無効にする
      -- 'lua',
      -- 'vue',
      -- 'php',
      -- 'help'
    }
  },
  indent = {
    enable = false,
    disable = {
      "python",
    },
  },
  yati = {
    enable = true,
    disable = {
      "markdown",
    },
  },
  matchup = {
    enable = true,
    disable = {
      -- 'c',
      -- 'ruby'
    },
    -- [options]
  },
  autotag = {
    enable = true,
  },
  context_commentstring = {
    enable = true
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = 1000,
    colors = {
      '#dc322f',
      '#d33682',
      '#b58900',
      '#859900',
      '#2aa198',
      '#268bd2',
      '#6c71c4',
    }, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  },
})
