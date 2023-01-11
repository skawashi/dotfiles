local status, hlargs = pcall(require, 'hlargs')
if (not status) then return end

hlargs.setup({
  color = '#6c71c4',
})
hlargs.enable()
