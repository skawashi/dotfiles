local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	----------------------------------------------------------------
	-- Installer
	{ "folke/lazy.nvim" },

	--------------------------------
	-- External Package Installer
	{
		"williamboman/mason.nvim",
		event = { "BufReadPre", "VimEnter" },
		build = ":MasonUpdate",
	},

	----------------------------------------------------------------
	-- Library

	--------------------------------
	-- Lua Library
	{ "nvim-lua/popup.nvim" },
	{ "nvim-lua/plenary.nvim" },
	{ "kkharji/sqlite.lua" },
	{ "MunifTanjim/nui.nvim" },

	--------------------------------
	-- Font Library
	{
		"nvim-tree/nvim-web-devicons",
		config = function ()
			require("rc/pluginconf/web-devicons")
		end,
	},

	----------------------------------------------------------------
	-- Color Scheme
	{
		"svrana/neosolarized.nvim",
		lazy = false,
		priority = 1000,
		dependencies = {
			"tjdevries/colorbuddy.nvim",
		},
	},

	----------------------------------------------------------------
	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPost" },
		build = ":TSUpdateSync",
		dependencies = {
			{ "JoosepAlviste/nvim-ts-context-commentstring" },
			{ "nvim-treesitter/nvim-treesitter-refactor" },
			{ "nvim-treesitter/nvim-tree-docs" },
			{ "yioneko/nvim-yati" },
			{ "mrjones2014/nvim-ts-rainbow" },
			{ "andymass/vim-matchup" },
			{ "windwp/nvim-ts-autotag" },
		},
	},

	--------------------------------
	-- Treesitter UI Customize
	{
		"m-demare/hlargs.nvim",
		event = "VeryLazy",
	},

	----------------------------------------------------------------
	-- LSP & Completion

	--------------------------------
	-- Language Server Protocol(LSP)
	{
		"neovim/nvim-lspconfig",
		config = function ()
			require("rc/pluginconf/lspconfig")
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		event = "BufReadPre",
	},

	--------------------------------
	-- Language Server Protocol(LSP)
	{
		"nvimdev/lspsaga.nvim",
		event = "LspAttach",
		dependencies = {
			{ "nvim-tree/nvim-web-devicons" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
	},
	{
		"folke/trouble.nvim",
		event = "VimEnter",
	},

	--------------------------------
	-- Auto Completion
	{
		"hrsh7th/nvim-cmp",
		event = "VimEnter",
		config = function ()
			require("rc/pluginconf/nvim-cmp")
		end,
		dependencies = {
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lsp-signature-help" },
			{ "hrsh7th/cmp-nvim-lsp-document-symbol" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "hrsh7th/cmp-nvim-lua" },
			{ "f3fora/cmp-spell" },
			{ "yutkat/cmp-mocword" },
			{ "uga-rosa/cmp-dictionary" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/vim-vsnip" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{
				"tzachar/cmp-tabnine",
				build = "./install.sh",
			},
			{ "ray-x/cmp-treesitter" },
			{
				"onsails/lspkind-nvim",
				config = function ()
					require("rc/pluginconf/lspkind-nvim")
				end,
			},
			{ "RRethy/nvim-treesitter-endwise"},
		},
	},
	----------------------------------------------------------------
	-- Appearance

	--------------------------------
	-- Startup Screen
	{
		"goolord/alpha-nvim",
		event = "BufEnter",
	},

	--------------------------------
	-- Statusline
	{
		"nvim-lualine/lualine.nvim",
		event = "VimEnter",
	},

	--------------------------------
	-- Bufferline
	{
		"akinsho/nvim-bufferline.lua",
		event = "VimEnter",
		dependencies = "nvim-tree/nvim-web-devicons",
	},

	--------------------------------
	-- Colorizer
	{
		"norcalli/nvim-colorizer.lua",
		event = "VeryLazy",
	},

	--------------------------------
	-- Scrollbar
	{
		"petertriho/nvim-scrollbar",
		event = "VimEnter",
		dependencies = { { "kevinhwang91/nvim-hlslens" } },
	},

	----------------------------------------------------------------
	-- Coding

	--------------------------------
	-- Reading Assitant
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "VimEnter",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
	},

	--------------------------------
	-- Writing Assitant
	{
		"nmac427/guess-indent.nvim",
		event = { "BufNewFile", "BufReadPre" },
		config = true,
	},
	{
		"yoshida-m-3/vim-im-select",
		event = "VeryLazy",
	},
	{
		"yutkat/wb-only-current-line.nvim",
		event = "VeryLazy",
	},

	--------------------------------
	-- Comment Out
	{
		"numToStr/Comment.nvim",
		event = "VeryLazy",
	},

	--------------------------------
	-- Lint
	{
		"jose-elias-alvarez/null-ls.nvim",
		event = "LspAttach",
	},

	--------------------------------
	-- Brackets
	-- {
	-- 	"hrsh7th/nvim-insx",
	-- 	event = "VimEnter",
	-- },
	-- {
	-- 	"altermo/ultimate-autopair.nvim",
	-- 	event = "VimEnter",
	-- },
	{
    "altermo/npairs-integrate-upair",
    dependencies = {
			{ "windwp/nvim-autopairs" },
			{ "altermo/ultimate-autopair.nvim" },
		},
		event = "VimEnter",
    config = function ()
			require("npairs-int-upair").setup({
				bs='u'
			})
    end,
	},

	----------------------------------------------------------------
	-- Editing
	{
		"kylechui/nvim-surround",
		event = "VeryLazy",
		config = true,
	},

	----------------------------------------------------------------
	-- Search
	{
		"kevinhwang91/nvim-hlslens",
		event = "VeryLazy",
	},
	{
		"rapan931/lasterisk.nvim",
		event = "VeryLazy",
	},

	----------------------------------------------------------------
	-- File Switcher

	--------------------------------
	-- Filer
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "main",
		event = "BufEnter",
	},

	----------------------------------------------------------------
	-- Standard Feature Enhancement

	--------------------------------
	-- Dot Repeat
	{
		"tpope/vim-repeat",
		event = "VeryLazy",
	},

	--------------------------------
	-- Manual
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
	},

	--------------------------------
	-- Command
	{
		"jghauser/mkdir.nvim",
		event = "VeryLazy",
	},

	--------------------------------
	-- Commandline
	{
		"hrsh7th/cmp-cmdline",
		event = "VimEnter",
	},
	{
		"dmitmel/cmp-cmdline-history",
		event = "VimEnter",
	},

	----------------------------------------------------------------
	-- Git
	{
		"lewis6991/gitsigns.nvim",
		event = "VimEnter",
	},
} -- Plugin List End

require("lazy").setup(plugins, {
	defaults = {
		lazy = true, -- should plugins be lazy-loaded?
	},
})

-- local status, packer = pcall(require, 'packer')
-- if (not status) then
--   print('Packer is not installed')
-- end

-- vim.cmd([[packadd packer.nvim]])

-- packer.startup(function(use)
-- use 'wbthomason/packer.nvim' -- Plugin manager

-- -- Editor
-- use 'nvim-lualine/lualine.nvim'   -- Statusline
-- use 'akinsho/nvim-bufferline.lua' -- Tab custom
-- use 'kwkarlwang/bufresize.nvim'   -- Buffer auto resize
-- use 'sidebar-nvim/sidebar.nvim'   -- Side bar
-- use {
--   'svrana/neosolarized.nvim',
--   requires = { 'tjdevries/colorbuddy.nvim' }
-- }
-- use 'goolord/alpha-nvim'
-- use { "nvim-neo-tree/neo-tree.nvim", branch = "v2.x", }
-- use "lukas-reineke/indent-blankline.nvim"
--
-- -- Library
-- use 'zsugabubus/crazy8.nvim' -- Auto define ts, sw, sts, et
-- use 'tpope/vim-repeat'
-- use 'machakann/vim-sandwich'
-- use 'numToStr/Comment.nvim'
-- use 'yutkat/wb-only-current-line.nvim'
-- use 'folke/which-key.nvim'
-- use 'yoshida-m-3/vim-im-select'
-- use 'hrsh7th/nvim-insx'
--
-- -- Motion
-- use {
--   'phaazon/hop.nvim',
--   branch = 'v2', -- optional but strongly recommended
--   config = function()
--     require 'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
--   end
-- }
-- use {
--   'jinh0/eyeliner.nvim',
--   config = function()
--     require 'eyeliner'.setup {
--       highlight_on_key = true
--     }
--   end
-- }
-- -- use 'ggandor/lightspeed.nvim'
-- use 'haya14busa/vim-edgemotion'
-- -- use 'machakann/vim-columnmove'
-- use 'justinmk/vim-ipmotion'    -- {, } の移動を強化
-- -- use 'bkad/CamelCaseMotion'
-- use 'osyo-manga/vim-milfeulle' -- <C-o>を強化
-- use 'kwkarlwang/bufjump.nvim'
-- use {
--   'cbochs/portal.nvim',
--   requires = {
--     "cbochs/grapple.nvim",  -- Optional: provides the "grapple" query item
--     "ThePrimeagen/harpoon", -- Optional: provides the "harpoon" query item
--   },
-- }
-- use 'rapan931/lasterisk.nvim'
--
-- use 'kevinhwang91/nvim-hlslens'
-- use 'petertriho/nvim-scrollbar'
-- use 'myusuf3/numbers.vim'
--
-- use 'haringsrob/nvim_context_vt'
-- use 'ntpeters/vim-better-whitespace'

-- use 'j-hui/fidget.nvim'
-- use 'rcarriga/nvim-notify'
-- use 'folke/trouble.nvim'
-- use 'folke/noice.nvim'
--
-- use 'tyru/open-browser.vim'
-- use 'norcalli/nvim-colorizer.lua'
--
-- -- Plugin library
-- use 'nvim-lua/plenary.nvim'       -- Common utilities
-- use 'nvim-tree/nvim-web-devicons' -- File icons
-- use 'nvim-lua/popup.nvim'
-- use 'kkharji/sqlite.lua'
-- use 'MunifTanjim/nui.nvim'
--
-- -- LSP
-- use 'neovim/nvim-lspconfig'
-- use 'williamboman/mason.nvim'
-- use 'williamboman/mason-lspconfig.nvim'
-- use 'folke/lsp-colors.nvim' use 'glepnir/lspsaga.nvim' -- LSP UIs
--
-- -- Completion
-- use 'hrsh7th/nvim-cmp'                     -- Completion
-- use 'onsails/lspkind-nvim'                 -- vscode-like pictograms
-- use 'hrsh7th/cmp-nvim-lsp'                 -- nvim-cmp source for neovim's built-in LSP
-- use 'hrsh7th/cmp-nvim-lsp-signature-help'  -- nvim-cmp source
-- use 'hrsh7th/cmp-nvim-lsp-document-symbol' -- nvim-cmp source
-- use 'hrsh7th/cmp-buffer'                   -- nvim-cmp source
-- use 'hrsh7th/cmp-path'                     -- nvim-cmp source
-- use 'hrsh7th/cmp-nvim-lua'                 -- nvim-cmp source
-- use 'f3fora/cmp-spell'
-- use 'yutkat/cmp-mocword'
-- use 'uga-rosa/cmp-dictionary'
-- use {
--   'tzachar/cmp-tabnine',
--   run = './install.sh',
--   requires = 'hrsh7th/nvim-cmp',
-- }
-- use 'hrsh7th/cmp-cmdline'  -- nvim-cmp source
-- use 'hrsh7th/vim-vsnip'    -- nvim-cmp source
-- use 'ray-x/cmp-treesitter' -- nvim-cmp source
-- -- use 'windwp/nvim-autopairs'
--
-- -- Linter, Formatter
-- use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server to inject LSP
-- use {
--   'nvim-treesitter/nvim-treesitter',
--   run = function()
--     require('nvim-treesitter.install').update({ with_sync = true })
--   end,
-- }
-- use {
--   "yioneko/nvim-yati",
--   tag = "*",
-- }
-- use 'windwp/nvim-ts-autotag' -- Install after TS installation have completed
-- use 'mrjones2014/nvim-ts-rainbow'
-- use 'JoosepAlviste/nvim-ts-context-commentstring'
-- use 'm-demare/hlargs.nvim' -- Highlight args
-- use 'andymass/vim-matchup'
--
-- -- FZF
-- use { 'nvim-telescope/telescope.nvim', tag = '0.1.0' }
-- use 'nvim-telescope/telescope-file-browser.nvim'
-- use 'nvim-telescope/telescope-frecency.nvim'
-- use 'nvim-telescope/telescope-packer.nvim'
--
-- -- Git
-- -- use  'TimUntersberger/neogit'
-- -- use  'sindrets/diffview.nvim'
-- -- use { 'akinsho/git-conflict.nvim', tag = "*", }
-- use 'lewis6991/gitsigns.nvim'
-- use 'kdheepak/lazygit.nvim' -- telescope extension
--
-- -- Language
-- use 'jwalton512/vim-blade'       -- blade
-- use 'mtdl9/vim-log-highlighting' -- Log
-- -- use({
-- --   'iamcco/markdown-preview.nvim', -- Markdown
-- --   run = function()
-- --     vim.fn["mkdp#util#install"]()
-- --   end,
-- -- })
--
-- -- install without yarn or npm
-- use({
--   "iamcco/markdown-preview.nvim",
--   run = function() vim.fn["mkdp#util#install"]() end,
-- })
-- -- use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })
--
-- -- Zen Mode
-- use 'folke/zen-mode.nvim'
--
-- -- startup time measurement
-- use 'dstein64/vim-startuptime'
--
-- -- similar to mkdir -p on linux
-- use 'jghauser/mkdir.nvim'
-- end) -- packer end

-- better-whitespace config
-- vim.cmd([[
--   let g:better_whitespace_operator='_s' " 削除コマンドのprefix変更
--   let g:strip_whitespace_on_save=1 " 保存時にスペース削除
--   let g:strip_whitespace_confirm=0 " 0:保存時にスペース削除の確認をしない
--   let g:better_whitespace_filetypes_blacklist = ['alpha', 'lspsagafinder']
--   autocmd FileType * EnableStripWhitespaceOnSave
-- ]])
--
-- -- vim-sandwich config
-- vim.cmd([[
--   runtime macros/sandwich/keymap/surround.vim
-- ]])
