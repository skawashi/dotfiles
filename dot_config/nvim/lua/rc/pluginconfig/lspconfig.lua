-- local status, mason = pcall(require, 'mason')
-- if (not status) then return end
-- local status2, mason_lspconfig = pcall(require, 'mason-lspconfig')
-- if (not status2) then return end
-- local status3, lspconfig = pcall(require, 'lspconfig')
-- if (not status3) then return end

local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local lspconfig = require("lspconfig")

-- 1. LSP Sever management
local protocol = require("vim.lsp.protocol")
protocol.CompletionItemKind = {
	"", -- Text
	"", -- Method
	"", -- Function
	"", -- Constructor
	"", -- Field
	"", -- Variable
	"", -- Class
	"ﰮ", -- Interface
	"", -- Module
	"", -- Property
	"", -- Unit
	"", -- Value
	"", -- Enum
	"", -- Keyword
	"﬌", -- Snippet
	"", -- Color
	"", -- File
	"", -- Reference
	"", -- Folder
	"", -- EnumMember
	"", -- Constant
	"", -- Struct
	"", -- Event
	"ﬦ", -- Operator
	"", -- TypeParameter
}

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end

	--Enable completion triggered by <c-x><c-o>
	--local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
	--buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

	-- Mappings.
	local opts = { noremap = true, silent = true }

	-- See `:help vim.lsp.*` for documentation on any of the below functions
	buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	buf_set_keymap("n", "gf", "<cmd>lua vim.lsp.buf.format {async=true}<CR>", opts)
	-- buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
	-- buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
	-- buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	-- buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	-- buf_set_keymap("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	buf_set_keymap("n", "ga", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	-- buf_set_keymap("n", "ge", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
	buf_set_keymap("n", "g]", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
	buf_set_keymap("n", "g[", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
end

local tw_highlight = require('tailwind-highlight')
nvim_lsp.tailwindcss.setup({
	on_attach = function (client, bufnr)
		tw_highlight.setup(client, bufnr, {
			single_column = false,
			mode = 'background',
			debounce = 200,
		})
	end
})

-- Set up completion using nvim_cmp with LSP source
-- local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- mason_lspconfig.setup_handlers({
-- 	function(server)
-- 		lspconfig[server].setup({
-- 			on_attach = on_attach,
-- 			capabilities = capabilities,
-- 		})
-- 	end,
--
-- 	["intelephense"] = function()
-- 		lspconfig.intelephense.setup({
-- 			on_attach = on_attach,
-- 			capabilities = capabilities,
-- 			settings = {
-- 				intelephense = {
-- 					files = {
-- 						exclude = {
-- 							"**/.git/**",
-- 							"**/.svn/**",
-- 							"**/.hg/**",
-- 							"**/CVS/**",
-- 							"**/.DS_Store/**",
-- 							"**/node_modules/**",
-- 							"**/bower_components/**",
-- 							"**/vendor/**/{Tests,tests}/**",
-- 							"**/.history/**",
-- 							"**/vendor/**/vendor/**",
-- 							"**/*.blade.php",
-- 						},
-- 					},
-- 					-- for Laravel config
-- 					diagnostics = {
-- 						undefinedClassConstants = false,
-- 						undefinedConstants = false,
-- 						undefinedFunctions = false,
-- 						undefinedMethods = false,
-- 						undefinedProperties = false,
-- 						undefinedTypes = false,
-- 					},
-- 				},
-- 			},
-- 		})
-- 	end,
-- })

-- 2. build-in LSP function
-- keyboard shortcut
-- LSP handlers
vim.lsp.handlers["textDocument/publishDiagnostics"] =
	vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false })

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "single", -- "shadow" , "none", "rounded"
	-- border = border
	-- width = 100,
})

