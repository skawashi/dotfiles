local fidget = require("fidget")

fidget.setup({
	sources = {
		["null-ls"] = {
			ignore = true,
		}
	}
})

vim.cmd([[highlight FidgetTitle ctermfg=110 guifg=#6cb6eb]])
