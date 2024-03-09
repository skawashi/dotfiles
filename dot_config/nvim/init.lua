local has = function(x)
	return vim.fn.has(x) == 1
end
local is_mac = has("macunix")
local is_win = has("win32")

if not vim.g.vscode then -- For Neovim
	require("rc/base")
	require("rc/highlights")
	require("rc/maps")
	require("rc/plugins")
else -- For vscode
	require("rc/vscode")
end

if is_mac then
	require("rc/macos")
elseif is_win then
	require("rc/windows")
end
