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
vim.o.scrolloff = 5
vim.opt.termguicolors = true
vim.cmd[[colorscheme tokyonight]]

vim.cmd[[augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost * FormatWrite
augroup END]]

require'nvim-treesitter.configs'.setup {
    -- Modules and its options go here
    highlight = { enable = true },
    incremental_selection = { enable = true },
    rainbow = {
        enable = true,
        -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
        extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        max_file_lines = nil, -- Do not enable for files with more than n lines, int
        -- colors = {}, -- table of hex strings
        -- termcolors = {} -- table of colour name strings
    }
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

-- Utilities for creating configurations
local util = require "formatter.util"

-- Provides the Format and FormatWrite commands
require("formatter").setup {
  -- Enable or disable logging
  logging = true,
  -- Set the log level
  log_level = vim.log.levels.WARN,
  -- All formatter configurations are opt-in
  filetype = {
    -- Formatter configurations for filetype "lua" go here
    -- and will be executed in order
    lua = {
      -- "formatter.filetypes.lua" defines default configurations for the
      -- "lua" filetype
      require("formatter.filetypes.lua").stylua,

    },

    go = {
      require("formatter.filetypes.go").gofmt,
    },

  }
}


require('gitsigns').setup()
require('plugin_setting.cmp')
require('plugin_setting.lspconfig')
require('plugin_setting.lsp_signature')

