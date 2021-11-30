-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    -- Enable completion triggered by <c-x><c-o>
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    local opts = { noremap=true, silent=true }

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'pyright', 'gopls' }
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


-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- luasnip setup
local luasnip = require 'luasnip'

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
  snippet = {
	expand = function(args)
	  require('luasnip').lsp_expand(args.body)
	end,
  },
  mapping = {
	['<C-p>'] = cmp.mapping.select_prev_item(),
	['<C-n>'] = cmp.mapping.select_next_item(),
	['<C-d>'] = cmp.mapping.scroll_docs(-4),
	['<C-f>'] = cmp.mapping.scroll_docs(4),
	['<C-Space>'] = cmp.mapping.complete(),
	['<C-e>'] = cmp.mapping.close(),
	['<CR>'] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Replace,
	    select = false,
	},
	['<Tab>'] = function(fallback)
	  if cmp.visible() then
		cmp.select_next_item(cmp.SelectBehavior.Insert)
	  elseif luasnip.expand_or_jumpable() then
		luasnip.expand_or_jump()
	  else
		fallback()
	  end
	end,
	['<S-Tab>'] = function(fallback)
	  if cmp.visible() then
		cmp.select_prev_item(cmp.SelectBehavior.Insert)
	  elseif luasnip.jumpable(-1) then
		luasnip.jump(-1)
	  else
		fallback()
	  end
	end,
  },
  sources = {
	{ 
		name = 'nvim_lsp',
  		max_item_count=3,
	},
	{ name = 'luasnip' },
	{ name = 'nvim_lua' },
	{ name = 'path' },
  },
  completion = {
  	keyword_length = 1
  },
}
