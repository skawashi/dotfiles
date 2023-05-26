local comment = require("Comment")

comment.setup({
	---Pre-hook, called before commenting the line
	---@type function|nil
	pre_hook = function()
		return require("ts_context_commentstring.internal").calculate_commentstring()
	end,
})
