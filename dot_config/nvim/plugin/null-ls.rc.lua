local status, null_ls = pcall(require, "null-ls")
if (not status) then return end

local sources = {
		-- lua
		-- null_ls.builtins.formatting.stylua,

		-- php, laravel
		-- null_ls.builtins.diagnostics.phpstan,
		null_ls.builtins.formatting.phpcsfixer,
		null_ls.builtins.formatting.blade_formatter,

		-- yaml
		null_ls.builtins.formatting.yamlfmt,

		-- another
		-- null_ls.builtins.formatting.prettier,
		-- null_ls.builtins.diagnostics.eslint,
		null_ls.builtins.diagnostics.vint,

		null_ls.builtins.formatting.prettier.with({
				condition = function()
					return vim.fn.executable("prettier") > 0 or vim.fn.executable("./node_modules/.bin/prettier") > 0
				end,
		}),
		null_ls.builtins.diagnostics.eslint.with({
				condition = function()
					vim.o.fixendofline = true -- Error: [prettier/prettier] Insert `⏎`
					return vim.fn.executable("eslint") > 0 or vim.fn.executable("./node_modules/.bin/eslint") > 0
				end,
		}),
		null_ls.builtins.formatting.stylua.with({
				condition = function()
					return vim.fn.executable("stylua") > 0
				end,
		}),
}

null_ls.setup({
		diagnostics_format = "[#{c}] #{m} (#{s})",
		sources = sources,
})
