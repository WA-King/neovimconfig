vim.o.number = true
vim.o.showmode =true;
vim.o.ignorecase = true
vim.o.cindent=true
vim.o.smarttab=true
vim.o.mouse = 'a'
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.cursorline = true
vim.o.swapfile = false
vim.cmd[[colorscheme tokyonight]]

require'nvim-treesitter.configs'.setup {
    -- Modules and its options go here
    highlight = { enable = true },
    incremental_selection = { enable = true },
}

require('lualine').setup {
	options = {theme = 'tokyonight' },
    sections = {
        lualine_z = {function() return os.date("%X") end }
    }
}

require('telescope').setup {
	defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
      i = {
		['kj']= require('telescope.actions').close
      },
	  n= {
		['q']= require('telescope.actions').close
	  }
    }
  },
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  }
}

require('telescope').load_extension('fzf')

require("indent_blankline").setup {}

require("bufferline").setup {
    options = {
        indicator_icon = '▎',
        buffer_close_icon = '',
        modified_icon = '●',
        close_icon = '',
        left_trunc_marker = '',
        right_trunc_marker = '',
        show_close_icon = false,
        diagnostics = "nvim_lsp" ,
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
            local icon = level:match("error") and " " or " "
            return " " .. icon .. count
        end,
    }
}

require('gitsigns').setup()
require('plugin_setting.cmp')
require('plugin_setting.lspconfig')
require('plugin_setting.lsp_signature')
