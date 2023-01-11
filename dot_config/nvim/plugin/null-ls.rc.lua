local status, null_ls = pcall(require, 'null-ls')
if (not status) then return end

null_ls.setup({
    sources = {
        -- lua
        null_ls.builtins.formatting.stylua,

        -- php, laravel
        -- null_ls.builtins.diagnostics.phpstan,
        null_ls.builtins.formatting.phpcsfixer,
        null_ls.builtins.formatting.blade_formatter,

        -- yaml
        null_ls.builtins.formatting.yamlfmt,

        -- another
        -- null_ls.builtins.formatting.prettier,
        null_ls.builtins.diagnostics.vint,
    },
})

