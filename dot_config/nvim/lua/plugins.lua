local status, packer = pcall(require, 'packer')
if (not status) then
  print('Packer is not installed')
end

vim.cmd([[packadd packer.nvim]])

packer.startup(function(use)
  use 'wbthomason/packer.nvim' -- Plugin manager

  -- Editor
  use 'nvim-lualine/lualine.nvim' -- Statusline
  use 'akinsho/nvim-bufferline.lua' -- Tab custom
  use 'kwkarlwang/bufresize.nvim' -- Buffer auto resize
  use 'sidebar-nvim/sidebar.nvim' -- Side bar
  use {
    'svrana/neosolarized.nvim',
    requires = { 'tjdevries/colorbuddy.nvim' }
  }
  use 'goolord/alpha-nvim'
  use { "nvim-neo-tree/neo-tree.nvim", branch = "v2.x", }
  use "lukas-reineke/indent-blankline.nvim"

  -- Library
  use 'zsugabubus/crazy8.nvim' -- Auto define ts, sw, sts, et
  use 'tpope/vim-repeat'
  use 'machakann/vim-sandwich'
  use 'numToStr/Comment.nvim'
  use 'yutkat/wb-only-current-line.nvim'
  use 'folke/which-key.nvim'
  use 'yoshida-m-3/vim-im-select'

  -- Motion
  use {
    'phaazon/hop.nvim',
    branch = 'v2', -- optional but strongly recommended
    config = function()
      require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  }
  use {
    'jinh0/eyeliner.nvim',
    config = function()
      require 'eyeliner'.setup {
        highlight_on_key = true
      }
    end
  }
  -- use 'ggandor/lightspeed.nvim'
  use 'haya14busa/vim-edgemotion'
  -- use 'machakann/vim-columnmove'
  use 'justinmk/vim-ipmotion' -- {, } の移動を強化
  -- use 'bkad/CamelCaseMotion'
  use 'osyo-manga/vim-milfeulle' -- <C-o>を強化
  use 'kwkarlwang/bufjump.nvim'
  use {
    'cbochs/portal.nvim',
    requires = {
      "cbochs/grapple.nvim",  -- Optional: provides the "grapple" query item
      "ThePrimeagen/harpoon", -- Optional: provides the "harpoon" query item
    },
  }

  use 'kevinhwang91/nvim-hlslens'
  use 'petertriho/nvim-scrollbar'
  use 'myusuf3/numbers.vim'

  use 'haringsrob/nvim_context_vt'
  use 'ntpeters/vim-better-whitespace'
  use 'j-hui/fidget.nvim'
  use 'rcarriga/nvim-notify'
  use 'folke/trouble.nvim'
  use 'folke/noice.nvim'

  use 'tyru/open-browser.vim'
  use 'norcalli/nvim-colorizer.lua'

  -- Plugin library
  use 'nvim-lua/plenary.nvim' -- Common utilities
  use 'nvim-tree/nvim-web-devicons' -- File icons
  use 'nvim-lua/popup.nvim'
  use 'kkharji/sqlite.lua'
  use 'MunifTanjim/nui.nvim'

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'folke/lsp-colors.nvim'
  use 'glepnir/lspsaga.nvim' -- LSP UIs

  -- Completion
  use 'hrsh7th/nvim-cmp' -- Completion
  use 'onsails/lspkind-nvim' -- vscode-like pictograms
  use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's built-in LSP
  use 'hrsh7th/cmp-nvim-lsp-signature-help' -- nvim-cmp source
  use 'hrsh7th/cmp-nvim-lsp-document-symbol' -- nvim-cmp source
  use 'hrsh7th/cmp-buffer' -- nvim-cmp source
  use 'hrsh7th/cmp-path' -- nvim-cmp source
  use 'hrsh7th/cmp-nvim-lua' -- nvim-cmp source
  use 'f3fora/cmp-spell'
  use 'yutkat/cmp-mocword'
  use 'uga-rosa/cmp-dictionary'
  use {
    'tzachar/cmp-tabnine',
    run='./install.sh',
    requires = 'hrsh7th/nvim-cmp',
  }
  use 'hrsh7th/cmp-cmdline' -- nvim-cmp source
  use 'hrsh7th/vim-vsnip' -- nvim-cmp source
  use 'ray-x/cmp-treesitter' -- nvim-cmp source
  use 'windwp/nvim-autopairs'

  -- Linter, Formatter
  use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server to inject LSP
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      require('nvim-treesitter.install').update({ with_sync = true })
    end,
  }
  use 'windwp/nvim-ts-autotag' -- Install after TS installation have completed
  use 'mrjones2014/nvim-ts-rainbow'
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  use 'm-demare/hlargs.nvim'   -- Highlight args
  use 'andymass/vim-matchup'

  -- FZF
  use { 'nvim-telescope/telescope.nvim', tag = '0.1.0' }
  use 'nvim-telescope/telescope-file-browser.nvim'
  use 'nvim-telescope/telescope-frecency.nvim'
  use 'nvim-telescope/telescope-packer.nvim'

  -- Git
  -- use  'TimUntersberger/neogit'
  -- use  'sindrets/diffview.nvim'
  -- use { 'akinsho/git-conflict.nvim', tag = "*", }
  use 'lewis6991/gitsigns.nvim'
  use 'kdheepak/lazygit.nvim' -- telescope extension

  -- Language
  use 'jwalton512/vim-blade' -- blade
  use 'mtdl9/vim-log-highlighting' -- Log
  use({
    'iamcco/markdown-preview.nvim', -- Markdown
    run = function()
      vim.fn["mkdp#util#install"]()
    end,
  })

  -- Zen Mode
  use 'folke/zen-mode.nvim'

  -- startup time measurement
  use 'dstein64/vim-startuptime'

end) -- packer end

-- better-whitespace config
vim.cmd([[
  let g:better_whitespace_operator='_s' " 削除コマンドのprefix変更
  let g:strip_whitespace_on_save=1 " 保存時にスペース削除
  let g:strip_whitespace_confirm=0 " 0:保存時にスペース削除の確認をしない
  let g:better_whitespace_filetypes_blacklist = ['alpha']
  autocmd FileType * EnableStripWhitespaceOnSave
]])

-- vim-sandwich config
vim.cmd([[
  runtime macros/sandwich/keymap/surround.vim
]])
