vim.g.mapleader=' '
--insert
vim.api.nvim_set_keymap('i', 'kj', '<ESC>l',{})
vim.api.nvim_set_keymap('i', '{<CR>', '{<CR>}<ESC>O',{})
vim.api.nvim_set_keymap('i', '{<s-cr>', '{<CR>}<ESC>O',{noremap = true})

--normal
vim.api.nvim_set_keymap('n', '<C-a>', 'ggVG"+y',{ silent=true})
vim.api.nvim_set_keymap('n', '<C-x>', 'gg=G', { silent=true })
vim.api.nvim_set_keymap('n', '<C-p>', ':RnvimrToggle<CR>',{noremap = true, silent=true})
vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>',{silent=true})
vim.api.nvim_set_keymap('n', 'g<leader>', '2g;',{})
vim.api.nvim_set_keymap('n', '<F6>', ':lua require("tools").compile()<CR>',{})

vim.api.nvim_set_keymap('n', '<S-h>', '<C-w>h',{})
vim.api.nvim_set_keymap('n', '<S-l>', '<C-w>l',{})

vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>lua require("telescope.builtin").find_files()<CR>',{})
vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>lua require("telescope.builtin").live_grep()<CR>',{})
vim.api.nvim_set_keymap('n', '<leader>fb', '<cmd>lua require("telescope.builtin").buffers()<CR>',{})
vim.api.nvim_set_keymap('n', '<leader>fh', '<cmd>lua require("telescope.builtin").help_tags()<CR>',{})

vim.api.nvim_set_keymap("n", "<leader>1", "<Cmd>BufferLineGoToBuffer 1<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>2", "<Cmd>BufferLineGoToBuffer 2<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>3", "<Cmd>BufferLineGoToBuffer 3<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>4", "<Cmd>BufferLineGoToBuffer 4<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>5", "<Cmd>BufferLineGoToBuffer 5<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>6", "<Cmd>BufferLineGoToBuffer 6<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>7", "<Cmd>BufferLineGoToBuffer 7<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>8", "<Cmd>BufferLineGoToBuffer 8<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>9", "<Cmd>BufferLineGoToBuffer 9<CR>", {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>", {})
vim.api.nvim_set_keymap('n', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", {})
vim.api.nvim_set_keymap('n', '<leader>j', "<cmd>lua require'hop'.hint_char1()<cr>", {})

--lsp
vim.api.nvim_set_keymap('n', '<leader>ca', "<cmd>Lspsaga code_action<cr>", {silent = true})

vim.api.nvim_set_keymap('n', 'gd', "<cmd>lua vim.lsp.buf.definition()<cr>", {})

vim.api.nvim_set_keymap('n', 'gr', "<cmd>lua vim.lsp.buf.references()<cr>", {})
vim.api.nvim_set_keymap('n', 'gi', "<cmd>lua vim.lsp.buf.implementation()<cr>", {})

vim.keymap.set("n", "<C-t>", "<cmd>Lspsaga open_floaterm <CR>", { silent = true })
vim.keymap.set("t", "<C-t>", "<C-\\><C-n><cmd>Lspsaga close_floaterm<CR>", { silent = true })
--terminal
vim.api.nvim_set_keymap('t', '<C-w>', '<C-\\><C-n><C-w>',{noremap = true})
vim.api.nvim_set_keymap('t', '<C-h>', '<C-\\><C-n>:RnvimrToggle<CR>',{silent=true})
vim.api.nvim_set_keymap('t', '<S-h>', '<C-w>h',{})
vim.api.nvim_set_keymap('t', '<S-l>', '<C-w>l',{})

--visual
vim.api.nvim_set_keymap('v', 'kj', '<ESC>l',{})


vim.g.kommentary_create_default_mappings = false
vim.api.nvim_set_keymap("n", "<leader>cc", "<Plug>kommentary_line_default", {})
vim.api.nvim_set_keymap("n", "<leader>c", "<Plug>kommentary_motion_default", {})
vim.api.nvim_set_keymap("x", "<leader>c", "<Plug>kommentary_visual_default", {})

