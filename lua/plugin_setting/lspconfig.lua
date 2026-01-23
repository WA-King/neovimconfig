-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(_, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'

    local opts = { noremap = true, silent = true, buffer = bufnr }

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'pyright', 'gopls', }
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities,
    }
end

require('lspconfig').clangd.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = {'clangd','--background-index','--header-insertion=never'},
}


require'lspconfig'.cmake.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = { vim.fn.stdpath('data')..'/lsp_servers/cmake/venv/bin/cmake-language-server' },
}

vim.diagnostic.config({
  virtual_text = {
    spacing = 4,
    prefix = '',
    source = "always",
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = false,
})
