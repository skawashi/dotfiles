local status, autopairs = pcall(require, 'nvim-autopairs')
if (not status) then return end

autopairs.setup({})
local map_c_h = true
