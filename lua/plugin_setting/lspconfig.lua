-- Add additional capabilities supported by nvim-cmp
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Keybindings when a language server attaches to a buffer
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        local bufnr = args.buf
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'

        local opts = { noremap = true, silent = true, buffer = bufnr }

        -- See `:help vim.lsp.*` for documentation on any of the below functions
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
    end,
})

-- Configure LSP servers using vim.lsp.config (Neovim 0.11+)
vim.lsp.config('pyright', {
    capabilities = capabilities,
})

vim.lsp.config('gopls', {
    capabilities = capabilities,
})

vim.lsp.config('clangd', {
    capabilities = capabilities,
    cmd = { 'clangd', '--background-index', '--header-insertion=never' },
})

vim.lsp.config('cmake', {
    capabilities = capabilities,
    cmd = { vim.fn.stdpath('data') .. '/lsp_servers/cmake/venv/bin/cmake-language-server' },
})

-- Enable all configured servers
vim.lsp.enable({ 'pyright', 'gopls', 'clangd', 'cmake' })

vim.diagnostic.config({
    virtual_text = {
        spacing = 4,
        prefix = '',
        source = "always",
    },
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = false,
})
