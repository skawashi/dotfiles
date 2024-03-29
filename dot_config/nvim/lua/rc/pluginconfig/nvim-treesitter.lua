local TS = require("nvim-treesitter.configs")

TS.setup({
  ensure_installed = {
    "lua",
    "vim",
    "bash",
    "markdown",
    "markdown_inline",
    "html",
    "css",
    "typescript",
    "javascript",
    "php",
  },
  highlight = {
    enable = true,
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
  },
  autotag = {
    enable = true,
    enable_close_on_slash = false,  -- 空要素（brやimg等の'/'で終わるタグのこと）を入力するときにバグるので無効に
  },
  -- context_commentstring = {  -- not reccomend in the future
  --   enable = true
  --  },
  -- rainbow = {  -- not reccomend
  --   enable = true,
  --   extended_mode = true,
  --   max_file_lines = 1000,
  --   colors = {
  --     "#dc322f",
  --     "#d33682",
  --     "#b58900",
  --     "#859900",
  --     "#2aa198",
  --     "#268bd2",
  --     "#6c71c4",
  --   }, -- table of hex strings
  --  },
  endwise = {
    enable = true,
  },
})

