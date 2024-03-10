local ok, null_ls = pcall(require, "null-ls")
if not ok then
	return
end

-- $XDG_CONFIG_HOME/cspell
local cspell_config_dir = "~/.config/cspell"
-- $XDG_DATA_HOME/cspell
local cspell_data_dir = "~/.local/share/cspell"
local cspell_files = {
	config = vim.call("expand", cspell_config_dir .. "/cspell.json"),
	dotfiles = vim.call("expand", cspell_config_dir .. "/dotfiles.txt"),
	vim = vim.call("expand", cspell_data_dir .. "/vim.txt.gz"),
	user = vim.call("expand", cspell_data_dir .. "/user.txt"),
}

-- vim辞書がなければダウンロード
if vim.fn.filereadable(cspell_files.vim) ~= 1 then
	local vim_dictionary_url = "https://github.com/iamcco/coc-spell-checker/raw/master/dicts/vim/vim.txt.gz"
	io.popen("curl -fsSLo " .. cspell_files.vim .. " --create-dirs " .. vim_dictionary_url)
end

-- ユーザー辞書がなければ作成
if vim.fn.filereadable(cspell_files.user) ~= 1 then
	io.popen("mkdir -p " .. cspell_data_dir)
	io.popen("touch " .. cspell_files.user)
end

local sources = {
	null_ls.builtins.diagnostics.cspell.with({
		diagnostics_postprocess = function(diagnostic)
			diagnostic.severity = vim.diagnostic.severity["WARN"]
		end,
		condition = function()
			return vim.fn.executable("cspell") > 0
		end,
		-- 起動時に設定ファイル読み込み
		extra_args = { "--config", cspell_files.config },
	}),

	-- php, laravel
	-- null_ls.builtins.diagnostics.phpstan,
	-- null_ls.builtins.formatting.phpcsfixer,
	null_ls.builtins.formatting.blade_formatter,

	-- yaml
	null_ls.builtins.formatting.yamlfmt,

	-- another
	-- null_ls.builtins.formatting.prettier,
	-- null_ls.builtins.diagnostics.eslint,
	null_ls.builtins.diagnostics.vint,

	-- null_ls.builtins.diagnostics.eslint.with({
	-- 	condition = function()
	-- 		vim.o.fixendofline = true -- Error: [prettier/prettier] Insert `⏎`
	-- 		return vim.fn.executable("eslint") > 0 or vim.fn.executable("./node_modules/.bin/eslint") > 0
	-- 	end,
	-- }),
	null_ls.builtins.diagnostics.eslint.with({
		prefer_local = "./node_modules/.bin",
	}),

	-- null_ls.builtins.formatting.prettier.with({
	-- 	condition = function()
	-- 		return vim.fn.executable("prettier") > 0 or vim.fn.executable("./node_modules/.bin/prettier") > 0
	-- 	end,
	-- }),
	null_ls.builtins.formatting.prettier.with({
		prefer_local = "node_modules/.bin",
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

---------------------------------------------------------------
-- cspell 単語追加
-- 参考: https://zenn.dev/kawarimidoll/articles/2e99432d27eda3
---------------------------------------------------------------
local cspell_append = function(opts)
	local word = opts.args
	if not word or word == "" then
		-- 引数がなければcwordを取得
		word = vim.call("expand", "<cword>"):lower()
	end

	-- bangの有無で保存先を分岐
	local dictionary_name = opts.bang and "dotfiles" or "user"

	-- shellのechoコマンドで辞書ファイルに追記
	io.popen("echo " .. word .. " >> " .. cspell_files[dictionary_name])

	-- 追加した単語および辞書を表示
	vim.notify('"' .. word .. '" is appended to ' .. dictionary_name .. " dictionary.", vim.log.levels.INFO, {})

	-- cspellをリロードするため、現在行を更新してすぐ戻す
	if vim.api.nvim_get_option_value("modifiable", {}) then
		vim.api.nvim_set_current_line(vim.api.nvim_get_current_line())
		vim.api.nvim_command("silent! undo")
	end
end

vim.api.nvim_create_user_command("CSpellAppend", cspell_append, { nargs = "?", bang = true })

local cspell_custom_actions = {
	name = "append-to-cspell-dictionary",
	method = null_ls.methods.CODE_ACTION,
	filetypes = {},
	generator = {
		fn = function(_)
			-- 現在のカーソル位置
			local lnum = vim.fn.getcurpos()[2] - 1
			local col = vim.fn.getcurpos()[3]

			-- 現在行のエラーメッセージ一覧
			local diagnostics = vim.diagnostic.get(0, { lnum = lnum })

			-- カーソル位置にcspellの警告が出ているか探索
			local word = ""
			local regex = "^Unknown word %((%w+)%)$"
			for _, v in pairs(diagnostics) do
				if v.source == "cspell" and v.col < col and col <= v.end_col and string.match(v.message, regex) then
					-- 見つかった場合、単語を抽出
					word = string.gsub(v.message, regex, "%1"):lower()
					break
				end
			end

			-- 警告が見つからなければ終了
			if word == "" then
				return
			end

			-- cspell_appendを呼び出すactionのリストを返却
			return {
				{
					title = 'Append "' .. word .. '" to user dictionary',
					action = function()
						cspell_append({ args = word })
					end,
				},
				{
					title = 'Append "' .. word .. '" to dotfiles dictionary',
					action = function()
						cspell_append({ args = word, bang = true })
					end,
				},
			}
		end,
	},
}

-- null_lsに登録
null_ls.register(cspell_custom_actions)
