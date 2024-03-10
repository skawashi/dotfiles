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

local plugins

plugins = {
	----------------------------------------------------------------
	-- Installer
	{ "folke/lazy.nvim" },

	--------------------------------
	-- External Package Installer
	{
		"williamboman/mason.nvim",
		event = { "BufReadPre", "VeryLazy" },
		build = ":MasonUpdate",
		config = function()
			require("rc/pluginconfig/mason")
		end,
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
		tag = "nerd-v2-compat",
		config = function()
			require("rc/pluginconfig/nvim-web-devicons")
		end,
	},

	--------------------------------
	-- UI Library
	{
		"stevearc/dressing.nvim",
		event = "VeryLazy",
		config = function()
			require("rc/pluginconfig/dressing")
		end,
	},

	--------------------------------
	-- Notify

	{
		"rcarriga/nvim-notify",
		event = "BufReadPre",
		config = function()
			require("rc/pluginconfig/nvim-notify")
		end,
	},

	----------------------------------------------------------------
	-- Color Scheme
	{
		"svrana/neosolarized.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("rc/pluginconfig/neosolarized")
		end,
		dependencies = {
			{ "tjdevries/colorbuddy.nvim" },
		},
	},

	----------------------------------------------------------------
	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		-- lazy = false,
		-- priority = 800,
		event = "BufReadPost",
		build = ":TSUpdateSync",
		config = function()
			require("rc/pluginconfig/nvim-treesitter")
		end,
		dependencies = {
			{ "JoosepAlviste/nvim-ts-context-commentstring" },
			{ "nvim-treesitter/nvim-treesitter-refactor" },
			{ "nvim-treesitter/nvim-tree-docs" },
			{ "yioneko/nvim-yati" },
			-- { "mrjones2014/nvim-ts-rainbow" },
			{ "andymass/vim-matchup" },
			{
				"windwp/nvim-ts-autotag",
				config = function()
					require("rc/pluginconfig/nvim-ts-autotag")
				end,
			},
			{ "RRethy/nvim-treesitter-endwise" },
		},
	},

	--------------------------------
	-- Treesitter Textobject
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		event = "VeryLazy",
	},

	--------------------------------
	-- Treesitter UI Customize
	{
		"HiPhish/rainbow-delimiters.nvim",
		event = "BufReadPost",
		config = function()
			-- patch https://github.com/nvim-treesitter/nvim-treesitter/issues/1124
			vim.cmd.edit({ bang = true })
		end,
	},
	{
		"m-demare/hlargs.nvim",
		event = { "BufNewFile", "BufRead" },
		config = function()
			require("rc/pluginconfig/hlargs")
		end,
	},
	{
		"romgrk/nvim-treesitter-context",
		cmd = { "TSContextEnable" },
		config = true,
	},
	----------------------------------------------------------------
	-- LSP & Completion

	--------------------------------
	-- Language Server Protocol(LSP)
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("rc/pluginconfig/nvim-lspconfig")
		end,
		dependencies = {
			"princejoogie/tailwind-highlight.nvim",
		},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		event = "BufReadPre",
		config = function()
			require("rc/pluginconfig/mason-lspconfig")
		end,
		dependencies = {
			{
				"weilbith/nvim-lsp-smag",
				after = "nvim-lspconfig",
			},
		},
	},

	--------------------------------
	-- LSP's UI
	{
		"nvimdev/lspsaga.nvim",
		event = "LspAttach",
		-- commit = "a224b2a", -- maybe sable version
		config = function()
			require("rc/pluginconfig/lspsaga")
		end,
		dependencies = {
			-- { "neovim/nvim-lspconfig" },
			{ "nvim-tree/nvim-web-devicons" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
	},
	{
		"folke/lsp-colors.nvim",
		event = "VeryLazy",
		config = function()
			require("rc/pluginconfig/lsp-colors")
		end,
	},
	{
		"folke/trouble.nvim",
		-- event = { "BufNewFile", "BufRead" },
		keys = ":",
	},
	{
		"j-hui/fidget.nvim",
		tag = "legacy",
		event = "LspAttach",
		config = function()
			require("rc/pluginconfig/fidget")
		end,
	},

	--------------------------------
	-- Auto Completion
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		keys = ":",
		config = function()
			require("rc/pluginconfig/nvim-cmp")
		end,
		dependencies = {
			{ "hrsh7th/cmp-nvim-lsp" },
			-- { "hrsh7th/cmp-nvim-lsp-signature-help" },
			{ "hrsh7th/cmp-nvim-lsp-document-symbol" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "hrsh7th/cmp-nvim-lua" },
			{ "f3fora/cmp-spell" },
			{ "yutkat/cmp-mocword" },
			{ "uga-rosa/cmp-dictionary" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{
				"tzachar/cmp-tabnine",
				build = "./install.sh",
			},
			{ "ray-x/cmp-treesitter" },
			{
				"onsails/lspkind-nvim",
				config = function()
					require("rc/pluginconfig/lspkind-nvim")
				end,
			},
		},
	},
	----------------------------------------------------------------
	-- Appearance

	--------------------------------
	-- Startup Screen
	{
		"goolord/alpha-nvim",
		event = "BufEnter",
		config = function()
			require("rc/pluginconfig/alpha-nvim")
		end,
	},

	--------------------------------
	-- Statusline
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		config = function()
			require("rc/pluginconfig/lualine")
		end,
	},

	--------------------------------
	-- Bufferline
	{
		"akinsho/nvim-bufferline.lua",
		event = "VeryLazy",
		config = function()
			require("rc/pluginconfig/bufferline")
		end,
		dependencies = {
			{ "nvim-tree/nvim-web-devicons" },
		},
	},

	--------------------------------
	-- Highlight
	{
		"xiyaowong/nvim-cursorword",
		event = "BufRead",
		config = function()
			require("rc/pluginconfig/nvim-cursorword")
		end,
	},
	{
		"folke/todo-comments.nvim",
		event = "VeryLazy",
		config = function()
			require("rc/pluginconfig/todo-comments")
		end,
	},
	--------------------------------
	-- Colorizer
	{
		"norcalli/nvim-colorizer.lua",
		-- lazy = false,
		-- priority = 900,
		event = "BufReadPre",
		config = function()
			require("rc/pluginconfig/nvim-colorizer")
		end,
	},

	--------------------------------
	-- Scrollbar
	{
		"petertriho/nvim-scrollbar",
		event = { "BufNewFile", "BufRead" },
		config = function()
			require("rc/pluginconfig/nvim-scrollbar")
		end,
		dependencies = {
			{ "kevinhwang91/nvim-hlslens" },
		},
	},

	--------------------------------
	-- Hover UI
	{
		"lewis6991/hover.nvim",
		event = "VeryLazy",
		config = function()
			require("rc/pluginconfig/hover")
		end,
	},

	----------------------------------------------------------------
	-- Coding

	--------------------------------
	-- Reading Assitant
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		event = { "BufNewFile", "BufRead" },
		config = function()
			require("rc/pluginconfig/indent-blankline")
		end,
		dependencies = {
			{ "nvim-treesitter/nvim-treesitter" },
		},
	},

	--------------------------------
	-- Writing Assitant
	{
		"nmac427/guess-indent.nvim",
		event = { "BufNewFile", "BufReadPre" },
		config = true,
	},

	-- you need to install im-select in pc.
	-- {
	-- 	"yoshida-m-3/vim-im-select",
	-- 	event = "ModeChanged",
	-- 	config = function()
	-- 		require("rc/pluginconfig/vim-im-select")
	-- 	end,
	-- },
	{
		"keaising/im-select.nvim",
		event = "ModeChanged",
		config = function()
			require("rc/pluginconfig/im-select")
		end,
	},
	{
		"ntpeters/vim-better-whitespace",
		event = "BufRead",
		config = function()
			-- require("rc/pluginconfig/vim-better-whitespace.lua")
			vim.cmd([[
				let g:better_whitespace_operator='_s' " 削除コマンドのprefix変更
				let g:strip_whitespace_on_save=0 " 保存時にスペース削除
				let g:strip_whitespace_confirm=0 " 0:保存時にスペース削除の確認をしない
				let g:better_whitespace_filetypes_blacklist = ['alpha', 'lspsagafinder']
				autocmd FileType * EnableStripWhitespaceOnSave
			]])
		end,
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
		config = function()
			require("rc/pluginconfig/Comment")
		end,
	},

	--------------------------------
	-- Lint
	{
		"jose-elias-alvarez/null-ls.nvim",
		event = "LspAttach",
		config = function()
			require("rc/pluginconfig/null-ls")
		end,
	},

	--------------------------------
	-- Snippet
	{
		"L3MON4D3/LuaSnip",
		event = "ModeChanged",
		config = function()
			require("rc/pluginconfig/LuaSnip")
		end,
		dependencies = {
			{ "rafamadriz/friendly-snippets" },
			{ "burkeholland/simple-react-snippets" },
		},
	},
	--------------------------------
	-- Brackets
	{
		'windwp/nvim-autopairs',
		event = "InsertEnter",
		config = function ()
			require("rc/pluginconfig/nvim-autopairs")
		end
	},

	--------------------------------
	-- html tag fast brake
	{
		"hrsh7th/nvim-insx",
		event = "InsertEnter",
		config = function()
			require("rc/pluginconfig/nvim-insx")
		end,
	},

	-- {
	-- 	"altermo/ultimate-autopair.nvim",
	-- 	event = "VeryLazy",
	-- },
	-- {
	-- 	"altermo/npairs-integrate-upair",
	-- 	event = "ModeChanged",
	-- 	config = function()
	-- 		require("npairs-int-upair").setup({
	-- 			bs = "u",
	-- 		})
	-- 	end,
	-- 	dependencies = {
	-- 		{ "windwp/nvim-autopairs" },
	-- 		{ "altermo/ultimate-autopair.nvim" },
	-- 	},
	-- },

	----------------------------------------------------------------
	-- Editing

	--------------------------------
	-- Move
	-- {
	-- 	"ggandor/leap.nvim",
	-- 	-- lazy = false,
	-- 	-- priority = 800,
	-- 	event = "VeryLazy",
	-- 	dependencies = {
	-- 		{
	-- 			"yutkat/leap-word.nvim",
	-- 			config = function()
	-- 				require("rc/pluginconfig/leap-word")
	-- 			end,
	-- 		},
	-- 	},
	-- 	config = function()
	-- 		require("rc/pluginconfig/leap")
	-- 	end,
	-- },
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		config = function()
			require("rc/pluginconfig/flash")
		end,
	},
	--------------------------------
	-- Horizontal Move
	-- {
	-- 	"jinh0/eyeliner.nvim",
	-- 	event = "VeryLazy",
	-- 	config = function()
	-- 		require("rc/pluginconfig/eyeliner")
	-- 	end,
	-- },
	-- {
	-- 	"ggandor/flit.nvim",
	-- 	event = "VeryLazy",
	-- 	config = function()
	-- 		require("rc/pluginconfig/flit")
	-- 	end,
	-- 	dependencies = {
	-- 		{	"ggandor/leap.nvim" },
	-- 	},
	-- },
	{
		"chrisgrieser/nvim-spider",
		event = "VeryLazy",
		config = function()
			require("rc/pluginconfig/nvim-spider")
		end,
	},
	--------------------------------
	-- Operater
	{
		"kylechui/nvim-surround",
		event = "VeryLazy",
		config = true,
	},

	-----------------
	-- Adding and subtracting
	{
		"monaqa/dial.nvim",
		event = "VeryLazy",
		config = function()
			require("rc/pluginconfig/dial")
		end,
	},

	----------------------------------------------------------------
	-- Search
	{
		"kevinhwang91/nvim-hlslens",
		event = "VeryLazy",
		config = function()
			require("rc/pluginconfig/nvim-hlslens")
		end,
	},
	{
		"rapan931/lasterisk.nvim",
		event = "VeryLazy",
		config = function()
			require("rc/pluginconfig/lasterisk")
		end,
	},

	----------------------------------------------------------------
	-- File Switcher

	--------------------------------
	-- Filer
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		keys = "<leader>s",
		config = function()
			require("rc/pluginconfig/neo-tree")
		end,
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-tree/nvim-web-devicons" }, -- not strictly required, but recommended
			{ "MunifTanjim/nui.nvim" },
		},
	},

	--------------------------------
	-- FuzzyFinder
	{
		"nvim-telescope/telescope.nvim",
		-- event = { "VeryLazy" },
		tag = "0.1.1",
		keys = "<leader>f",
		config = function()
			require("rc/pluginconfig/telescope")
		end,
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope-frecency.nvim" },
			{ "nvim-telescope/telescope-file-browser.nvim" },
		},
	},
	-- {
	-- 	"nvim-telescope/telescope-frecency.nvim",
	-- 	event = "VeryLazy",
	-- 	config = function()
	-- 		require("telescope").load_extension("frecency")
	-- 	end,
	-- },
	-- {
	-- 	"nvim-telescope/telescope-file-browser.nvim",
	-- 	event = "VeryLazy",
	-- 	config = function ()
	-- 		require("telescope").load_extension("file_browser")
	-- 	end,
	-- },

	-- prevent to open window in sidebar and trrouble .etc
	{
		'stevearc/stickybuf.nvim',
		event = "VeryLazy",
		opts = {},
		config = function()
			require("rc/pluginconfig/stickybuf")
		end
	},

	----------------------------------------------------------------
	-- Terminal

	--------------------------------
	-- Terminal Multiplexer
	{
		"alexghergh/nvim-tmux-navigation",
		event = "BufRead",
		config = function()
			require("rc/pluginconfig/nvim-tmux-navigation")
		end,
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
	-- Fold
	{
		"kevinhwang91/nvim-ufo",
		event = "BufRead",
		config = function()
			require("rc/pluginconfig/nvim-ufo")
		end,
		dependencies = {
			{ "kevinhwang91/promise-async" },
			{ "neovim/nvim-lspconfig" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
	},

	--------------------------------
	-- Manual
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		config = function()
			require("rc/pluginconfig/which-key")
		end,
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
		"folke/noice.nvim",
		event = "VeryLazy",
		config = function()
			require("rc/pluginconfig/noice")
		end,
		dependencies = {
			{ "MunifTanjim/nui.nvim" },
			{ "rcarriga/nvim-notify" },
		},
	},
	{
		"hrsh7th/cmp-cmdline",
		event = "ModeChanged",
	},
	{
		"dmitmel/cmp-cmdline-history",
		event = "ModeChanged",
	},

	----------------------------------------------------------------
	-- Git
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufNewFile", "BufRead" },
		config = function()
			require("rc/pluginconfig/gitsigns")
		end,
	},
} -- Plugin List End

require("lazy").setup(plugins, {
	defaults = {
		lazy = true, -- should plugins be lazy-loaded?
	},
})
