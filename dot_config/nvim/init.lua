require("rc/base")
require("rc/highlights")
require("rc/maps")
require("rc/plugins")

local has = function(x)
  return vim.fn.has(x) == 1
end

local is_mac = has "macunix"
local is_win = has "win32"

if is_mac then
  require("rc/macos")
end
if is_win then
  require("rc/windows")
end
